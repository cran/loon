as_r_polygon_size <- function(size){
    if (is.numeric(size)) {
        # trial and error to choose scale for size
        size <- (size/as.numeric(l_getOption("size")))^(1/2) * 2
        size[size < 0.5] <- 0.5
        size
    }
    size
}

as_r_serialaxes_size <- function(size, coord, axesLayout){
    if (is.numeric(size)) {
        # trial and error to choose scale for size
        if (axesLayout == "radial") {
            size <- (size/as.numeric(l_getOption("size")))^(1/2) * 6
        } else if (axesLayout == "parallel") {
            if (coord == "x") {
                size <- (size/as.numeric(l_getOption("size")))^(1/2) * 8
            } else if (coord == "y") {
                size <- (size/as.numeric(l_getOption("size")))^(1/2) * 4
            } else size <- NA
        } else size <- NA
        size[size < 1] <- 1
    }
    size
}

as_r_image_size <- function(size){
    if (is.numeric(size)) {
        # trial and error to choose scale for size
        size <- (size/as.numeric(l_getOption("size"))) /1.5
        size[size < 0.1] <- 0.1
        size
    }
    size
}

# see optionDatabase.tcl
as_r_point_size <- function(size) {

    if (is.numeric(size)) {
        # trial and error to choose scale for size
        size <- sqrt(size / 12)
        size[size < 0.1] <- 0.1
    }
    size
}

as_r_text_size <- function(size){
    if (is.numeric(size)) {
        # trial and error to choose scale for size
        size <- 1 + 1.2 * (1 + size)^0.88
    }
    size
}
