% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/l_toplevel.R
\name{l_toplevel}
\alias{l_toplevel}
\title{loon tk top level}
\usage{
l_toplevel(path)
}
\arguments{
\item{path}{A valid path name (character);
if missing, a valid path will be generated automatically}
}
\value{
a tk top level widget
}
\description{
Create a loon tk top-level window
}
\examples{
if(interactive()) {

  tt <- l_toplevel(".test")
  subwin <- l_subwin(tt, 'ts')
  tktitle(tt) <- paste("path:", subwin)
  parent <- as.character(tcl('frame', subwin))

  # a loon widget
  p <- l_plot(rnorm(100), rnorm(100), parent = parent)
  # pack a refresh button (generate new data set)
  refresh_button <- as.character(
     tcltk::tcl('button',
                as.character(l_subwin(parent, 'refresh button')),
                text = "refresh",
                bg = "grey80",
                fg = "black",
                borderwidth = 2,
                relief = "raised"))

  # layout
  tcltk::tkgrid(p,
                row = 0,
                column = 0,
                rowspan = 10,
                columnspan = 10,
                sticky="nesw")

  tcltk::tkgrid(refresh_button,
                row = 10,
                column = 0,
                rowspan = 1,
                columnspan = 1,
                sticky="nesw")
  for(i in 0:10) {
     tcltk::tkgrid.rowconfigure(parent, i, weight=1)
  }
  for(i in 0:9) {
    tcltk::tkgrid.columnconfigure(parent, i, weight=1)
  }

  update <- function(...) {
    l_configure(p,
                x = rnorm(100),
                y = rnorm(100))
    l_scaleto_world(p)
  }

  # configure button (callback function)
  tcltk::tkconfigure(refresh_button,
                     command = update)
  # configure canvas size
  tcltk::tkconfigure(paste(p,".canvas", sep=''), width=500, height=500)

  # pack widgets
  tkpack(parent, fill="both", expand=TRUE)
}
}
