#' Not.
#'
#' Invert an expression, i.e. NOT.
#'
#' @param object An object to get the logical inverse of.
#'
#' @examples
#' source_matches_google <- Expr(~source %matches% "google")
#' source_not_matching_google <- Not(source_matches_google)
#' identical(source_not_matching_google, !source_matches_google)
#'
#' @family boolean functions
#'
#' @aliases `!`
#'
#' @export
#' @rdname Not
setGeneric(
  "Not",
  function(object) {standardGeneric("Not")},
  valueClass = c(".comparator", ".compoundExpr", ".gaSegmentFilter")
)

#' Or.
#'
#' OR two or more expressions.
#'
#' @param object The first object to include within the OR expression.
#' @param ... Additional objects to include within the OR expression.
#'
#' @return An object of class orExpr.
#'
#' @examples
#' mobile_or_tablet <- Expr(~deviceCategory == "mobile") | Expr(~deviceCategory == "tablet")
#' converted <- Expr(~goalCompletionsAll > 0) | Expr(~transactions > 0)
#'
#' @family boolean functions
#'
#' @aliases `|`
#'
#' @export
#' @rdname Or
setGeneric(
  "Or",
  function(object, ...) {standardGeneric("Or")},
  valueClass = "orExpr"
)

#' And.
#'
#' AND two or more ganalytics expressions together.
#'
#' @param object The first object within the AND expression
#' @param ... Additional objects to include within the AND expression.
#'
#' @return an object of class \code{andExpr}
#'
#' @examples
#' purchased_on_mobile <- Expr(~deviceCategory == "mobile") & Expr(~transactions > 0)
#'
#' @family boolean functions
#'
#' @aliases `&`
#'
#' @export
#' @rdname And
setGeneric(
  "And",
  function(object, ...) {standardGeneric("And")},
  valueClass = "andExpr"
)

#' Generate an expression that gives the EXCLUSIVE-OR of two expressions.
#'
#' @param x,y Conditions for an EXCLUSIVE-OR expression.
#'
#' @examples
#' either_enquired_or_downloaded <- xor(
#'   Expr(~eventCategory == "enquiry"),
#'   Expr(~eventCategory == "download")
#' )
#'
#' @family boolean functions
#'
#' @export
#' @rdname xor
setGeneric("xor")

