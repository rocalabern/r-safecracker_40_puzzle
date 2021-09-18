load_tools <- function(folder = "tools", env = .GlobalEnv, echo = FALSE, message_added = TRUE) {

  f_source <- function(x, env = .GlobalEnv, echo = FALSE, message_added = TRUE) {
    c_functions_pre <- lsf.str(envir=env)
    n_functions_pre <- length(as.array(c_functions_pre))
    source(x, local <- env, echo = echo, encoding = "utf8")
    c_functions_post <- lsf.str(envir=env)
    n_functions_post <- length(as.array(c_functions_post))
    if ((n_functions_post-n_functions_pre) == 1) {
      str_functions_added = paste0(" ", setdiff(c_functions_post, c_functions_pre)[1])
    } else if ((n_functions_post-n_functions_pre) > 0) {
      str_functions_added = paste0(" ", setdiff(c_functions_post, c_functions_pre)[1],", ...")
    } else {
      str_functions_added = ""
    }
    if (message_added) message(paste0("Added ",(n_functions_post-n_functions_pre)," functions.",str_functions_added," (script: ",x,")"))
  }

  c_tools_files <- list.files(folder, pattern = "\\.R$", full.names="TRUE", ignore.case = TRUE)
  f_source_custom <- function(x) {f_source(x, env = env, echo = echo, message_added = message_added)}
  lapply(c_tools_files, FUN = f_source_custom)
  invisible(NULL)
}
