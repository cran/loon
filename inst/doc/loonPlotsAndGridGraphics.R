## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, 
                      warning = FALSE,
                      message = FALSE,
                      fig.align = "center", 
                      fig.width = 6, 
                      fig.height = 5,
                      out.width = "60%", 
                      tidy.opts = list(width.cutoff = 65),
                      tidy = FALSE)
library(loon)
library(grid)
library(gridExtra)

imageDirectory <- file.path(".", "images", "loonPlotsAndGridGraphics")
# dataDirectory <- file.path(".", "data", "loonPlotsAndGridGraphics")

## ----loon plot, eval = FALSE--------------------------------------------------
#  library(loon)
#  p <- with(mtcars, l_plot(mpg, hp,
#                           size = 8,
#                           showScales = TRUE))

## ----query, eval = FALSE------------------------------------------------------
#  # x coordinates
#  p['x']

## ---- eval = FALSE------------------------------------------------------------
#  # point size
#  p['size']

## ----plot, eval = FALSE-------------------------------------------------------
#  # `p` is a loon widget
#  plot(p)

## ---- fig.align="center", echo=FALSE------------------------------------------
knitr::include_graphics(file.path(imageDirectory, "loonPlotp.png"))

## ----save plot draw, eval = FALSE---------------------------------------------
#  g0 <- plot(p)

## ----save plot, eval = FALSE--------------------------------------------------
#  g0 <- plot(p, draw = FALSE)

## ----loonGrob, eval = FALSE---------------------------------------------------
#  g0 <- loonGrob(p)

## ----draw graphics, eval = FALSE----------------------------------------------
#  library(grid)
#  grid.newpage()
#  grid.draw(g0)

## ----  echo=FALSE-------------------------------------------------------------
knitr::include_graphics(file.path(imageDirectory, "loonPlotg0.png"))

## ---- eval = FALSE------------------------------------------------------------
#  oldColor <- p["color"]
#  set.seed(3141)
#  selection <- sample(c(TRUE, FALSE),
#                      size = length(oldColor),
#                      replace = TRUE)
#  p["color"]  <- selection
#  gtrans <- loonGrob(p)
#  p["active"] <- selection
#  gauto <- loonGrob(p)
#  p["active"] <- !selection
#  gmanual <- loonGrob(p)
#  p["active"] <- TRUE
#  p["color"] <- oldColor

## ---- eval=FALSE--------------------------------------------------------------
#  library(gridExtra)
#  grid.newpage()
#  grid.arrange(g0, gtrans, gauto, gmanual, nrow = 2)

## ----  echo=FALSE, out.width = "80%"------------------------------------------
knitr::include_graphics(file.path(imageDirectory, "gridArrange.png"))

## ----class, eval = FALSE------------------------------------------------------
#  class(g0)

## ----grob data structure, eval = FALSE----------------------------------------
#  grid.ls(g0)

## ----hierarchy, out.width= "80%", fig.align="center", echo=FALSE--------------
knitr::include_graphics(file.path(imageDirectory, "loonGrobNestedDataTree.png"))

## ----getGrob, eval = FALSE----------------------------------------------------
#  # retrieve xlabel grob
#  xlabelGrob <- getGrob(g0, "x label")
#  xlabelGrob

## ---- eval = FALSE------------------------------------------------------------
#  class(xlabelGrob)

## ---- eval = FALSE------------------------------------------------------------
#  names(xlabelGrob)

## ---- eval = FALSE------------------------------------------------------------
#  xlabelGrob$label

## ---- eval = FALSE------------------------------------------------------------
#  xAxisGrob <- getGrob(g0, "x axis")
#  names(xAxisGrob)

## ---- eval = FALSE------------------------------------------------------------
#  names(xAxisGrob$children)

## ----editGrob, eval = FALSE---------------------------------------------------
#  newGrob = editGrob(xlabelGrob,
#                     label = "Miles per (US) gallon")

## ----editGrob return, eval = FALSE--------------------------------------------
#  class(newGrob)

## ----more meaningful label, eval = FALSE--------------------------------------
#  newGrob$label

## ----modify grob, eval = FALSE------------------------------------------------
#  g0 <- setGrob(gTree = g0,
#                gPath = "x label",
#                newGrob = newGrob)

## ----redraw, eval = FALSE-----------------------------------------------------
#  grid.newpage()
#  grid.draw(g0)

