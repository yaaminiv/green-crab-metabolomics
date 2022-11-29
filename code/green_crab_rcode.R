---
```
setwd('C:/Users/Sara/Documents/GitHub/green-crab-metabolomics/data/')
#Install packages

```{r}
#install.packages("tidyverse")
#install.packages("RColorBrewer")
#install.packages("patchwork")
#install.packages("cowplot")
require(tidyverse)
require(RColorBrewer)
require(patchwork)
require(cowplot)
library(ggfortify)
library(ggplot2)
library(tidyverse)
library(ggpubr)
```

```{r}
cw_data <- read.csv("carapace_width.csv")
cl_data <- read.csv("carapace_length.csv")
ig_data <- read.csv("integument_color.csv")
w_data <- read.csv("weight.csv")
```

```
cw_1 <- cw_data[c(1:7,43:49,85:91,127:133,169:175,210:220),c(1,2:3)]
cw_2 <- cw_data[c(8:14,50:56,92:98,134:140,176:182,221:230),c(1,2:3)]
cw_3 <- cw_data[c(15:21,57:63,99:105,141:147,183:188,231:235),c(1,2:3)]
cw_4 <- cw_data[c(22:28,64:70,106:112,148:154,189:195,236:245),c(1,2:3)]
cw_5 <- cw_data[c(29:35,71:77,113:119,155:161,196:202,246:255),c(1,2:3)]
cw_6 <- cw_data[c(36:42,78:84,120:126,162:168,203:209,256:260),c(1,2:3)]

dates <- list(c("7/12/2022","7/15/2022"))

cw1_bp <- ggplot(data = cw_1, aes(x=date, y=carapace.width)) + geom_boxplot() + geom_jitter() + stat_compare_means(comparisons = dates) + labs(y = "Carapace Width", x = "Day") 
cw2_bp <- ggplot(data = cw_2, aes(x=date, y=carapace.width)) + geom_boxplot() + geom_jitter() + labs(y = "Carapace Width", x = "Day") 
cw3_bp <- ggplot(data = cw_3, aes(x=date, y=carapace.width)) + geom_boxplot() + geom_jitter() + labs(y = "Carapace Width", x = "Day") 
cw4_bp <- ggplot(data = cw_4, aes(x=date, y=carapace.width)) + geom_boxplot() + geom_jitter() + labs(y = "Carapace Width", x = "Day") 
cw5_bp <- ggplot(data = cw_5, aes(x=date, y=carapace.width)) + geom_boxplot() + geom_jitter() + labs(y = "Carapace Width", x = "Day") 
cw6_bp <- ggplot(data = cw_6, aes(x=date, y=carapace.width)) + geom_boxplot() + geom_jitter() + labs(y = "Carapace Width", x = "Day") 



p_cw <- plot_grid(cw1_bp + rremove("x.text"), cw2_bp + rremove("x.text"), cw3_bp + rremove("x.text"), cw4_bp + rremove("x.text"), cw5_bp + rremove("x.text"), cw6_bp + rremove("x.text"), labels = c("1","2","3","4","5","6"), ncol=3, nrow=2)
title_cw <- ggdraw() + draw_label("Carapace Width Over Time", fontface='bold')
plot_grid(title_cw, p_ig, ncol=1, rel_heights=c(0.1,1))

 
cw1_bp + stat_compare_means(method = "t.test")
cw2_bp + stat_compare_means(method = "t.test")
cw3_bp + stat_compare_means(method = "t.test")
cw4_bp + stat_compare_means(method = "t.test")
cw5_bp + stat_compare_means(method = "t.test")
cw6_bp + stat_compare_means(method = "t.test")

```

```
cl_1 <- cl_data[c(1:7,43:49,85:91,127:133,169:175,210:220),c(1,2:3)]
cl_2 <- cl_data[c(8:14,50:56,92:98,134:140,176:182,221:230),c(1,2:3)]
cl_3 <- cl_data[c(15:21,57:63,99:105,141:147,183:188,231:235),c(1,2:3)]
cl_4 <- cl_data[c(22:28,64:70,106:112,148:154,189:195,236:245),c(1,2:3)]
cl_5 <- cl_data[c(29:35,71:77,113:119,155:161,196:202,246:255),c(1,2:3)]
cl_6 <- cl_data[c(36:42,78:84,120:126,162:168,203:209,256:260),c(1,2:3)]

