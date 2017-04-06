# install.packages("ustyc")
library(ustyc)

data <- getYieldCurve() #Function from the given ustyc package
df <- data$df
df$BC_30YEARDISPLAY <- NULL
head(df) #Get the first entries from the fata

#Other required libraries for the visualzation
library(plotly); library(magrittr); library(scales); library(RColorBrewer)

colnames(df) <- gsub("BC_", "", colnames(df))
plot_ly(z = data.matrix(t(df)),
        x = as.Date(rownames(df)),
        y = rep_len(colnames(df), length.out = nrow(df)),
        type = "surface", colors = "Blues") %>%
  layout(scene = list(yaxis = list(type ="category"),
                      aspectratio = list(x = 1.5, y = 0.75, z = 1)))