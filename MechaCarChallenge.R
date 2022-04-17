library(dplyr)

# DELIV 1
mechacar_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

car_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_mpg)

summary(car_lm)


# DELIV 2
suspension <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

total_summary <- suspension %>% summarize(mean_PSI = mean(PSI),
                                          median_PSI = median(PSI),
                                          var_PSI = var(PSI),
                                          stddev_PSI = sd(PSI),
                                          .groups = 'keep') 
total_summary

lot_summary <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(mean_PSI = mean(PSI),
                                                                        median_PSI = median(PSI),
                                                                        var_PSI = var(PSI),
                                                                        stddev_PSI = sd(PSI),
                                                                        .groups = 'keep') 
  
lot_summary

# DELIV 3

t.test(suspension$PSI, mu=1500)

t.test(subset(suspension, Manufacturing_Lot=="Lot1")$PSI, mu=1500)
t.test(subset(suspension, Manufacturing_Lot=="Lot2")$PSI, mu=1500)
t.test(subset(suspension, Manufacturing_Lot=="Lot3")$PSI, mu=1500)
