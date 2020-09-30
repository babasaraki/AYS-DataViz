# File:   VisualisingData.R
# Course: Introduction to use of R in Data Analysis (with RStudio)

# BASE R PLOTTING ################################################

# Load data

library(datasets)  # Load built-in datasets

# SUMMARIZE DATA ###########################################

head(DNase)         # Show the first six lines of DNase data
summary(DNase)      # Summary statistics for DNase data
plot(DNase)         # Scatterplot matrix for DNase data

# Basic plot

plot(DNase$conc, DNase$density)

# Customized basic plot

plot(DNase$conc, DNase$density,
     ylab = attr(DNase, "labels")$y,
     xlab = paste(attr(DNase, "labels")$x, attr(DNase, "units")$x),
     pch = 3,
     col = "red")

# Histograms & boxplots 

hist(DNase$density, breaks=25, main = "")

boxplot(density ~ Run, data = DNase)


# VISUALIZATION IN GGPLOT2 #################################################
# Install and load ggplot2 package

# Installation
install.packages("ggplot2")

# Loading
library(ggplot2)

library("ggplot2")
gg = ggplot(DNase, aes(x = conc, y = density)) + geom_point()

# Saving figures #################################################

ggsave("DNAse-histogram-demo.png", plot = gg)

# Print the plot to a pdf file
pdf("DNAse-histogram-demo.pdf")
myplot <- ggplot(DNase, aes(x = conc, y = density)) + geom_point()
dev.off()

# Data format and preparation 

# Load the data
data(mtcars)
df <- mtcars[, c("mpg", "cyl", "wt")]

# Convert cyl to a factor variable
df$cyl <- as.factor(df$cyl)

# Print a sample of the data
head(df)

# Scatter plots

# Load data
data(mtcars)

# Basic scatter plot
qplot(x = mpg, y = wt, data = mtcars, geom = "point")

# Scatter plot with smoothed line
qplot(mpg, wt, data = mtcars,
      geom = c("point", "smooth"))

# Change the color by a continuous numeric variable
qplot(mpg, wt, data = mtcars, color = cyl)


# DATA FORMAT #################################################

data("ToothGrowth")
ToothGrowth$dose <- as.factor(ToothGrowth$dose) 
head(ToothGrowth)

# PLOT TYPES #################################################

mydata <- ggplot(ToothGrowth, aes(x = dose, y = len)) 
mydata + geom_boxplot() 
mydata + geom_violin() 
mydata + geom_jitter() 

## Basic box plots

# Box plot
mydata + geom_boxplot()

# Rotate the box plot
mydata + geom_boxplot() + coord_flip() # Notched box plot
mydata + geom_boxplot(notch = TRUE)

# Box plot with mean points
mydata + geom_boxplot() +
  stat_summary(fun.y = mean, geom = "point",
               shape = 18, size = 4, color = "red")

# Use single colors
mydata + geom_boxplot(color = "black", fill = "steelblue") 

# Change outline colors by dose (groups)
mydata + geom_boxplot(aes(color = dose))

# Change fill color by dose (groups)
mydata + geom_boxplot(aes(fill = dose))

## Change manually outline colors
  
# Use custom color palettes
mydata2 <- mydata + geom_boxplot(aes(color = dose)) + theme_minimal()
mydata2 + scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))

# Use brewer color palettes
mydata2 + scale_color_brewer(palette="Dark2")

# Use grey scale
mydata2 + scale_color_grey()

## Basic box  with mutiple group

# Change box plot colors by groups
mydata + geom_boxplot(aes(fill = supp)) 

# Change the position
mydata + geom_boxplot(aes(fill = supp), position = position_dodge(1))

# Change fill colors
mydata + geom_boxplot(aes(fill = supp), position = position_dodge(1)) + 
  scale_fill_manual(values=c("#999999", "#E69F00"))

# Basic violin plots

# Basic box plot
mydata + geom_violin()

# Rotate the violin plot
mydata + geom_violin() + coord_flip()

# Set trim argument to FALSE
mydata + geom_violin(trim = FALSE, fill = "steelblue")


## Bar plots
df <- data.frame(dose=c("D0.5", "D1", "D2"), # create a dataframe
                 len=c(4.2, 10, 29.5))

# head(df)
df2 <- data.frame(supp=rep(c("VC", "OJ"), each=3), 
                  dose=rep(c("D0.5", "D1", "D2"),2), 
                  len=c(6.8, 15, 33, 4.2, 10, 29.5))

# head(df2)

f <- ggplot(df, aes(x = dose, y = len))

# Basic bar plot
f + geom_bar(stat = "identity")

# Change fill color and add labels at the top (vjust = -0.3)
f + geom_bar(stat = "identity", fill = "steelblue")+ geom_text(aes(label = len),
     vjust = -0.3, size = 3.5)+ theme_minimal()

# Label inside bars, vjust = 1.6
f + geom_bar(stat="identity", fill="steelblue")+ geom_text(aes(label=len), 
      vjust=1.6, color="white", size=3.5)+ theme_minimal()


# CLEAN UP #################################################

# Clear packages
detach("package:datasets", unload = TRUE)  # For base

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console

