#设置工作路径
setwd("D:\\wyx-data\\environment-impact-of-diets-main\\data")
# 载入必要的库
library(pheatmap)
library(dplyr)

expr <- read.csv("Results_21MAR2022_nokcaladjust.csv")
data <- as.data.frame(expr)

##数据按照grouping分组
data_summary <- data %>%
  group_by(grouping) %>%
  summarise(across(starts_with("mean_"), mean, na.rm = TRUE),
            .groups = 'drop')  # 计算每个分组的平均值

# 数据归一化
data_normalized <- as.data.frame(scale(data_summary[,-1]))  # 不包括第一列（grouping）
row.names(data_normalized) <- data_summary$grouping  # 设置行名为分组名


# 绘制热图
pheatmap(data_normalized,
         color = colorRampPalette(c("lightblue","#f1eeee","darkorchid4"))(50),
         main = "Normalized Environmental Impacts by Group",
         show_rownames = TRUE,
         fontsize = 7,
         show_colnames = TRUE)
