#################################
# Exploratory Data Analysis (EDA)
#################################

#### load libraries ####
if (!require(pacman)) install.packages("pacman")
pacman::p_load(RCurl, ggplot2, RColorBrewer, dplyr, plyr, lubridate, ggridges)

# declare output directory 
output <- "C:\\Users\\sidne\\Documents\\Notes\\2015contest_CSV\\" # local reference

#### Load / create dataframes ####
# load cleaned consumption data as df
consumption_df <- read.csv(text=getURL("https://raw.githubusercontent.com/stfox13/DSC672FinalProject/master/data/cleaned_data/consumption_v2.csv"),header=T)
consumption_sectorless_df <- consumption_df %>% distinct(Month, Day, Hour, Day_of_week, Weekdays, HolidayName, School_Day, Solar_Elevation, Cloud_Cover_Fraction, Dew_Point, Humidity_Fraction, Precipitable_Water, Temperature, Visibility) 
consumption_sector_elect_use_df <- consumption_df %>% distinct(Sector, lt_5, between_5_and_18, between_18_and_25, between_25_and_65, over_65)

# Add a datetime field (for time series) to consumption_df
consumption_df$datetime <- as_datetime(ymd_h(paste("2015", # an arbitrary year; will not display in graphs 
                                       ifelse(nchar(consumption_df$Month) == 1, paste("0", consumption_df$Month, sep=""), consumption_df$Month), 
                                       ifelse(nchar(consumption_df$Day) == 1, paste("0", consumption_df$Day, sep=""), consumption_df$Day), 
                                       consumption_df$Hour, sep='')))

# Add a date field (for time series) to consumption_df
consumption_df$Date <- ymd(paste("2015", # an arbitrary year; will not display in graphs 
                                                   ifelse(nchar(consumption_df$Month) == 1, paste("0", consumption_df$Month, sep=""), consumption_df$Month), 
                                                   ifelse(nchar(consumption_df$Day) == 1, paste("0", consumption_df$Day, sep=""), consumption_df$Day), sep=''))


# Calculate the mean by Sector, Month, and Day
consumption_elect_mean_df <- as.data.frame(
  ddply(consumption_df, .(Sector, Month, Day),
        summarize,
        MeanElectricity_KW_SQFT=as.numeric(mean(Electricity_KW_SQFT)),
        MaxElectricity_KW_SQFT=as.numeric(max(Electricity_KW_SQFT)),
        MinElectricity_KW_SQFT=as.numeric(min(Electricity_KW_SQFT)))
)

# Calculate the mean by Month and Day
consumption_elect_month_day_df <- as.data.frame(
  ddply(consumption_df, .(Month, Day),
        summarize,
        MeanElectricity_KW_SQFT=as.numeric(mean(Electricity_KW_SQFT)),
        MaxElectricity_KW_SQFT=as.numeric(max(Electricity_KW_SQFT)),
        MinElectricity_KW_SQFT=as.numeric(min(Electricity_KW_SQFT)))
)

# Calculate the mean by Sector and Month
consumption_elect_mean_sectoronly_df <- as.data.frame(
  ddply(consumption_df, .(Sector, Month),
        summarize,
        MeanElectricity_KW_SQFT=as.numeric(mean(Electricity_KW_SQFT)),
        MaxElectricity_KW_SQFT=as.numeric(max(Electricity_KW_SQFT)),
        MinElectricity_KW_SQFT=as.numeric(min(Electricity_KW_SQFT)),
        Mean_Solar_Elevation=as.numeric(mean(Solar_Elevation)))
)

#### Faceted Graphs ####

