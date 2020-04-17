#' @keywords internal
.handleLastCommandError <- function(handle) {
  command <- GET(handle=handle, path="/lastcommand")
  
  jsonContent = content(command)
  if (jsonContent$status == "FAILED"){
    stop(paste0("Execution failed: ", jsonContent$message))
  }
}

#' @keywords internal
.handleBadRequest <- function(response) {
  if (response$status_code == 400){
    jsonContent = content(response)
    stop(paste0("Bad request: ", jsonContent$message))
  }
}