# File:   ImportingData.R
# Course: Introduction to use of R in Data Analysis (with RStudio)

# INSTALL AND LOAD PACKAGES ################################

install.packages("tidyverse") # Install tidyverse package

library(tidyverse)  # Load the package 


# ABOUT EXCEL FILES ########################################

# From the official R documentation
browseURL("http://j.mp/2aFZUrJ")

# IMPORTING WITH READR #######################################

# CSV

library(readr)
cancer <- read_csv("data/cancer.csv")
head(cancer)

cancer <- read.csv(file.choose())  # difference ways to import data

#You can also create sample data which would be used further to demonstrate 
#data exploration techniques. The program below creates random observations 
#with replacement.

cancers = data.frame(Q1 = sample(1:6, 100, replace = TRUE),
                     Q2 = sample(1:6, 100, replace = TRUE),
                     Q3 = sample(1:6, 100, replace = TRUE), 
                     Q4 = sample(1:6, 100, replace = TRUE), 
                     Age = sample(1:3, 100, replace = TRUE))

# DATA VIEWER ##############################################

?View
View(cancer)

# DESCRIPTIVE #################################

summary(cancer)

# To calculate summary of a particular column, say fourth column, you can use 
# the following syntax: 

summary(cancer[4])

# To calculate summary of a particular column, say fourth column, you can use 
# the following syntax: 

summary(cancer$`How long`)

# Lists name of variables in a dataset 

names(cancer)

# Calculate number of rows and columns in a dataset

nrow(cancer)  # number of rows

ncol(cancer) # number of columns


# List structure of a dataset 

str(cancer)

# First 6 rows of dataset

head(cancer)

# First n rows of dataset


head(cancer, n= 5)

head(cancer, n= -1) # all rows but the last row 


# Last 6 rows of dataset

head(cancer)

# Select random rows from a dataset

library(dplyr)
sample_n(cancer, 7)

# Selecting N% random rows

library(dplyr)
sample_frac(cancer, 0.1)

# Number of missing values
# The function below returns number of missing values 
# in each variable of a dataset. 

colSums(is.na(cancer))

# Number of missing values in a single variable 

sum(is.na(cancer$Gender))

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