cl1_bp <- ggplot(data = cl_1, aes(x=date, y=carapace.length)) + geom_boxplot() + geom_jitter() + labs(y = "Carapace Length", x = "Day") 
cl2_bp <- ggplot(data = cl_2, aes(x=date, y=carapace.length)) + geom_boxplot() + geom_jitter() + labs(y = "Carapace Length", x = "Day") 
cl3_bp <- ggplot(data = cl_3, aes(x=date, y=carapace.length)) + geom_boxplot() + geom_jitter() + labs(y = "Carapace Length", x = "Day") 
cl4_bp <- ggplot(data = cl_4, aes(x=date, y=carapace.length)) + geom_boxplot() + geom_jitter() + labs(y = "Carapace Length", x = "Day") 
cl5_bp <- ggplot(data = cl_5, aes(x=date, y=carapace.length)) + geom_boxplot() + geom_jitter() + labs(y = "Carapace Length", x = "Day") 
cl6_bp <- ggplot(data = cl_6, aes(x=date, y=carapace.length)) + geom_boxplot() + geom_jitter() + labs(y = "Carapace Length", x = "Day") 

p_cl <- plot_grid(cl1_bp + rremove("x.text"), cl2_bp + rremove("x.text"), cl3_bp + rremove("x.text"), cl4_bp + rremove("x.text"), cl5_bp + rremove("x.text"), cl6_bp + rremove("x.text"), labels = c("1","2","3","4","5","6"), ncol=3, nrow=2)
title_cl <- ggdraw() + draw_label("Carapace Length Over Time", fontface='bold')
plot_grid(title_cl, p_cl, ncol=1, rel_heights=c(0.1,1))

```

```

ig_data$integument_color <- recode(ig_data$integument.color,"BG"="0.5","G"="1","YG"="1.5","Y"="2","YO"="2.5","O"="3","RO"="3.5")

ig_1 <- ig_data[c(1:7,43:49,85:91,127:133,169:175,210:220),c(1,2,4)]
ig_2 <- ig_data[c(8:14,50:56,92:98,134:140,176:182,221:230),c(1,2,4)]
ig_3 <- ig_data[c(15:21,57:63,99:105,141:147,183:188,231:235),c(1,2,4)]
ig_4 <- ig_data[c(22:28,64:70,106:112,148:154,189:195,236:245),c(1,2,4)]
ig_5 <- ig_data[c(29:35,71:77,113:119,155:161,196:202,246:255),c(1,2,4)]
ig_6 <- ig_data[c(36:42,78:84,120:126,162:168,203:209,256:260),c(1,2,4)]

ig1_bp <- ggplot(data = ig_1, aes(x=date, fill = integument_color)) + scale_fill_manual(values = c("#00CCCC","#99FF33","#CCFF00","#FFFF00","#FFCC00","#FF9900","#FF6600")) + geom_bar() + labs(y = "Number of Crabs", x = "Day") 
ig2_bp <- ggplot(data = ig_2, aes(x=date, fill = integument_color)) + scale_fill_manual(values = c("#00CCCC","#99FF33","#CCFF00","#FFFF00","#FFCC00","#FF9900","#FF6600")) + geom_bar() + labs(y = "Number of Crabs", x = "Day") 
ig3_bp <- ggplot(data = ig_3, aes(x=date, fill = integument_color)) + scale_fill_manual(values = c("#99FF33","#CCFF00","#FFFF00","#FFCC00","#FF9900","#FF6600")) + geom_bar() + labs(y = "Number of Crabs", x = "Day") 
ig4_bp <- ggplot(data = ig_4, aes(x=date, fill = integument_color)) + scale_fill_manual(values = c("#99FF33","#CCFF00","#FFFF00","#FFCC00","#FF9900","#FF6600")) + geom_bar() + labs(y = "Number of Crabs", x = "Day") 
ig5_bp <- ggplot(data = ig_5, aes(x=date, fill = integument_color)) + scale_fill_manual(values = c("#00CCCC","#99FF33","#CCFF00","#FFFF00","#FFCC00","#FF9900","#FF6600")) + geom_bar() + labs(y = "Number of Crabs", x = "Day") 
ig6_bp <- ggplot(data = ig_6, aes(x=date, fill = integument_color)) + scale_fill_manual(values = c("#99FF33","#CCFF00","#FFFF00","#FFCC00","#FF9900","#FF6600")) + geom_bar() + labs(y = "Number of Crabs", x = "Day") 

