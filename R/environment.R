#' Configure python environment for 'alpacar'
#'
#' Creates a conda environment if needed, then configures that environment with
#'   the correct modules and python version for the 'alpacar' package.
#'
#' @param conda_env (optional) The name of the environment to be created or configured for
#'   'alpacar' If not "r-alpacar," the default, this environment must be
#'   specified in [alpaca_trade_api()].
#'
#' @section Note:
#' Requires miniconda installation: https://docs.conda.io/en/latest/miniconda.html
#'
#' @return [invisible()]
#'
#' @export
configure_env <- function(conda_env = "r-alpacar") {

  # first, check if miniconda is intalled on system
  if (!miniconda_exists()) {
    err_msg <- paste0(
      "Miniconda not found. Use reticulate::install_miniconda() or visit https://docs.conda.io/en/latest/miniconda.html to install"
    )
    stop(err_msg)
  }
  message("miniconda found!")

  # use r-alpacaR conda envionment
  tryCatch(
    {
      reticulate::conda_python(envname = conda_env)
    },
    error = function(e) {
      conda_envs <- reticulate::conda_list()
      env_exists <- conda_env %in% conda_envs$name
      if (!(env_exists)) {
        msg <- paste0("creating conda environment `", conda_env, "`")
        message(msg)
        reticulate::conda_create(conda_env)
        message("  done!")
      }
      return(invisible())
    }
  )

  message("python found!")

  py_mod <- "alpaca_trade_api"
  py_mod_print <- "alpaca-trade-api"

  tryCatch(
    {
      reticulate::use_condaenv(conda_env)
      message(paste0("environment `", conda_env, "` found!"))
      tryCatch(
        {
          reticulate::import(py_mod)
          message(paste0(py_mod_print, " found!"))
        },
        error = function(e) {
          version <- NULL
          message_str <- paste0(
            "Installing ", py_mod_print, " module into environment `", conda_env, "`"
          )
          # check python version compatible with reticulate
          # python version on reticulate trails latest python release
          # alpaca-trade-api supports python >= 3.7
          env_py_version <- reticulate::py_version()
          py_compatible <- python_is_compatible(env_py_version)
          if (!py_compatible) {
            # reticulate 1.25 will have an os-agnostic internal function to find the
            #   latest python version available for installation
            #   until then:
            latest_python <- "3.8.10"
            version <- latest_python
            message_str <- paste0(message_str, "\n  using python version ", version)
          }
          message_str <- paste0(message_str, "...")
          message(message_str)

          reticulate::conda_install(
            envname = conda_env,
            packages = c(py_mod),
            pip = TRUE,
            python_version = version
          )
        }
      )

      message("environment `", conda_env, "` fully configured.")
    },
    error = function(e) NULL
  )

  return(invisible())
}


import_module <- function(py_mod) {
  msg <- paste0(py_mod, " imported successfully")
  tryCatch(
    {
      mod <- reticulate::import(
        module = py_mod,
        delay_load = list(
          on_error = function(e) {
            mod <- NULL
            msg <- paste0(py_mod, " failed to import")
            return(NULL)
          }
        )
      )
    },
    error = function(e) {
      mod <- NULL
      msg <- paste0(py_mod, " failed to import")
      return(NULL)
    }
  )
  message(msg)
  return(mod)
}


miniconda_exists <- function() {
  exists <- TRUE
  # throws error if miniconda installation not found
  tryCatch(
    {
      reticulate::conda_binary()
    },
    error = function(e) {
      exists <<- FALSE
      NULL
    }
  )

  return(exists)
}


python_is_compatible <- function(py_version) {
  if (is.null(py_version)) {
    return(FALSE)
  }

  good_python <- grepl("^3\\.[78]", py_version)

  return(good_python)
}
