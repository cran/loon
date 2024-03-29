#' @title Retrieve saved plot states from the named file.
#'
#' @description \code{l_getSavedStates} reads a file created by \code{l_saveStates()} containing
#' the saved info states of a loon plot returning a loon object of class \code{"l_savedStates"}.
#' This is helpful, for example, when using RMarkdown or some other notebooking
#' facility to recreate an earlier saved loon plot so as to present it
#' in the document.
#'
#' Note that if the plot saved was an \code{"l_compound"} then \code{l_getSavedStates}
#' will return a list of the plots with each list item being the saved states of the
#' corresponding plots.
#'
#' @param file a connection or the name of the file where the \code{"l_savedStates"} \R object
#'        is to be read from (as in \code{readRDS(}).
#' @param ... further arguments passed to \code{readRDS()}.
#'
#' @return a list of class `l_savedStates` containing the states and their values.
#' Also has an attribute `l_plot_class` which contains the class vector of the
#' plot `p`
#'
#' @seealso \code{\link{l_getSavedStates}}  \code{\link{l_copyStates}} \code{\link{l_info_states}} \code{\link{readRDS}} \code{\link{saveRDS}}
#'
#' @export
#'
#' @examples
#' if(interactive()){
#' #
#' # Suppose you have some plot that you created like
#' p <- l_plot(iris, showGuides = TRUE)
#' #
#' # and coloured groups by hand (using the mouse and inspector)
#' # so that you ended up with these colours:
#' p["color"] <- rep(c( "lightgreen", "firebrick","skyblue"),
#'                   each = 50)
#' #
#' # Having determined the colours you could save them (and other states)
#' # in a file of your choice, here some tempfile:
#' myFileName <- tempfile("myPlot", fileext = ".rds")
#' #
#' # Save the named states of p
#' l_saveStates(p,
#'              states = c("color", "active", "selected"),
#'              file = myFileName)
#' #
#' # These can later be retrieved and used on a new plot
#' # (say in RMarkdown) to set the new plot's values to those
#' # previously determined interactively.
#' p_new <- l_plot(iris, showGuides = TRUE)
#' p_saved_info <- l_getSavedStates(myFileName)
#' #
#' # We can tell what kind of plot was saved
#' attr(p_saved_info, "l_plot_class")
#' #
#' # The result is a list of class "l_savedStates" which
#' # contains the names of the
#' p_new["color"] <- p_saved_info$color
#' #
#' # The result is that p_new looks like p did
#' # (after your interactive exploration)
#' # and can now be plotted as part of the document
#' plot(p_new)
#' #
#' # For compound plots, the info_states are saved for each plot
#' pp <- l_pairs(iris)
#' myPairsFile <- tempfile("myPairsPlot", fileext = ".rds")
#' #
#' # Save the names states of pp
#' l_saveStates(pp,
#'              states = c("color", "active", "selected"),
#'              file = myPairsFile)
#' pairs_info <-  l_getSavedStates(myPairsFile)
#' #
#' # For compound plots, the info states for all constitutent
#' # plots are saved.  The result is a list of class "l_savedStates"
#' # whose elements are the named plots as "l_savedStates"
#' # themselves.
#' #
#' # The names of the plots which were saved
#' names(pairs_info)
#' #
#' # And the names of the info states whose values were saved for
#' # the first plot
#' names(pairs_info$x2y1)
#' #
#' # While it is generally recommended to access (or assign) saved
#' # state values using the $ sign accessor, paying attention to the
#' # nested list structure of an "l_savedStates" object (especially for
#' # l_compound plots), R's square bracket notation [] has also been
#' # specialized to allow a syntactically simpler (but less precise)
#' # access to the contents of an l_savedStates object.
#' #
#' # For example,
#' p_saved_info["color"]
#' #
#' # returns the saved "color" as a vector of colours.
#' #
#' # In contrast,
#' pairs_info["x2y1"]
#' # returns the l_savedStates object of the states of the plot named "x2y1",
#' # but
#' pairs_info["color"]
#' # returns a LIST of colour vectors, by plot as they were named in pairs_info
#' #
#' # As a consequence, the following two are equivalent,
#' pairs_info["x2y1"]["color"]
#' # finds the value of "color" from an "l_savedStates" object
#' # whereas
#' pairs_info["color"][["x2y1"]]
#' # finds the value of "x2y1" from a "list" object
#' #
#' # Also, setting a state of an "l_savedStates" is possible
#' # (though not generally recommended; better to save the states again)
#' #
#' p_saved_info["color"] <- rep("red", 150)
#' # changes the saved state "color" on p_saved_info
#' # whereas
#' pairs_info["color"] <- rep("red", 150)
#' # will set the red color for any plot within pairs_info having "color" saved.
#' # In this way the assignment function via [] is trying to be clever
#' # for l_savedStates for compound plots and so may have unintentional
#' # consequences if the user is not careful.
#'
#' # Generally, one does not want/need to change the value of saved states.
#' # Instead, the states would be saved again from the interactive plot
#' # if change is necessary.
#' # Alternatively, more nuanced and careful control is maintained using
#' # the $ selectors for lists.
#' }
#'
l_getSavedStates <- function(file = stop("missing name of file"), ...) {
    # ... are other arguments passed on to saveRDS()
    result <- readRDS(file = file, ...)
    if (!is(result, "l_savedStates")) {
        warning("value returned is not of type \"l_savedStates\" ")
        }
    result
}