p_ig <- plot_grid(ig1_bp + rremove("x.text"), ig2_bp + rremove("x.text"), ig3_bp + rremove("x.text"), ig4_bp + rremove("x.text"), ig5_bp + rremove("x.text"), ig6_bp + rremove("x.text"), labels = c("1","2","3","4","5","6"), ncol=3, nrow=2)
title_ig <- ggdraw() + draw_label("Integument Color Over Time", fontface='bold')
plot_grid(title_ig, p_ig, ncol=1, rel_heights=c(0.1,1))


```
w_1 <- w_data[c(1:7,43:49,85:91,127:133,169:175,210:220),c(1,2:3)]
w_2 <- w_data[c(8:14,50:56,92:98,134:140,176:182,221:230),c(1,2:3)]
w_3 <- w_data[c(15:21,57:63,99:105,141:147,183:188,231:235),c(1,2:3)]
w_4 <- w_data[c(22:28,64:70,106:112,148:154,189:195,236:245),c(1,2:3)]
w_5 <- w_data[c(29:35,71:77,113:119,155:161,196:202,246:255),c(1,2:3)]
w_6 <- w_data[c(36:42,78:84,120:126,162:168,203:209,256:260),c(1,2:3)]

w1_bp <- ggplot(data = w_1, aes(x=date, y=weight)) + geom_boxplot() + geom_jitter() + labs(y = "Weight", x = "Day") 
w2_bp <- ggplot(data = w_2, aes(x=date, y=weight)) + geom_boxplot() + geom_jitter() + labs(y = "Weight", x = "Day") 
w3_bp <- ggplot(data = w_3, aes(x=date, y=weight)) + geom_boxplot() + geom_jitter() + labs(y = "Weight", x = "Day") 
w4_bp <- ggplot(data = w_4, aes(x=date, y=weight)) + geom_boxplot() + geom_jitter() + labs(y = "Weight", x = "Day") 
w5_bp <- ggplot(data = w_5, aes(x=date, y=weight)) + geom_boxplot() + geom_jitter() + labs(y = "Weight", x = "Day") 
w6_bp <- ggplot(data = w_6, aes(x=date, y=weight)) + geom_boxplot() + geom_jitter() + labs(y = "Weight", x = "Day") 

title_w <- ggdraw() + draw_label("Weight Over Time", fontface='bold')
p_w <- plot_grid(w1_bp + rremove("x.text"), w2_bp + rremove("x.text"), w3_bp + rremove("x.text"), w4_bp + rremove("x.text"), w5_bp + rremove("x.text"), w6_bp + rremove("x.text"), labels = c("1","2","3","4","5","6"), ncol=3, nrow=2)
plot_grid(title_w, p_w, ncol=1, rel_heights=c(0.1,1))

```
# Import and format data

# TO DO LIST

- import and format data
- plot growth over time by treatment
- statistical test for growth over time by treatment
- plot sex ratio at start and end for each treatment
- stacked barplot of integument colors over time by treatment
- statistical test for integument color changes by treatment



#_________________________________________________________________________________________

ig_data$integument_color <- recode(ig_data$integument.color,"BG"="0.5","G"="1","YG"="1.5","Y"="2","YO"="2.5","O"="3","RO"="3.5")

ig_data



ig_1 <- ig_data[c(1:7,43:49,85:91,127:133,169:175,210:220),c(1,2,4)]
ig_2 <- ig_data[c(8:14,50:56,92:98,134:140,176:182,221:230),c(1,2,4)]
ig_3 <- ig_data[c(15:21,57:63,99:105,141:147,183:188,231:235),c(1,2,4)]
ig_4 <- ig_data[c(22:28,64:70,106:112,148:154,189:195,236:245),c(1,2,4)]
ig_5 <- ig_data[c(29:35,71:77,113:119,155:161,196:202,246:255),c(1,2,4)]
ig_6 <- ig_data[c(36:42,78:84,120:126,162:168,203:209,256:260),c(1,2,4)]

