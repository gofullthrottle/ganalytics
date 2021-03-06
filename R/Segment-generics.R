#' SegmentConditionFilter.
#'
#' Create a new gaSegmentConditionFilter object
#'
#' @param object An expression to be used as a non-sequential segment condition.
#' @param ... Other expressions to be ANDed to the first expression provided.
#' @param negation optional logical TRUE or FALSE to match segments where this condition
#'   has not been met. Default is FALSE, i.e. inclusive filter.
#' @param scope optional scope, "users" or "sessions".
#' @return a gaSegmentConditionFilter object.
#'
#' @export
setGeneric(
  "SegmentConditionFilter",
  function(object, ..., negation, scope) {standardGeneric("SegmentConditionFilter")},
  valueClass = "gaSegmentConditionFilter"
)

#' Include.
#'
#' Set the negation flag of a segment filter to FALSE.
#'
#' @param object a segment condition or sequence filter to include.
#' @param ... additional segment conditions to include.
#' @param scope optional scope, "users" or "sessions"
#' @return a .gaSegmentFilter object with its negate slot set to FALSE.
#'
#' @export
setGeneric(
  "Include",
  function(object, ..., scope) {standardGeneric("Include")},
  valueClass = ".gaSegmentFilter"
)

#' Exclude.
#'
#' Set the negation flag of a segment filter to TRUE.
#'
#' @param object a segment condition or sequence filter to exclude.
#' @param ... additional segment conditions to add to the exclude filter.
#' @param scope optional scope, "users" or "sessions"
#' @return a .gaSegmentFilter object with its negate slot set to TRUE.
#'
#' @export
setGeneric(
  "Exclude",
  function(object, ..., scope) {standardGeneric("Exclude")},
  valueClass = ".gaSegmentFilter"
)

#' IsNegated.
#'
#' Tests whether a segment filter is negated.
#'
#' @param object an object belonging to the superclass \code{.gaSegmentFilter}.
#'
#' @rdname IsNegated
#' @export
setGeneric(
  "IsNegated",
  function(object) {standardGeneric("IsNegated")},
  valueClass = "logical"
)

#' IsNegated<-.
#'
#' Sets the negation flag of a segment filter.
#'
#' @param value the value of the negation slot, either \code{TRUE} or
#'   \code{FALSE}.
#'
#' @rdname IsNegated
#' @export
setGeneric(
  "IsNegated<-",
  function(object, value) {
    object <- standardGeneric("IsNegated<-")
    validObject(object)
    object
  }
)

#' DynSegment.
#'
#' Combine one or more segment condition filters and/or sequence filters into a
#' gaDynSegment that is scoped to either 'user' or 'session' level.
#'
#' A segment filter is either sequential or non-sequential conditions.
#' Sequential and non-sequential conditions can be combined using this function.
#'
#' @param object The first filter to include in the segment definition.
#' @param ... Additional filters to include in the segment definition, if
#'   needed.
#' @param name An optional name given to the dynamic segment.
#' @return a gaDynSegment object.
#'
#' @export
setGeneric(
  "DynSegment",
  function(object, ..., name = character(0)) {standardGeneric("DynSegment")},
  valueClass = "gaDynSegment"
)

#' PerProduct.
#'
#' Set the scope of a gaMetExpr object to product-level.
#'
#' @param object a gaMetExpr object to coerce to hit-level
#' @param negation boolean value indicating whether to negate the condition.
#' @return a gaMetExpr object.
#'
#' @export
setGeneric(
  "PerProduct",
  function(object, negation){standardGeneric("PerProduct")},
  valueClass = "gaSegMetExpr"
)

#' PerHit.
#'
#' Set the scope of a gaMetExpr object to hit-level, or transforms a condition
#' filter to a sequence filter of length one (i.e. a combination of conditions
#' for matching a single hit).
#'
#' @param object a gaMetExpr object to coerce to hit-level or if multiple
#'   expressions are provided, then the first expression to combine into a
#'   single step of sequence filter.
#' @param ... Further expressions to be included in the filter definition if
#'   defining a sequence filter of length one.
#' @param negation boolean value indicating whether to negate the condition.
#' @return a gaMetExpr or gaSegmentSequenceFilter.
#'
#' @export
setGeneric(
  "PerHit",
  function(object, ..., negation){standardGeneric("PerHit")},
  valueClass = c("gaSegMetExpr", "gaSegmentSequenceFilter")
)

#' PerSession.
#'
#' Set the scope of a .gaSegmentFilter or gaMetExpr object to session-level.
#'
#' @param object a .gaSegmentFilter or gaMetExpr object to coerce to
#'   session-level. Alternatively, an dimension expression or segment filter to
#'   coerce into a session scoped gaDynSegment.
#' @param ... Other filters to include in the gaDynSegment.
#' @param negation boolean value indicating whether to negate the condition.
#' @return a gaMetExpr, .gaSegmentFilter or gaDynSegment.
#'
#'   To define a gaDynSegment comprised of a single metric expression,
#'   wrap the metric expression in an \code{Include} or \code{Exclude} call.
#'
#' @export
setGeneric(
  "PerSession",
  function(object, ..., negation){standardGeneric("PerSession")},
  valueClass = c("gaDynSegment", ".gaSegmentFilter", "gaSegMetExpr")
)

#' PerUser.
#'
#' Set the scope of a .gaSegmentFilter or gaMetExpr object to user-level.
#'
#' @param object a .gaSegmentFilter or gaMetExpr object to coerce to
#'   user-level. Alternatively, an dimension expression or segment filter to
#'   coerce into a user scoped gaDynSegment.
#' @param ... Other filters to include in the gaDynSegment.
#' @param negation boolean value indicating whether to negate the condition.
#' @return a gaMetExpr, .gaSegmentFilter or gaDynSegment.
#'
#'   To define a gaDynSegment comprised of a single metric expression,
#'   wrap the metric expression in an \code{Include} or \code{Exclude} call.
#'
#' @export
setGeneric(
  "PerUser",
  function(object, ..., negation){standardGeneric("PerUser")},
  valueClass = c("gaDynSegment", ".gaSegmentFilter", "gaSegMetExpr")
)

#' Segment.
#'
#' Define a segment for use in a query's segment list.
#'
#' @param object a segment or other object that can be coerced into a segment,
#'   including dynamic segments, built-in and/or custom segments by their ID.
#' @param ... other segment conditions, filters or filter lists to include in
#'   the segment's definition (ANDed)
#' @return an object belonging to the .gaSegment superclass.
#'
#' @name Segment
#' @export
setGeneric(
  "Segment",
  function(object, ...) {standardGeneric("Segment")},
  valueClass = ".gaSegment"
)

#' Segments.
#'
#' Get the list of segments from the object or coerce the supplied objects into
#' a a named list of segments.
#'
#' @param object A query object to get the segment list from or to set the
#'   segment list of.
#' @param ... Alternatively, provide one or more named arguments (segments or
#'   objects that can be coerced into segments) including dynamic segments,
#'   built-in and/or custom segments by their ID.
#' @return a gaSegmentList
#'
#' @export
#' @rdname Segments
setGeneric(
  "Segments",
  function(object, ...) {standardGeneric("Segments")},
  valueClass = c("gaSegmentList")
)

#' Segments<-.
#'
#' Set the segments of the query object.
#'
#' @param value A named list of segments or a single segment.
#'
#' @export
#' @rdname Segments
setGeneric(
  "Segments<-",
  function(object, value) {
    object <- standardGeneric("Segments<-")
    validObject(object)
    object
  }
)
