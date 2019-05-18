### Creating true/false heatmap

## Reading in data
heatmap_data <- read.csv("data_TF.csv", as.is = T, header = T)

## Looking at data
test_df <- data.frame(v1 = c(1, 2/3, 4/10), v2 = c(2/3, 1, 3/5), v3 = c(4/10, 3/5, 1))

## Plotting heatmap
test_df

#### Heat Map Function ####

# heatmap Function
heatmap <- function(df, titlename, l1 = "lightblue1", 
                    m1 = "skyblue1", h1 = "slateblue", xname = "Set of Variables [1]",
                    yname = "Set of Variables [2]", corr_method = "pearson") {
  
  # loading libraries
  library(tidyverse)
  library(reshape2)
  
  # let's first look at numeric variables
  df_num <- select_if(df, is.numeric)
  
  # looking for correlations between our target variable and the other numeric variables
  df_narm <- na.omit(df_num)
  corr.df <- cor(df_narm, method = corr_method)
  print(corr.df)
  
  test = cbind(melt(df_narm), random = expand.grid(names(df_narm), names(df_narm))[,1])
  test
  
  # creating heatmap
  heat_map <- ggplot(data = test, aes(variable, random, fill = value)) +
    geom_tile(color = "black") + scale_fill_gradient2(low = l1, high = h1, mid = m1, 
                                                      midpoint = 0.5, limit = c(0,1), space = "Lab", 
                                                      name="Non-Missing Value\n Commonality") +
    theme_bw() + 
    theme(axis.text.x = element_text(angle = 45, vjust = 1, size = 12, hjust = 1)) +
    coord_fixed() + 
    labs(x = xname, y = yname) +
    ggtitle(titlename) + 
    theme(plot.title = element_text(hjust = 0.5)) + 
    guides(fill = guide_colorbar(barwidth = 3, barheight = 7,
                                 title.position = "top", title.hjust = 0.5))
  return(heat_map)
}

heatmap(test_df, titlename = "haha")


## Reading in data set
test_df2 <- read.csv("heatmap_dat.csv", as.is = T, header = T)

heatmap(test_df2, titlename = "Missing Value Relation Plot")


## 

test_df2 <- data.frame((test_df2)^30)

str(test_df2)
