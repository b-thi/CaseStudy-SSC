### Libraries
library(tidyverse)
library(GGally)
library(e1071)

### Loading data
load("cchs11.RData")

### Getting into analytic data set
cchs11.new <- cchs11[, c("ADMA_RNO", "CCCA_121", "CCCA_051", "CCCA_05A", "DHHAGAGE", "DHHA_SEX", 
                         "DHHAGMS", "SDCAGRAC", "SDCAFIMM", "SDCAGRES", "EDUADR04", "INCAGHH", 
                         "HWTAGBMI", "PACADPAI", "TWDA_5", "SMKADSTY", "ALCADTYP", "CCCA_071", 
                         "CCCA_101", "CCCA_91B", "FVCADTOT", "GENA_07", "GEOAGPRV", "WTSAM")]

#Find Missing or Invalid Values

#Has heart disease
na.CCCA_121 <- which(!(cchs11.new$CCCA_121 %in% c("YES", "NO"))) 

#Has arthritis or rheumatism
na.CCCA_051 <- which(!(cchs11.new$CCCA_051 %in% c("YES", "NO"))) 

#Kind of arthritis
na.CCCA_05A <- which((cchs11.new$CCCA_05A %in% c("OTHER", "RHEUMATOID ARTH"))) 

#Age - restrict analysis to ages 20-64, as instructed
na.DHHAGAGE <- which((cchs11.new$DHHAGAGE %in% c("12 TO 14 YEARS", "15 TO 19 YEARS", "65 TO 69 YEARS", "70 TO 74 YEARS", "75 TO 79 YEARS", "80 YEARS OR MORE"))) 

#Marital status
na.DHHAGMS <- which((cchs11.new$DHHAGMS %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED"))) 

#Cultural / racial origin
na.SDCAGRAC <- which((cchs11.new$SDCAGRAC %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Immigrant status
na.SDCAFIMM <- which(!(cchs11.new$SDCAFIMM %in% c("YES", "NO"))) 

#Of those who answered "YES" above, which didn't specify their time in Canada since immigrating
na.SDCAGRES <- which((cchs11.new$SDCAFIMM %in% "YES") & (cchs11.new$SDCAGRES %in% "NOT STATED")) 

#Highest level of education
na.EDUADR04 <- which((cchs11.new$EDUADR04 %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Total household income
na.INCAGHH <- which((cchs11.new$INCAGHH %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#BMI
na.HWTAGBMI <- which((cchs11.new$HWTAGBMI %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Physical activity index
na.PACADPAI <- which((cchs11.new$PACADPAI %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Has a regular medical doctor 
na.TWDA_5 <- which((cchs11.new$TWDA_5 %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Type of smoker
na.SMKADSTY <- which((cchs11.new$SMKADSTY %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Type of drinker
na.ALCADTYP <- which((cchs11.new$ALCADTYP %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Has high blood pressure
na.CCCA_071 <- which((cchs11.new$CCCA_071 %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Has diabetes
na.CCCA_101 <- which((cchs11.new$CCCA_101 %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Has emphysema or chronic obstructive pulmonary disease (COPD)
na.CCCA_91B <- which((cchs11.new$CCCA_91B %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Daily consumption - total fruits and vegetables
na.FVCADTOT <- which((cchs11.new$FVCADTOT %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Self-perceived stress
na.GENA_07 <- which((cchs11.new$GENA_07 %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Province
na.GEOAGPRV <- which((cchs11.new$GEOAGPRV %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

### Looking at data set
str(cchs11.new)

### Creatin osteo variable
cchs11.new$has_osteo <- ifelse(cchs11.new$CCCA_05A == "OSTEOARTHRITIS", 1, 0)
cchs11.new <- cchs11.new[,-c(4)]

### Subsetting
#cchs11.subset <- cchs11.new[sample(1:130880, 50),]

### Looking at box plots, first with 
#svmfit = svm(has_osteo ~ CCCA_121, data = cchs11.subset, kernel = "linear", cost = 10, scale = T)

#plot(svmfit, cchs11.subset)

library(randomForest)

######### Doing some recodin
cchs11.new$FVCADTOT <- as.numeric(cchs11.new$FVCADTOT)
cchs11.new$HWTAGBMI <- as.numeric(cchs11.new$HWTAGBMI)
cchs11.new <- cchs11.new[-(na.CCCA_121),]
cchs11.new <- cchs11.new[-(which(is.na(cchs_train$CCCA_121))),]
cchs11.new$CCCA_121 <- droplevels(cchs11.new$CCCA_121)
sum(is.na(cchs11.new$CCCA_121))
cchs11.subset <- cchs11.new[sample(1:130880, 5000),]

### train/test
cchs_train <- cchs11.subset[1:(nrow(cchs11.subset)/1.5),]
cchs_test <- cchs11.subset[((nrow(cchs11.subset)/1.5) + 1):nrow(cchs11.subset),]
str(cchs_train)
### Running model
rf_r <- randomForest(as.factor(CCCA_121) ~ ., 
                     data = cchs_train, ntree = 10000,
                     na.action = na.roughfix)
?randomForest
### Predicintg
# Making prediction on test set
rf_r_pred <- sum(as.vector(predict(rf_r, cchs_test)) == 
                   cchs_test$has_osteo)/nrow(cchs_test)

# Looking at error rate
rf_r_pred

### Importance
importance(rf_r)
varImpPlot(rf_r)

### Running model
rf_r <- randomForest(as.factor(has_osteo) ~ CCCA_121, 
                     data = cchs_train, ntree = 10000)

### Predicintg
# Making prediction on test set
rf_r_pred <- sum(as.vector(predict(rf_r, cchs_test)) == 
                   cchs_test$has_osteo)/nrow(cchs_test)

# Looking at error rate
rf_r_pred
