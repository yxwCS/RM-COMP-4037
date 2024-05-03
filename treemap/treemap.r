library(treemap)
library(extrafont)
font_import()

#设置工作路径
setwd("D:\\wyx-data\\environment-impact-of-diets-main\\data")
# 载入必要的库
library(pheatmap)
library(dplyr)

expr <- read.csv("Results_21MAR2022_nokcaladjust.csv")
data <- as.data.frame(expr)


getFontSize <- function(index) {
  if (index == 1) {
    return(14)  # 最外层字体大小
  } else if (index == 2) {
    return(12)  # 第二层字体大小
  }
}

light_blue_palette <- colorRampPalette(c("tan2","lightblue2", "steelblue3"))(30)

# 创建TreeMap
treemap(data,
        index=c("diet_group", "age_group"),  # 层次分类
        vSize="mean_ghgs",             # 矩形大小由温室气体排放均值决定
        vColor="mean_eut",            # 矩形颜色由富营养化潜力的平均值决定
        title="Environmental Impact by Diet Group and age",  # 图表标题
        #palette="RdYlGn",
        palette = light_blue_palette,# 颜色板，红黄绿，可以根据需要更改
        border.col="white",            # 矩形边界颜色
        fontcolor.labels=c("gray40","white"),      # 标签字体颜色
        fontsize.labels=c(11,9),
        type="manual",  
        border.lwds=c(3,1),
        align.labels=list(c("center", "center"),c("left", "center")))     
