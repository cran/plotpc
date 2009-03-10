\name{plotld}
\alias{plotld}
\title{Plot principal component loadings}
\description{
Plot principal component loadings.
}
\usage{
plotld(x, npc=3, main="Loadings", lty=1, lwd=4 / 1:npc,
    col=gray(0:(npc-1) / npc), ylim=range(loadings), 
    cex=.8, ylab="loading", legend.x=NULL, legend.y=NULL)
}
\arguments{
    \item{x}{
      A matrix or dataframe, passed directly to \code{\link{princomp}}.
    }
    \item{npc}{
      Number of principal components to plot.
      Default \code{3}.
    }
    \item{main}{
      Plot title.
      Default \code{"Loadings"}.
    }
    \item{lty}{
      Line type for for plotted lines.
      Default \code{1}.
    }
    \item{lwd}{
      Line width of plotted lines.
      The default is ugly but effective: \code{4 / 1:npc}.
    }
    \item{col}{
      Color of plotted lines.
      Default is a range of grays:
      \code{gray(0:(npc-1) / npc)}.
    }
    \item{ylim}{
      Vertical limits of the graph.
      Default \code{range(loadings)}.
    }
    \item{cex}{
      Character expansion for axis and legend text.
      Default \code{.8}.
    }
    \item{ylab}{
      Default \code{"loading"}.
    }
    \item{legend.x, legend.y}{
      Position of the legend.
      Default \code{NULL}, meaning automatic.
      For no histogram, use an out-of-range \code{legend.x} or \code{legend.y}.
    }
}
\seealso{
  \code{\link{princomp}},
  \code{\link{plotpc}}
}
\examples{
data(iris)
x <- iris[, -5] # -5 to drop Species
plotld(x)
}