# Electricity_KW_SQFT by hour faceted by sector
c1 <- ggplot(data=consumption_df, aes(x=Hour, y=Electricity_KW_SQFT, col=Sector)) +
  geom_line(size=1) +
  guides(colour=FALSE) +
  facet_wrap(~Sector, ncol=2, scales='free_y')  +
  scale_y_continuous("Electricity_KW_SQFT", limits = c(0,0.02)) +
  scale_x_continuous("Hour", breaks = seq(1,24, 1), limits = c(1,24)) +
  ylab('Electricity (KW per SQFT)')	+
  ggtitle("Electricity (KW per SQFT) by Hour, Faceted by Sector") +
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), panel.grid.major = element_line(colour = "#E8E8E8"), axis.line = element_line(colour = "black"))

# Time Series Plot Faceted by Month
c2 <- ggplot(data=consumption_elect_month_day_df, aes(Day, MeanElectricity_KW_SQFT, col=factor(Month))) +
  geom_line(size=1) + 
  guides(colour=FALSE) + 
  facet_wrap(~Month, ncol=3, scales="free_y") +
  scale_x_continuous("Day", limits=c(0,31), breaks=seq(0,31,5)) +
  ylab('Mean Electricity (KW per SQFT)')	+
  ggtitle("Mean Electricity (KW per SQFT) by Day, Faceted by Month") +
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), panel.grid.major = element_line(colour = "#E8E8E8"), axis.line = element_line(colour = "black"))

#### Time Series Plots ####

# time series plot - Residential
c3 <- ggplot(consumption_df[consumption_df$Sector == 'RESIDENTIAL', ], aes(datetime, Electricity_KW_SQFT)) +
  scale_y_continuous("Electricity_KW_SQFT", limits= c(0,0.0025)) +
  geom_line(color="#4daf4a", alpha=0.8) +
  stat_smooth(color="#ffff33") +
  scale_x_datetime("Date (Month-Day)", date_breaks="1 month", date_labels = "%m-%d") + 
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), panel.grid.major = element_line(colour = "#E8E8E8"), axis.line = element_line(colour = "black")) +
  ggtitle("Time Series Plot - Electricity (KW per SQFT)\nResidential Sector")

# time series - K12_Schools
c4 <- ggplot(consumption_df[consumption_df$Sector == 'K12_SCHOOLS', ], aes(datetime, Electricity_KW_SQFT)) +
  scale_y_continuous("Electricity (KW per SQFT)", limits= c(0,0.0050)) +
  geom_line(color="#4daf4a", alpha=0.8) +
  stat_smooth(color="#ffff33") +
  scale_x_datetime("Date (Month-Day)", date_breaks="1 month", date_labels = "%m-%d") + 
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), panel.grid.major = element_line(colour = "#E8E8E8"), axis.line = element_line(colour = "black")) +
  ggtitle("Time Series Plot - Electricity (KW per SQFT)\nK-12 Schools Sector")

# time series - Lodging
c5 <- ggplot(consumption_df[consumption_df$Sector == 'LODGING', ], aes(datetime, Electricity_KW_SQFT)) +
  scale_y_continuous("Electricity (KW per SQFT)", limits= c(0,0.0035), breaks=seq(0,0.0035,0.0005)) +
  geom_line(color="#4daf4a", alpha=0.8) +
  stat_smooth(color="#ffff33") +
  scale_x_datetime("Date (Month-Day)", date_breaks="1 month", date_labels = "%m-%d") + 
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), panel.grid.major = element_line(colour = "#E8E8E8"), axis.line = element_line(colour = "black")) +
  ggtitle("Time Series Plot - Electricity (KW per SQFT)\nLodging Sector")

# time series - STAND_ALONE_RETAIL
c6 <- ggplot(consumption_df[consumption_df$Sector == 'STAND_ALONE_RETAIL', ], aes(datetime, Electricity_KW_SQFT)) +
  scale_y_continuous("Electricity (KW per SQFT)", limits= c(0,0.0045), breaks=seq(0,0.0045,0.0005)) +
  geom_line(color="#4daf4a", alpha=0.8) +
  stat_smooth(color="#ffff33") +
  scale_x_datetime("Date (Month-Day)", date_breaks="1 month", date_labels = "%m-%d") + 
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), panel.grid.major = element_line(colour = "#E8E8E8"), axis.line = element_line(colour = "black")) +
  ggtitle("Time Series Plot - Electricity (KW per SQFT)\nStand Alone Retail Sector")

