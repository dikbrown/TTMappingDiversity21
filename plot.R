library(usmap)
library(grid)
library(gridExtra)
library(ggplot2)
library(png)

### Overall rank

overall <- plot_usmap("states", data = diversity, values ="Overall.Rank") +
  scale_fill_continuous(low = "white", high = "black") + 
  ggtitle("Overall Diversity Rank",
          subtitle = "White = Most diverse               Darkest Color = Least diverse") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 48),
        plot.subtitle = element_text(hjust = 0.5, size = 24))

### Socioeconomic rank
socio <- plot_usmap("states", data = diversity, values ="Socioeconomic.Diversity.") +
  scale_fill_continuous(low = "white", high = "darkred")  + 
  ggtitle("Socioeconomic Diversity Rank") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 24))
  

### Cultural rank

cultural <- plot_usmap("states", data = diversity, values ="Cultural.Diversity.") +
  scale_fill_continuous(low = "white", high = "darkblue") + 
  ggtitle("Cultural Diversity Rank") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 24))

### Economic rank

econ <- plot_usmap("states", data = diversity, values ="Economic.Diversity.") +
  scale_fill_continuous(low = "white", high = "darkgreen") + 
  ggtitle("Economic Diversity Rank") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 24))

### Household rank
house <- plot_usmap("states", data = diversity, values ="Household.Diversity.") +
  scale_fill_continuous(low = "white", high = "aquamarine4") + 
  ggtitle("Household Diversity Rank") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 24))

### Religious rank

relig <- plot_usmap("states", data = diversity, values ="Religious.Diversity.") +
  scale_fill_continuous(low = "white", high = "deepskyblue4") + 
  ggtitle("Religious Diversity Rank") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 24))

### Political rank

poli <- plot_usmap("states", data = diversity, values ="Political.Diversity.") +
  scale_fill_continuous(low = "white", high = "darkorange4") + 
  ggtitle("Political Diversity Rank") + 
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5, size = 24))

datacitation <- textGrob("Data from WalletHub.com", gp = gpar(fontsize = 24), hjust = 1)
plotcitation <- textGrob("Plot by\nDick Brown\n@dikbrown\nlinkedin.com/in/dickbrown", gp = gpar(fontsize = 24), hjust = 0.3)



# Create layout grid for image

layout <- rbind(c(1,2,2,2,2,3), #citation text takes up left and right 1/6 of top half of screen
                c(1,2,2,2,2,3), #   Overall diversity takes up middle 2/3 of top half of screen
                c(4,4,5,5,6,6), # Each diversity subcategory takes up 1/6 of bottom half of screen
                c(7,7,8,8,9,9))



#png("./plot.png", width = 1200, height = 900)
grid.arrange(plotcitation, overall, datacitation,
             socio, cultural, econ,
             house, relig, poli,
             layout_matrix = layout)
#dev.off()

