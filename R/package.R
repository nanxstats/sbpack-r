#' @keywords internal
#'
#' @importFrom utils packageName
#' @importFrom reticulate import
"_PACKAGE"

#' Global reference to sbpack
#'
#' Global reference to sbpack which will be initialized in \code{.onLoad}.
#'
#' @return sbpack reference object
#'
#' @export pysbpack
pysbpack <- NULL

#' Global reference to py_pack_file
#'
#' Global reference to py_pack_file which will be initialized in \code{.onLoad}.
#'
#' @param ... not used
#'
#' @return py_pack_file function
#'
#' @export py_pack_file
py_pack_file <- NULL

#' Global reference to py_pack_sb
#'
#' Global reference to py_pack_sb which will be initialized in \code{.onLoad}.
#'
#' @param ... not used
#'
#' @return py_pack_sb function
#'
#' @export py_pack_sb
py_pack_sb <- NULL

.onLoad <- function(libname, pkgname) {
  pysbpack <<- reticulate::import("sbpack", delay_load = TRUE)

  pack_file <- reticulate::import_from_path(module = "pack_file", path = system.file("python", package = packageName()))
  py_pack_file <<- pack_file$py_pack_file

  pack_sb <- reticulate::import_from_path(module = "pack_sb", path = system.file("python", package = packageName()))
  py_pack_sb <<- pack_sb$py_pack_sb
}