# time series - HEALTH_CARE
c7 <- ggplot(consumption_df[consumption_df$Sector == 'HEALTH_CARE', ], aes(datetime, Electricity_KW_SQFT)) +
  scale_y_continuous("Electricity (KW per SQFT)", limits= c(0,0.007), breaks=seq(0,0.007,0.001)) +
  geom_line(color="#4daf4a", alpha=0.8) +
  stat_smooth(color="#ffff33") +
  scale_x_datetime("Date (Month-Day)", date_breaks="1 month", date_labels = "%m-%d") + 
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), panel.grid.major = element_line(colour = "#E8E8E8"), axis.line = element_line(colour = "black")) +
  ggtitle("Time Series Plot - Electricity (KW per SQFT)\nHealth Care Sector")

# time series - OFFICE
c8 <- ggplot(consumption_df[consumption_df$Sector == 'OFFICE', ], aes(datetime, Electricity_KW_SQFT)) +
  scale_y_continuous("Electricity (KW per SQFT)", limits= c(0,0.007), breaks=seq(0,0.007,0.001)) +
  geom_line(color="#4daf4a", alpha=0.8) +
  stat_smooth(color="#ffff33") +
  scale_x_datetime("Date (Month-Day)", date_breaks="1 month", date_labels = "%m-%d") + 
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), panel.grid.major = element_line(colour = "#E8E8E8"), axis.line = element_line(colour = "black")) +
  ggtitle("Time Series Plot - Electricity (KW per SQFT)\nOffice Sector")

# time series - FOOD_SERVICE
c9 <- ggplot(consumption_df[consumption_df$Sector == 'FOOD_SERVICE', ], aes(datetime, Electricity_KW_SQFT)) +
  scale_y_continuous("Electricity (KW per SQFT)", limits= c(0,0.02), breaks=seq(0,0.02,0.005)) +
  geom_line(color="#4daf4a", alpha=0.8) +
  stat_smooth(color="#ffff33") +
  scale_x_datetime("Date (Month-Day)", date_breaks="1 month", date_labels = "%m-%d") + 
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), panel.grid.major = element_line(colour = "#E8E8E8"), axis.line = element_line(colour = "black")) +
  ggtitle("Time Series Plot - Electricity (KW per SQFT)\nFood Service Sector")

# time series - GROCERY
c10 <- ggplot(consumption_df[consumption_df$Sector == 'GROCERY', ], aes(datetime, Electricity_KW_SQFT)) +
  scale_y_continuous("Electricity (KW per SQFT)", limits= c(0,0.009), breaks=seq(0,0.009,0.001)) +
  geom_line(color="#4daf4a", alpha=0.8) +
  stat_smooth(color="#ffff33") +
  scale_x_datetime("Date (Month-Day)", date_breaks="1 month", date_labels = "%m-%d") + 
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), panel.grid.major = element_line(colour = "#E8E8E8"), axis.line = element_line(colour = "black")) +
  ggtitle("Time Series Plot - Electricity (KW per SQFT)\nGrocery Sector")

#### Density / Ridgeline ####

# Density plot by sector
c11 <- ggplot(consumption_df, aes(Electricity_KW_SQFT, fill = Sector)) +
  geom_density(position = "stack") +
  scale_x_continuous("Electricity_KW_SQFT", breaks=seq(0,0.02,0.005), limits=c(0,0.02)) +
  scale_y_continuous("Density", breaks=seq(0,4.0, 0.5), limits = c(0,4.0)) +
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), legend.position = "none", axis.line = element_line(colour = "black")) + 
  ggtitle("Density Plot by Sector")

