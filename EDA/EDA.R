#################################
# Exploratory Data Analysis (EDA)
#################################

# load libraries
if (!require(pacman)) install.packages("pacman")
pacman::p_load(RCurl, ggplot2, RColorBrewer)

# load cleaned data as df
solararray_df <- read.csv(text=getURL("https://raw.githubusercontent.com/stfox13/DSC672FinalProject/master/data/cleaned_data/solararray_dataset.csv"),header=T)

# solar elevation, faceted by year (line chart)
ggplot(data=solararray_df, aes(x=Hour, y=Solar_Elevation, col=Year)) +
  geom_line(size=1) +
  guides(colour=FALSE) +
  facet_wrap(~Year, ncol=1, scales='free_y')  +
  scale_y_continuous("Solar Elevation", breaks = seq(-70, 70, 35), limits = c(-70,70)) +
  scale_x_continuous("Hour", breaks = seq(1,24, 1), limits = c(1,24)) +
  ylab('Solar Elevation')	+
  ggtitle("Solar Elevation By Hour, Faceted by Year") +
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), panel.grid.major = element_line(colour = "#E8E8E8"))

# solar elevation by hour (line chart)
ggplot(data = solararray_df, 
aes(x = Hour, y = Solar_Elevation)) + 
scale_x_continuous("Hour", breaks=seq(1,24, 1)) +
scale_y_continuous("Solar Elevation", breaks=seq(-70, 70, 20)) +
geom_line(color = "#0c2c84", size = 2) +
geom_smooth(color = "#edf8b1", span=0.8, size = 1) +
theme_minimal() + 
ggtitle("Solar Elevation By Hour") +
theme(panel.grid.minor=element_blank())

# solar elevation by hour - Violin Plot
ggplot(data = solararray_df[], 
       aes(factor(Hour), y = Solar_Elevation, fill=factor(Hour))) + 
  scale_x_discrete("Hour", breaks=seq(1,24, 1)) +
  scale_y_continuous("Solar Elevation", breaks=seq(-70, 70, 20)) +
geom_violin(alpha=0.6, trim=FALSE) + 
geom_boxplot(width=0.1, fill="white") +
theme_minimal() + 
theme(panel.grid.minor=element_blank(), legend.position = "none") + 
ggtitle("Violin Plot of Solar Elevation By Hour")
    
# cloud cover fraction by hour
ggplot(data = solararray_df, 
       aes(x = Hour, y = Cloud_Cover_Fraction)) + 
  scale_x_continuous("Hour", breaks=seq(1,24, 1)) +
  scale_y_continuous("Cloud Cover Fraction", breaks=seq(0, 1, .25)) +
  geom_line(color = "#225ea8", size = 2) +
  geom_smooth(color = "#edf8b1", span=0.8, size = 1) +
  ggtitle("Cloud Cover Fraction By Hour") +
  theme_minimal() + 
  theme(panel.grid.minor=element_blank())
