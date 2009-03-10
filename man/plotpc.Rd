\name{plotpc}
\alias{plotpc}
\title{Plot principal component histograms around a scatter plot}
\description{
Plot principal component histograms around the scatter plot of two variables.
Mostly useful as a tool for teaching principal components.
}
\usage{
plotpc(x,
    xrange=NULL,
    hist=TRUE,
    main="Principal components",
    xlab=NULL,
    ylab=NULL,
    gp.points=gpar(cex=.6),
    pch=20,
    height=xrange/10,
    breaks="Sturges",
    adjust=1,
    gp.hist=if(hist) gp.hist <- gpar(col="gray", fill="gray")
            else     gp.hist <- gpar(col="black"),
    gp.text=gpar(cex=.8, font=2),
    gp.axis=gpar(col="gray", lwd=2),
    sd.ellipse=NA,
    gp.ellipse=gpar(col="gray", lwd=2),
    heightx=NULL, breaksx=NULL, adjustx=NULL, gp.histx=NULL,
                 textx="", gp.textx=NULL, axis.lenx=0, gp.axisx=NULL,
    heighty=NULL, breaksy=NULL, adjusty=NULL, gp.histy=NULL,
                 texty="", gp.texty=NULL, axis.leny=0, gp.axisy=NULL,
    height1=NULL, flip1=FALSE,
                 breaks1=NULL, adjust1=NULL, gp.hist1=NULL, offset1=NULL,
                 text1=NULL, gp.text1=NULL, axis.len1=2, gp.axis1=NULL,
    height2=NULL, flip2=FALSE,
                 breaks2=NULL, adjust2=NULL, gp.hist2=NULL, offset2=NULL,
                 text2=NULL, gp.text2=NULL, axis.len2=2, gp.axis2=NULL,
    angle3=NA, height3=NULL, flip3=FALSE,
                 breaks3=NULL, adjust3=NULL, gp.hist3=NULL, offset3=NULL,
                 text3=NULL, gp.text3=NULL, axis.len3=0, gp.axis3=NULL,
    angle4=NA, height4=NULL, flip4=FALSE,
                 breaks4=NULL, adjust4=NULL, gp.hist4=NULL, offset4=NULL,
                 text4=NULL, gp.text4=NULL, axis.len4=0, gp.axis4=NULL,
    angle5=NA, height5=NULL, flip5=FALSE,
                 breaks5=NULL, adjust5=NULL, gp.hist5=NULL, offset5=NULL,
                 text5=NULL, gp.text5=NULL, axis.len5=0, gp.axis5=NULL,
    angle6=NA, height6=NULL, flip6=FALSE,
                 breaks6=NULL, adjust6=NULL, gp.hist6=NULL, offset6=NULL,
                 text6=NULL, gp.text6=NULL, axis.len6=0, gp.axis6=NULL,
    angle7=NA, height7=NULL, flip7=FALSE,
                 breaks7=NULL, adjust7=NULL, gp.hist7=NULL, offset7=NULL,
                 text7=NULL, gp.text7=NULL, axis.len7=0, gp.axis7=NULL,
    yonx = FALSE, offset.yonx=-xrange/2.5,
                 text.yonx="y~x", gp.text.yonx=NULL,
                 axis.len.yonx=xrange/2.5, gp.axis.yonx=gpar(col=1),
    xony = FALSE, offset.xony=-xrange/2.5,
                 text.xony="x~y", gp.text.xony=NULL,
                 axis.len.xony=xrange/2.5, gp.axis.xony=gpar(col=1))
}
\arguments{
Many users will find that they need only the first argument.
The \code{xrange} argument can be used to add whitespace around the histograms.
Set \code{hist=FALSE} to plot densities rather than histograms.
Use \code{offset1} and the other offset arguments to adjust
the positions of the histograms relative to the center of the graph.
Use \code{angle1} and the other angle arguments to add extra histograms
to the plot at arbitrary angles.
Use \code{yonx} to add a linear regression line to the plot.
    \item{x}{
      A two column matrix or dataframe.
      The principal components of the \code{x} will be calculated
      treating each column as a variable.
    }
    \item{hist}{
      Default \code{TRUE} to plot \link[=hist]{histograms}.
      Set to \code{FALSE} to plot \link[=density]{densities} instead.
      The various "histogram" arguments will then
      apply to densities rather than to histograms.
    }
    \item{xrange}{
      The range of the x axis.
      That is, \code{xlim} will be
      \code{c(mean(x[,1]) - xrange/2, mean(x[,1]) + xrange/2}),
      and \code{ylim} will have the same range about \code{mean(x[,2])}.
      Default \code{NULL}, meaning automatically deduce axis limits from
      the \code{x} argument.
    }
    \item{main}{
      Main title.
      Default \code{"Principal components"}.
    }
    \item{xlab}{
      x axis label.
      Default \code{NULL}, meaning create the label automatically from the column names of \code{x}.
    }
    \item{ylab}{
      y axis label.
      Default \code{NULL}, meaning create the label automatically from the column names of \code{x}.
    }
    \item{gp.points}{
      Graphic parameters for the plotted points.
      Default \code{\link[grid]{gpar}(cex=.6)}.
    }
    \item{pch}{
      Plot character for the plotted points.
      Default \code{20}.
      \cr\cr\cr
      \bold{The following arguments apply to all histograms.}
      These can be overridden by using the histogram-specific argument
      e.g. override the \code{height} argument for the first principal
      component by specifying \code{height1}.
    }
    \item{height}{
      Height of histograms.
      Default \code{xrange/10}.
      Use a negative height to flip a histogram around its base.
    }
    \item{breaks}{
      Passed on to \code{\link{hist}}.
      Default \code{"Sturges"}.
      Using something like \code{breaks=12} can be useful.
    }
    \item{adjust}{
      Passed on to \code{\link{density}}.
      Default \code{1}.
      Use something like \code{adjust=.5} for more details in the density plots.
    }
    \item{gp.hist}{
      Graphic parameters for the histograms or densities.\cr
      If \code{hist==TRUE} then the default is
      \code{\link[grid]{gpar}(col="gray", fill="gray")} where
      \code{col} is the color of the lines delineating the histograms,
      and \code{fill} is the color filling the histograms.\cr
      If \code{hist==FALSE} then the default is
      \code{\link[grid]{gpar}(col="black")}.\cr
    }
    \item{gp.axis}{
      Graphic parameters for the axis drawn through the scatter of points.
      Default \code{\link[grid]{gpar}(col="gray", lwd=2)} meaning draw the axes as thickish gray lines.
    }
    \item{sd.ellipse}{
       If greater than 0, draw a confidence ellipse
       for the principal components at \code{sd.ellipse} standard deviations.
       Default is \code{NA}, meaning do not draw an ellipse.
    }
    \item{gp.ellipse}{
      Graphic parameters for the ellipse.
      Default \code{\link[grid]{gpar}(col="gray", lwd=2)}.
    }
    \item{gp.text}{
      Graphic parameters for text above the histograms.
      Default \code{\link[grid]{gpar}(cex=.8, font=2)}.
      \cr\cr\cr
      \bold{The following arguments apply to the histogram on the x axis.}
    }
    \item{heightx}{
      Default \code{NULL}, meaning use \code{height}.
      Use \code{0} to not plot the x histogram.
    }
    \item{breaksx}{
      Default \code{NULL}, meaning use \code{breaks}.
    }
    \item{adjustx}{
      Default \code{NULL}, meaning use \code{adjust}.
    }
    \item{gp.histx}{
      Default \code{NULL}, meaning use \code{gp.hist}.
    }
    \item{textx}{
      Text drawn above the histogram.
      Default \code{""}, meaning no text.
      The text is drawn using \code{gp.textx}.
    }
    \item{gp.textx}{
      Graphic parameters for the text above the histogram.
      Default \code{NULL}, meaning use \code{gp.text}.
    }
    \item{axis.lenx}{
      Length of horizontal line drawn through the center of the points.
      Units are standard deviations of \code{x[,1]}.
      Default \code{0}, meaning do not plot a horizontal axis.
    }
    \item{gp.axisx}{
      Default \code{NULL}, meaning use \code{gp.axis}.
      \cr\cr\cr
    }
    \item{heighty, breaksy, adjusty, gp.histy, texty, gp.texty, axis.leny, gp.axisy}{
      As above but for the histogram on the y axis.
      \cr\cr\cr
      \cr\cr
      \bold{The following arguments apply to the first principal component.}
    }
    \item{height1}{
      Default \code{NULL}, meaning use \code{height}.
      Use \code{0} to not plot the histogram for the first principal component.
    }
    \item{flip1}{
      Flip the position of the histogram around the axis of the first principal component.
      Default \code{FALSE}, meaning do not flip.
    }
    \item{breaks1}{
      Default \code{NULL}, meaning use \code{breaks}.
    }
    \item{adjust1}{
      Default \code{NULL}, meaning use \code{adjust}.
    }
    \item{gp.hist1}{
      Default \code{NULL}, meaning use \code{gp.hist}.
    }
    \item{offset1}{
      Distance of the histogram plot from the center of the graph, in native units.
      Default \code{NULL}, meaning automatic.
    }
    \item{text1}{
      Text drawn above the histogram.
      Default \code{NULL}, meaning generate the text automatically.
      Use \code{""} for no text.
      The text is drawn using \code{gp.text1}.
    }
    \item{gp.text1}{
      Graphic parameters for the text above the histogram.
      Default \code{NULL}, meaning use \code{gp.text}.
    }
    \item{axis.len1}{
      Length of line drawn along the first principal axis.
      Units are standard deviations of the points projected onto that axis.
      Default \code{2}, meaning draw a line of length plus and minus two standard deviations.
      Use \code{0} for no axis.
    }
    \item{gp.axis1}{
      Default \code{NULL}, meaning use \code{gp.axis}.
      \cr\cr\cr
    }
    \item{height2, flip2, breaks2, adjust2, gp.hist2, offset2, text2, gp.text2, axis.len2, gp.axis2}{
      As above but for the second principal component.
      \cr\cr\cr
      \cr\cr\cr
      \cr
      \bold{The following arguments apply to the optional histogram at angle3.}
      By default, \code{angle3=NA}, meaning do not plot the histogram.
            Use, say, \code{angle3=45} to plot a histogram at 45 degrees.
            By setting \code{angle3} to \code{angle7} you
            can plot up to five extra histograms at any angles.
      \cr\cr
    }
    \item{angle3}{
      Default \code{NA}, meaning do not plot a histogram.
      Use, say, \code{angle3=45} to plot a histogram at 45 degrees.
    }
    \item{height3}{
      Default \code{NULL}, meaning use \code{height}.
    }
    \item{flip3}{
      Default \code{FALSE}.
    }
    \item{breaks3}{
      Default \code{NULL}, meaning use \code{breaks}.
    }
    \item{adjust3}{
      Default \code{NULL}, meaning use \code{adjust}.
    }
    \item{gp.hist3}{
      Default \code{NULL}, meaning use \code{gp.hist}.
    }
    \item{offset3}{
      Default \code{NULL}, meaning automatic.
    }
    \item{text3}{
      Default \code{NULL}, meaning automatic.
    }
    \item{gp.text3}{
      Default \code{NULL}, meaning use \code{gp.text}.
    }
    \item{axis.len3}{
      Length of axis drawn at \code{angle3} through the scatter of points.
      Default \code{0}, meaning do not plot the axis.
    }
    \item{gp.axis3}{
      Default \code{NULL}, meaning use \code{gp.axis}.
      \cr\cr\cr
    }
    \item{angle4, height4, flip4, breaks4, adjust4, gp.hist4, offset4, text4, gp.text4, axis.len4, gp.axis4}{
      As above but for the \code{angle4} histogram.
      \cr\cr\cr
      \cr\cr\cr
    }
    \item{angle5, height5, flip5, breaks5, adjust5, gp.hist5, offset5, text5, gp.text5, axis.len5, gp.axis5}{
      As above but for the \code{angle5} histogram.
      \cr\cr\cr
      \cr\cr\cr
    }
    \item{angle6, height6, flip6, breaks6, adjust6, gp.hist6, offset6, text6, gp.text6, axis.len6, gp.axis6}{
      As above but for the \code{angle6} histogram.
      \cr\cr\cr
      \cr\cr\cr
    }
    \item{angle7, height7, flip7, breaks7, adjust7, gp.hist7, offset7, text7, gp.text7, axis.len7, gp.axis7}{
      As above but for the \code{angle7} histogram.
      \cr\cr\cr
      \cr\cr\cr
      \bold{The following arguments apply to the optional "y on x" regression line.}
    }
    \item{yonx}{
      TRUE to plot a "y on x" linear regression line. Default FALSE.
    }
    \item{offset.yonx}{
      Position of text plotted on regression line.
      Default \code{-xrange/2.5}.
    }
    \item{text.yonx}{
      Text plotted on the regression line.  Default \code{"y~x"}.
    }
    \item{gp.text.yonx}{
      Graphic parameters for the text plotted on the regression line.
      Default \code{NULL}, meaning use \code{gp.text}.
    }
    \item{axis.len.yonx}{
      Length of regression line in \code{gpar "native"} units.
      Default \code{-xrange/2.5}.
    }
    \item{gp.axis.yonx}{
      Graphic parameters for the regression line.
      Default \code{\link[grid]{gpar}(col=1)}.
      \cr\cr\cr
    }
    \item{xony, offset.xony, text.xony, gp.text.xony, axis.len.xony, gp.axis.xony}{
      As above but for a "x on y" regression.
    }
}
\value{
Invisibly returns the \code{\link[grid]{viewport}} used to create the
\code{plotpc} axes This allows you to add text using the
\code{"native"} coordinates of the plot.  See the examples below.
}
\note{
Here is how to draw scatter plots for all pairs of principal components:
\preformatted{
    data(iris)
    pc <- princomp(iris[, -5]) # -5 to drop Species
    pairs(pc$scores, col=c(2,3,4)[unclass(iris$Species)])
}
}
\author{
Stephen Milborrow.
Users are encouraged to send feedback --- use
milboATsonicPERIODnet \url{http://www.milbo.users.sonic.net}.
}
\seealso{
  \code{\link{plotld}},
  \code{\link{princomp}},
  \code{\link{hist}},
  \code{\link{density}},
}
\examples{
data(iris)
x <- iris[,c(3,4)] # select Petal.Length and Petal.Width
plotpc(x, main="Example 1\n")

# example with some parameters and showing densities
plotpc(x,
       main="Example 2:\nPrincipal component densities\n",
       hist=FALSE,                    # plot densities not histograms
       adjust=.5,                     # finer resolution in the density plots
       gp.axis=gpar(lty=3),           # gpar of axes
       heightx=0,                     # don't display x histogram
       heighty=0,                     # don't display y histogram
       text1="Principal Component 1", # text above hist for 1st principal component
       text2="Principal Component 2", # text above hist for 2nd principal component
       axis.len2=4,                   # length of 2nd principal axis (in std devs)
       offset1=2.5,                   # offset of component 1 density plot
       offset2=5)                     # offset of component 2 density plot

# example using "angles"
vp <- plotpc(x,
       main="Example 3:\nProjections\n",
       xrange=25,      # give ourselves some space
       heightx=0,      # don't display x histogram
       heighty=0,      # don't display y histogram
       angle3=-60,     # project at -60 degrees
       angle4=-25,     # project at -25 degrees
       angle5=20,      # project at 20 degrees
       angle6=70)      # project at 70 degrees

# add text to the graph, can use native coords
pushViewport(vp)
grid.text("Projections at\nvarious angles",
          x=unit(10, "native"), y=unit(12.5, "native"),
          gp=gpar(col="red"))
popViewport()

# example showing principal axes
x <- iris[iris$Species=="versicolor",c(3,4)]
vp <- plotpc(x,
       main="Example 4:\nPrincipal axes with confidence ellipse\n",
       sd.ellipse=2,                       # ellipse at two standard devs
       heightx=0, heighty=0, height1=0, height2=0, # no histograms
       gp.ellipse=gpar(col=1),             # ellipse in black
       axis.lenx=4, axis.leny=5,           # lengthen horiz and vertical axes
       axis.len1=4, gp.axis1=gpar(col=1),  # lengthen pc1 axis, draw in black
       axis.len2=8, gp.axis2=gpar(col=1))  # lengthen pc2 axis, draw in black

pushViewport(vp) # add text to the graph
un <- function(x) unit(x, "native")
grid.text("PC1", x=un(2.2), y=un(.6),   gp=gpar(cex=.8, font=2))
grid.text("PC2", x=un(3.9), y=un(2.35), gp=gpar(cex=.8, font=2))
grid.text("X1",  x=un(2.2), y=un(1.4),  gp=gpar(cex=.8, font=2))
grid.text("X2",  x=un(4.3), y=un(2.5),  gp=gpar(cex=.8, font=2))
popViewport()

# example comparing linear regression to principal component
x <- iris[iris$Species=="setosa",c(3,4)]
vp <- plotpc(x,
       main="Example 5:\nRegression lines and\nfirst principal component",
       heightx=0, heighty=0, height1=0, height2=0, # no histograms
       gp.points=gpar(col="steelblue"),      # color of points
       axis.len1=4,  gp.axis1=gpar(col="gray", lwd=3),
       axis.len2=.15, gp.axis2=gpar(col=1),  # just a little blip of an axis
       yonx=TRUE, xony=TRUE)                 # display regression lines

pushViewport(vp) # add text to the principal component line
grid.text("PC1", x=unit(.8, "native"), y=unit(0, "native"),
          gp=gpar(col="gray", cex=.8, font=2))
popViewport()
}