ig1_bp <- ggplot(data = ig_1, aes(x=date, fill = integument_color)) + scale_fill_manual(values = c("#00CCCC","#99FF33","#CCFF00","#FFFF00","#FFCC00","#FF9900","#FF6600")) + geom_bar() + theme(legend.position="none") + rremove("x.text") + labs(y = "Number of Crabs", x = "Day") 
ig2_bp <- ggplot(data = ig_2, aes(x=date, fill = integument_color)) + scale_fill_manual(values = c("#00CCCC","#99FF33","#CCFF00","#FFFF00","#FFCC00","#FF9900","#FF6600")) + geom_bar() + theme(legend.position="none") + rremove("x.text") + labs(y = "Number of Crabs", x = "Day") 
ig3_bp <- ggplot(data = ig_3, aes(x=date, fill = integument_color)) + scale_fill_manual(values = c("#99FF33","#CCFF00","#FFFF00","#FFCC00","#FF9900","#FF6600")) + geom_bar() + theme(legend.position="none") + rremove("x.text") + labs(y = "Number of Crabs", x = "Day") 
ig4_bp <- ggplot(data = ig_4, aes(x=date, fill = integument_color)) + scale_fill_manual(values = c("#99FF33","#CCFF00","#FFFF00","#FFCC00","#FF9900","#FF6600")) + geom_bar() + theme(legend.position="none") + rremove("x.text") + labs(y = "Number of Crabs", x = "Day") 
ig5_bp <- ggplot(data = ig_5, aes(x=date, fill = integument_color)) + scale_fill_manual(values = c("#00CCCC","#99FF33","#CCFF00","#FFFF00","#FFCC00","#FF9900","#FF6600")) + geom_bar() + theme(legend.position="none") + rremove("x.text") + labs(y = "Number of Crabs", x = "Day") 
ig6_bp <- ggplot(data = ig_6, aes(x=date, fill = integument_color)) + scale_fill_manual(values = c("#99FF33","#CCFF00","#FFFF00","#FFCC00","#FF9900","#FF6600")) + geom_bar() + theme(legend.position="none") + rremove("x.text") + labs(y = "Number of Crabs", x = "Day") 

ig1_bp
ig2_bp

ig_all <- ig_data[c(1:260),c(1,2,4)]
ig_all_bp <- ggplot(data = ig_all, aes(x=date, fill = integument_color)) + scale_fill_manual(values = c("#00CCCC","#99FF33","#CCFF00","#FFFF00","#FFCC00","#FF9900","#FF6600")) + geom_bar() + labs(y = "Number of Crabs", x = "Day")

p_ig <- plot_grid(ig1_bp + rremove("x.text"), ig2_bp + rremove("x.text"), ig3_bp + rremove("x.text"), ig4_bp + rremove("x.text"), ig5_bp + rremove("x.text"), ig6_bp + rremove("x.text"), labels = c("1","2","3","4","5","6"), ncol=3, nrow=2)
title_ig <- ggdraw() + draw_label("Integument Color Over Time", fontface='bold')
legend_ig <- get_legend(ig_all_bp)
plot_grid(title_ig, legend_ig, p_ig, ncol=1, rel_heights=c(0.1,1))

ig_all <- ig_data[c(1:260),c(1,2,4)]
ig_all_bp <- ggplot(data = ig_all, aes(x=date, fill = integument_color)) + scale_fill_manual(values = c("#00CCCC","#99FF33","#CCFF00","#FFFF00","#FFCC00","#FF9900","#FF6600")) + geom_bar() + labs(y = "Number of Crabs", x = "Day")
ig_all_bp
legend_ig <- get_legend(ig_all_bp)

##
p_ig <- plot_grid(ig1_bp + rremove("x.text") + theme(legend.position="none"), ig2_bp + rremove("x.text") + theme(legend.position="none"), ig3_bp + rremove("x.text") + theme(legend.position="none"), ig4_bp + rremove("x.text") + theme(legend.position="none"), ig5_bp + rremove("x.text") + theme(legend.position="none"), ig6_bp + rremove("x.text") + theme(legend.position="none"), labels = c("1","2","3","4","5","6"), ncol=3, nrow=2)
title_ig <- ggdraw() + draw_label("Integument Color Over Time", fontface='bold')
legend_ig <- get_legend(ig_all_bp)
plot_grid(p_ig, title_ig, ncol=1, rel_heights=c(0.1,1))

ig_plots <- align_plots(ig1_bp, ig2_bp, ig3_bp, ig4_bp, ig5_bp, ig6_bp, align = 'v', axis = '1')
ig_top <- plot_grid(ig_plots[[1]], ig_plots[[2]], ig_plots[[3]], legend_ig, labels = c("1","2","3"), rel_widths = c(1, 1, 1, 1), nrow = 1)
ig_bottom <- plot_grid(ig_plots[[4]], ig_plots[[5]], ig_plots[[6]], labels = c("4","5","6"), rel_widths = c(1, 1, 1, 1), nrow = 1)
plot_grid(ig_top, ig_bottom, ncol=1)

ig_top
