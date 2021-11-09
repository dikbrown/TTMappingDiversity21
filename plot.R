library(usmap)
library(grid)
library(gridExtra)
library(ggplot2)
library(png)
bg <- readPNG("./data/diversity.png")


vp1 <- viewport(x = 0, y = .9, w = 1, h = 0.1) #top screen for title

vp2 <- viewport(x = 0, y = .5, w = 0.33, h = 0.4) #Main panel - overall rank

vp3 <- viewport(x = 0, y = 0.27, w = 0.33, h = .23) # row 1, plot 1 - Socioeconomic
vp4 <- viewport(x = 0.33, y = 0.27, w = 0.33, h = 0.23) # row 1, plot 2 - Cultural
vp5 <- viewport(x = 0.67, y = 0.27, w = 0.33, 0.23) # row 1, plot 3 - Economic

vp6 <- viewport(x = 0, y = 0.04, w = 0.33, h = 0.23)   # row 2, plot 1 - Household
vp7 <- viewport(x = 0.33, y = 0.04, w = 0.33, h = 0.23) #row 2, plot 2 - Religious
vp8 <- viewport(x = 0.67, y = 0.04, w = 0.33, h = 0.23) # row 2, plot 3 - Political

vp9 <- viewport(x = 0, y = 0, w = 1, h = 0.04) # bottom screen for citation


arrangeGrob()
### Title
screen(1)
text("US Diversity Rankings", 
     x = 0.5, 
     y = 0.7,
     cex = 2)
text("Overall Diversity",
     x = 0.5,
     y = 0.2,
     cex = 0.8)
### Overall rank

overall <- plot_usmap("states", data = diversity, values ="Overall.Rank") +
  scale_fill_continuous(low = "white", high = "black") + 
  ggtitle("Overall Diversity Rank",
          subtitle = "1 = White, 50 = Darkest Color") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 16),
        plot.subtitle = element_text(hjust = 0.5)) +
  ggpubr::background_image(bg)

### Socioeconomic rank
socio <- plot_usmap("states", data = diversity, values ="Socioeconomic.Diversity.") +
  scale_fill_continuous(low = "white", high = "darkred")  + 
  ggtitle("Socioeconomic Diversity Rank") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5))
  

### Cultural rank

cultural <- plot_usmap("states", data = diversity, values ="Cultural.Diversity.") +
  scale_fill_continuous(low = "white", high = "darkblue") + 
  ggtitle("Cultural Diversity Rank") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5))

### Economic rank

econ <- plot_usmap("states", data = diversity, values ="Economic.Diversity.") +
  scale_fill_continuous(low = "white", high = "darkgreen") + 
  ggtitle("Economic Diversity Rank") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5))

### Household rank
house <- plot_usmap("states", data = diversity, values ="Household.Diversity.") +
  scale_fill_continuous(low = "white", high = "aquamarine4") + 
  ggtitle("Household Diversity Rank") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5))

### Religious rank

relig <- plot_usmap("states", data = diversity, values ="Religious.Diversity.") +
  scale_fill_continuous(low = "white", high = "deepskyblue4") + 
  ggtitle("Religious Diversity Rank") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5))

### Political rank

poli <- plot_usmap("states", data = diversity, values ="Political.Diversity.") +
  scale_fill_continuous(low = "white", high = "darkorange4") + 
  ggtitle("Political Diversity Rank") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5))

datacitation <- textGrob("Data from WalletHub.com")
plotcitation <- textGrob("Plot by\nDick Brown\n@dikbrown\nlinkedin.com/in/dickbrown")
grid.arrange(overall,
             arrangeGrob(arrangeGrob(socio, cultural, econ, ncol = 3),
                          arrangeGrob(house, relig, poli, ncol = 3)),
             nrow = 2)
layout <- rbind(c(1,2,2,2,2,3),
                c(1,2,2,2,2,3),
                c(4,4,5,5,6,6),
                c(7,7,8,8,9,9))
grid.arrange(plotcitation, overall, datacitation,
             socio, cultural, econ,
             house, relig, poli,
             layout_matrix = layout)
# layout <- matrix(rbind(c(1,1,1,1,1,1),
#                 c(1,1,1,1,1,1),
#                 c(2,2,3,3,4,4),
#                 c(5,5,6,6,7,7)), ncol = 6, nrow = 4)
gs <- c(overall, socio, cultural, econ, house, relig, poli)   

grid.arrange(gs)





### Citation panel

text(x = 0.1, y = 0.5,
     labels = "data from BigPumpkins.com")
text(x = 0.8, y = 0.5, 
     labels = 'Plot by Dick Brown | @dikbrown | linkedin.com/in/dickbrown')
close.screen(all = TRUE)
