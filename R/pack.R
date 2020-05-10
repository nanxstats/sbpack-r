#' Pack a CWL workflow and output a file
#'
#' @param input Path to the input CWL file
#' @param output Path to the output CWL file
#'
#' @return NULL
#'
#' @export pack_to_file
#'
#' @examples
#' input <- system.file("example/remote-cwl/wf1.cwl", package = "sbpack")
#' output <- tempfile(fileext = ".cwl")
#' pack_to_file(input, output)
#' cat(readLines(output), sep = "\n")
#'
#' input <- "https://raw.githubusercontent.com/rabix/sbpack/master/tests/wf2.cwl"
#' output <- tempfile(fileext = ".cwl")
#' pack_to_file(input, output)
#' cat(readLines(output), sep = "\n")
pack_to_file <- function(input, output) {
  input <- normalizePath(input, mustWork = FALSE)
  output <- normalizePath(output, mustWork = FALSE)
  py_pack_file(input, output)
  invisible()
}

#' Pack and upload CWL apps to any Seven Bridges powered platform
#'
#' @param input Path to the input CWL file. Can be a remote file.
#' @param profile Platform profile name defined in \code{~/.sevenbridges/credentials}.
#' @param id Destination app id in the form of \code{{user}/{project}/{app_id}}.
#' This will install (or update) \code{app_id} located in \code{project}
#' of \code{user} on the platform.
#'
#' @return NULL
#'
#' @export pack_to_sb
#'
#' @examples
#' \dontrun{
#' input <- system.file("example/remote-cwl/wf1.cwl", package = "sbpack")
#' pack_to_sb(input, "aws-us", "username/project/workflow")}
pack_to_sb <- function(input, profile, id) {
  input <- normalizePath(input, mustWork = FALSE)
  py_pack_sb(input, profile, id)
  invisible()
}