# Ridgeline plot by sector
c12 <- ggplot(consumption_df, aes(x = Electricity_KW_SQFT, y = Sector, fill = Sector)) +
  geom_density_ridges() + 
  scale_color_brewer(palette = "Set1") +
  theme_minimal() +
  scale_y_discrete("Electricity (KW per SQFT)") +
  theme(panel.grid.minor=element_blank(), legend.position = "none", axis.line = element_line(colour = "black")) + 
  ggtitle("Ridegeline Plot by Sector") 

#### Violin Plot by Hour ####

# Residential
c13 <- ggplot(data = consumption_df[consumption_df$Sector=='RESIDENTIAL',], 
       aes(factor(Hour), y = Electricity_KW_SQFT, fill=factor(Hour))) + 
  scale_x_discrete("Hour", breaks=seq(1,24, 1)) +
  scale_y_continuous("Electricity (KW per SQFT)", limits=c(0, 0.0025)) +
  geom_violin(alpha=0.6, trim=FALSE) + 
  geom_boxplot(width=0.1, fill="white") +
  scale_color_brewer(palette = "Set1") +
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), legend.position = "none", axis.line = element_line(colour = "black")) + 
  ggtitle("Violin Plot of Electricity (KW per SQFT) By Hour\nResidential Sector")

# K-12 Schools
c14 <- ggplot(data = consumption_df[consumption_df$Sector=='K12_SCHOOLS',], 
       aes(factor(Hour), y = Electricity_KW_SQFT, fill=factor(Hour))) + 
  scale_x_discrete("Hour", breaks=seq(1,24, 1)) +
  scale_y_continuous("Electricity (KW per SQFT)") +
  geom_violin(alpha=0.6, trim=FALSE) + 
  geom_boxplot(width=0.1, fill="white") +
  scale_color_brewer(palette = "Set1") +
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), legend.position = "none", axis.line = element_line(colour = "black")) + 
  ggtitle("Violin Plot of Electricity (KW per SQFT) By Hour\nK-12 Schools Sector")

# Lodging
c15 <- ggplot(data = consumption_df[consumption_df$Sector=='LODGING',], 
       aes(factor(Hour), y = Electricity_KW_SQFT, fill=factor(Hour))) + 
  scale_x_discrete("Hour", breaks=seq(1,24, 1)) +
  scale_y_continuous("Electricity (KW per SQFT)", limits=c(0,0.004), breaks=seq(0, 0.0035, 0.0005)) +
  geom_violin(alpha=0.6, trim=FALSE) + 
  geom_boxplot(width=0.1, fill="white") +
  scale_color_brewer(palette = "Set1") +
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), legend.position = "none", axis.line = element_line(colour = "black")) + 
  ggtitle("Violin Plot of Electricity (KW per SQFT) By Hour\nLodging Sector")

# STAND_ALONE_RETAIL
c16 <- ggplot(data = consumption_df[consumption_df$Sector=='STAND_ALONE_RETAIL',], 
       aes(factor(Hour), y = Electricity_KW_SQFT, fill=factor(Hour))) + 
  scale_x_discrete("Hour", breaks=seq(1,24, 1)) +
  scale_y_continuous("Electricity (KW per SQFT)") +
  geom_violin(alpha=0.6, trim=FALSE) + 
  geom_boxplot(width=0.1, fill="white") +
  scale_color_brewer(palette = "Set1") +
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), legend.position = "none", axis.line = element_line(colour = "black")) + 
  ggtitle("Violin Plot of Electricity (KW per SQFT) By Hour\nStand Alone Retail Sector")

