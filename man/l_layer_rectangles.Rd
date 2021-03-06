% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/l_layer.R
\name{l_layer_rectangles}
\alias{l_layer_rectangles}
\title{Layer rectangles}
\usage{
l_layer_rectangles(
  widget,
  x,
  y,
  color = "gray80",
  linecolor = "black",
  linewidth = 1,
  label = "rectangles",
  parent = "root",
  index = 0,
  group = NULL,
  active = TRUE,
  ...
)
}
\arguments{
\item{widget}{widget path name as a string}

\item{x}{list with vectors with x coordinates}

\item{y}{list with vectors with y coordinates}

\item{color}{vector with fill colors, if empty string \code{""}, then the
fill is transparant}

\item{linecolor}{vector with outline colors}

\item{linewidth}{vector with line widths}

\item{label}{label used in the layers inspector}

\item{parent}{group layer}

\item{index}{of the newly added layer in its parent group}

\item{group}{separate x vector or y vector into a list by group.}

\item{active}{a logical determining whether objects appear or not
(default is \code{TRUE} for all).}

\item{...}{additional state initialization arguments, see
\code{\link{l_info_states}}}
}
\value{
layer object handle, layer id
}
\description{
Loon's displays that are based on Cartesian coordinates (i.e.
  scatterplot, histogram and graph display) allow for layering visual
  information including polygons, text and rectangles.
}
\details{
For more information run: \code{l_help("learn_R_layer")}
}
\examples{
if(interactive()){

p <- l_plot()

l <- l_layer_rectangles(
     p,
     x = list(c(0,1), c(1,2), c(2,3), c(5,6)),
     y = list(c(0,1), c(1,2), c(0,1), c(3,4)),
     color = c('red', 'blue', 'green', 'orange'),
     linecolor = "black"
)
l_scaleto_world(p)

l_info_states(l)

# Set groups
pp <- l_plot(x = c(0,1,1,2,2,3,5,6),
             y = c(0,1,1,2,0,1,3,4))
# x and y are inherited from pp
ll <- l_layer_rectangles(
     pp,
     group = rep(1:4, each = 2),
     color = c('red', 'blue', 'green', 'orange'),
     linecolor = "black"
)
l_scaleto_world(pp)

}
}
\seealso{
\code{\link{l_layer}}, \code{\link{l_info_states}}
}
