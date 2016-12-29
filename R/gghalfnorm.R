#' Half Normal Plot
#'
#' Produce a Half Normal Plot for a vector of residuals.
#'
#' @param x A vector of residuals.
#' @param nlab The number of points to label.
#' @param labs The labels for the points.
#' @param repel Logical. Whether to repel the labels or not.
#' @param ... Additional parameters to be passed to
#'   \code{\link[ggrepel]{geom_text_repel}}.
#'
#' @seealso \code{\link[stats]{qqnorm}}
#'
#' @examples
#' set.seed(100)
#' gghalfnorm(x = rnorm(100), nlab = 10)
#' gghalfnorm(x = rnorm(100), nlab = 10, repel = TRUE)
#'
#' @importFrom stats qnorm
#' @import ggplot2
#' @import ggrepel
#'
#' @export
gghalfnorm <- function(x, nlab = 2, labs = as.character(seq_along(x)),
                       repel = FALSE, ...) {
  x <- abs(x)
  labord <- order(x)
  x <- sort(x)
  i <- order(x)
  n <- length(x)
  ui <- stats::qnorm((n + 1:n) / (2 * n + 1))
  labs <- labs[labord][(n - nlab + 1):n]
  data <- data.frame(
    x = ui,
    y = x[i],
    label = c(rep("", n - length(labs)), labs)
  )
  slope <- x[n %/% 2] / ui[n %/% 2]
  p <- ggplot() +
    labs(x = "Half-Normal Quantiles",
         y = "Sorted Data")
  if (nlab < n) {
    p <- p +
      geom_point(data = data[1:(n - nlab), ],
                 aes_string(x = "x", y = "y"))
  }
  p <- if (repel) {
    p +
      geom_point(data = data[(n - nlab + 1):n, ],
                 aes_string(x = "x", y = "y")) +
      geom_text_repel(data = data[(n - nlab + 1):n, ],
                      aes_string(x = "x", y = "y", label = "label"),
                      ...)
  } else {
    p +
      geom_text(data = data[(n - nlab + 1):n, ],
                aes_string(x = "x", y = "y", label = "label"))
  }
  if (length(slope) != 0) {
    p <- p +
      geom_abline(intercept = 0, slope = slope,
                  col = "red")
  }
  p
}