## ----  echo=FALSE-------------------------------------------------------------
knitr::include_graphics(file.path(imageDirectory, "loonPlotg0Xlabel.png"))

## ----alpha, eval = FALSE------------------------------------------------------
#  pathGrob <- "points: primitive glyphs"
#  newLoonPointsGrob <-
#    editGrob(
#      getGrob(g0, pathGrob),
#      gp = gpar(fill = as_hex6color(p['color']),
#                col = l_getOption("foreground"),
#                fontsize = 20, # give a larger point size,
#                alpha = 0.3 # turn color transparent
#                )
#      )
#  # update loon points grob
#  g0 <- setGrob(
#    gTree = g0,
#    gPath = "points: primitive glyphs",
#    newGrob = newLoonPointsGrob
#  )
#  grid.newpage()
#  grid.draw(g0)

## ----  echo=FALSE-------------------------------------------------------------
knitr::include_graphics(file.path(imageDirectory, "loonPlotg0Alpha.png"))

## ---- eval = FALSE------------------------------------------------------------
#  titleGrob <- getGrob(g0, "title: textGrob arguments")
#  titleGrob$label

## ---- eval = FALSE------------------------------------------------------------
#  class(titleGrob)

## ---- eval = FALSE------------------------------------------------------------
#  g1 <- l_instantiateGrob(g0, "title: textGrob arguments",
#                          label = "1974 Motor Trend cars data",
#                          gp = gpar(col = "blue",
#                                    fontsize = 8))
#  grid.newpage()
#  grid.draw(g1)

## ----  echo=FALSE-------------------------------------------------------------
knitr::include_graphics(file.path(imageDirectory, "loonPlotg1.png"))

## ---- eval = FALSE------------------------------------------------------------
#  g2 <- l_instantiateGrob(g0, "title: textGrob arguments",
#                          label = "1974 Motor Trend cars data",
#                          gp = gpar(col = "red"))
#  g2 <- l_setGrobPlotView(g2)
#  grid.newpage()
#  grid.draw(g2)

## ----  echo=FALSE-------------------------------------------------------------
knitr::include_graphics(file.path(imageDirectory, "loonPlotg2.png"))

## ---- eval = FALSE------------------------------------------------------------
#  p['showLabels'] <- FALSE
#  g3 <- loonGrob(p)
#  grid.newpage()
#  grid.draw(g3)

## ----  echo=FALSE-------------------------------------------------------------
knitr::include_graphics(file.path(imageDirectory, "loonPlotg3.png"))

## ---- eval = FALSE------------------------------------------------------------
#  grid.ls(g3)

## ---- eval = FALSE------------------------------------------------------------
#  g4 <-l_instantiateGrob(g3,
#                         "title: textGrob arguments",
#                         x = unit(8, "native"),
#                         just = "left",
#                         label = "Motor Trend Magazine 1974")
#  
#  g4 <-l_instantiateGrob(g4,
#                         "x label: textGrob arguments",
#                         label = "Miles per US gallon",
#                         x = unit(35, "native"),
#                         y = unit(-1.5, "lines"),
#                         just = "right",
#                         gp = gpar(fontsize = 15,
#                                   fontface = "italic",
#                                   col = "blue"))
#  
#  g4 <-l_instantiateGrob(g4,
#                         "y label: textGrob arguments",
#                         label = "Horse power",
#                         rot = 45,
#                         x = unit(7, "native"),
#                         y = unit(275, "native"),
#                         just = "right",
#                         gp = gpar(fontsize = 15,
#                                   fontface = "italic",
#                                   col = "blue"))
#  
#  g4 <- l_setGrobPlotView(g4)
#  grid.newpage()
#  grid.draw(g4)

## ----  echo=FALSE-------------------------------------------------------------
knitr::include_graphics(file.path(imageDirectory, "loonPlotg4.png"))

## ---- eval = FALSE------------------------------------------------------------
#  # add text glyph
#  carNames <- l_glyph_add_text(p, text = rownames(mtcars))
#  p['glyph'] <- carNames
#  # loonGrob
#  g2 <- loonGrob(p)
#  getGrob(g2, "points: mixed glyphs")

## ---- eval = FALSE------------------------------------------------------------
#  grid.newpage()
#  grid.draw(g2)

## ----  echo=FALSE-------------------------------------------------------------
knitr::include_graphics(file.path(imageDirectory, "loonPlotg2Text.png"))