# HEALTH_CARE
c17 <- ggplot(data = consumption_df[consumption_df$Sector=='HEALTH_CARE',], 
       aes(factor(Hour), y = Electricity_KW_SQFT, fill=factor(Hour))) + 
  scale_x_discrete("Hour", breaks=seq(1,24, 1)) +
  scale_y_continuous("Electricity (KW per SQFT)", limits = c(0,0.0075), breaks=seq(0,0.0075, 0.0015)) +
  geom_violin(alpha=0.6, trim=FALSE) + 
  geom_boxplot(width=0.1, fill="white") +
  scale_color_brewer(palette = "Set1") +
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), legend.position = "none", axis.line = element_line(colour = "black")) + 
  ggtitle("Violin Plot of Electricity (KW per SQFT) By Hour\nHealth Care Sector")

# OFFICE
c18 <- ggplot(data = consumption_df[consumption_df$Sector=='OFFICE',], 
       aes(factor(Hour), y = Electricity_KW_SQFT, fill=factor(Hour))) + 
  scale_x_discrete("Hour", breaks=seq(1,24, 1)) +
  scale_y_continuous("Electricity (KW per SQFT)") +
  geom_violin(alpha=0.6, trim=FALSE) + 
  geom_boxplot(width=0.1, fill="white") +
  scale_color_brewer(palette = "Set1") +
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), legend.position = "none", axis.line = element_line(colour = "black")) + 
  ggtitle("Violin Plot of Electricity (KW per SQFT) By Hour\nOffice Sector")

# FOOD_SERVICE
c19 <- ggplot(data = consumption_df[consumption_df$Sector=='FOOD_SERVICE',], 
       aes(factor(Hour), y = Electricity_KW_SQFT, fill=factor(Hour))) + 
  scale_x_discrete("Hour", breaks=seq(1,24, 1)) +
  scale_y_continuous("Electricity (KW per SQFT)") +
  geom_violin(alpha=0.6, trim=FALSE) + 
  geom_boxplot(width=0.1, fill="white") +
  scale_color_brewer(palette = "Set1") +
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), legend.position = "none", axis.line = element_line(colour = "black")) + 
  ggtitle("Violin Plot of Electricity (KW per SQFT) By Hour\nFood Service Sector")

# GROCERY
c20 <- ggplot(data = consumption_df[consumption_df$Sector=='GROCERY',], 
       aes(factor(Hour), y = Electricity_KW_SQFT, fill=factor(Hour))) + 
  scale_x_discrete("Hour", breaks=seq(1,24, 1)) +
  scale_y_continuous("Electricity (KW per SQFT)", limits=c(0,0.009), breaks=seq(0,0.009, 0.001)) +
  geom_violin(alpha=0.6, trim=FALSE) + 
  geom_boxplot(width=0.1, fill="white") +
  scale_color_brewer(palette = "Set1") +
  theme_minimal() + 
  theme(panel.grid.minor=element_blank(), legend.position = "none", axis.line = element_line(colour = "black")) + 
  ggtitle("Violin Plot of Electricity (KW per SQFT) By Hour\nGrocery Sector")

#### Output files ####
outputfile <- paste(output, "c1.jpg", sep = "")
print(c1)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c2.jpg", sep = "")
print(c2)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c3.jpg", sep = "")
print(c3)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c4.jpg", sep = "")
print(c4)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c5.jpg", sep = "")
print(c5)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c6.jpg", sep = "")
print(c6)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c7.jpg", sep = "")
print(c7)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c8.jpg", sep = "")
print(c8)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c9.jpg", sep = "")
print(c9)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c10.jpg", sep = "")
print(c10)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c11.jpg", sep = "")
print(c11)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c12.jpg", sep = "")
print(c12)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c13.jpg", sep = "")
print(c13)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c14.jpg", sep = "")
print(c14)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c15.jpg", sep = "")
print(c15)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c16.jpg", sep = "")
print(c16)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c17.jpg", sep = "")
print(c17)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c18.jpg", sep = "")
print(c18)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c19.jpg", sep = "")
print(c19)
ggsave(outputfile, width = 12, height = 8, dpi = 300)

outputfile <- paste(output, "c20.jpg", sep = "")
print(c20)
ggsave(outputfile, width = 12, height = 8, dpi = 300)
