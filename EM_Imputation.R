### MISSING DATA IMPUTATIONS ###

### Getting proper data set
### Libraries
library(tidyverse)
library(GGally)
library(e1071)
library(Amelia)

### Loading data
load("cchs11.RData")

### Getting into analytic data set
cchs11.new <- cchs11[, c("ADMA_RNO", "CCCA_121", "CCCA_051", "CCCA_05A", "DHHAGAGE", "DHHA_SEX", 
                         "DHHAGMS", "SDCAGRAC", "SDCAFIMM", "SDCAGRES", "EDUADR04", "INCAGHH", 
                         "HWTAGBMI", "PACADPAI", "TWDA_5", "SMKADSTY", "ALCADTYP", "CCCA_071", 
                         "CCCA_101", "CCCA_91B", "FVCADTOT", "GENA_07", "GEOAGPRV", "WTSAM")]


### Recoding Variables - One by One and Editing ###

###############################################
## CCCA_121
unique(cchs11.new$CCCA_121)
str(cchs11.new$CCCA_121)

## Turning values into NAs
cchs11.new$CCCA_121 <- ifelse(cchs11.new$CCCA_121 %in% c("YES", "NO"), cchs11.new$CCCA_121, NA)

## Looking again
unique(cchs11.new$CCCA_121)

## Looking at structure
str(cchs11.new$CCCA_121)

## Removing NAs
na.CCCA_121 <- which(!(cchs11.new$CCCA_121 %in% c(1, 2))) 
cchs11.new <- cchs11.new[-na.CCCA_121, ]

## Looking at structure again
str(cchs11.new$CCCA_121)

## Turning into factor
cchs11.new$CCCA_121 <- factor(cchs11.new$CCCA_121, levels = c(1, 2), labels = c("YES", "NO"))

## Looking at structure again
str(cchs11.new$CCCA_121)

###############################################
## CCCA_051
unique(cchs11.new$CCCA_051)
str(cchs11.new$CCCA_051)
levels(cchs11.new$CCCA_051)

## Removing missing values
na.CCCA_051 <- which(!(cchs11.new$CCCA_051 %in% c("YES", "NO"))) 
cchs11.new <- cchs11.new[-na.CCCA_051, ]

## Dropping levels
cchs11.new$CCCA_051 <- droplevels(cchs11.new$CCCA_051)

## Looking at variable again
unique(cchs11.new$CCCA_051)
str(cchs11.new$CCCA_051)
levels(cchs11.new$CCCA_051)

###############################################
## CCCA_05A
unique(cchs11.new$CCCA_05A)
str(cchs11.new$CCCA_05A)
levels(cchs11.new$CCCA_05A)

## Seeing missing values
na.CCCA_05A <- which((cchs11.new$CCCA_05A %in% c("OTHER", "RHEUMATOID ARTH"))) 

## Turning into NA
cchs11.new$CCCA_05A[na.CCCA_05A] <- NA

## Dropping levels
cchs11.new$CCCA_05A <- droplevels(cchs11.new$CCCA_05A)

## Looking at variable again
unique(cchs11.new$CCCA_05A)
str(cchs11.new$CCCA_05A)
levels(cchs11.new$CCCA_05A)

## Dropping this variable
cchs11.new <- cchs11.new %>% 
  select(-CCCA_05A)

###############################################
## DHHAGAGE
unique(cchs11.new$DHHAGAGE)
str(cchs11.new$DHHAGAGE)
levels(cchs11.new$DHHAGAGE)

## Removing other age ranges values
na.DHHAGAGE <- which((cchs11.new$DHHAGAGE %in% c("12 TO 14 YEARS", "15 TO 19 YEARS", "65 TO 69 YEARS", "70 TO 74 YEARS", "75 TO 79 YEARS", "80 YEARS OR MORE"))) 
cchs11.new <- cchs11.new[-na.DHHAGAGE,]

## Dropping levels
cchs11.new$DHHAGAGE <- droplevels(cchs11.new$DHHAGAGE)

## Looking at data
unique(cchs11.new$DHHAGAGE)
str(cchs11.new$DHHAGAGE)
levels(cchs11.new$DHHAGAGE)

###############################################
## DHHAGMS
unique(cchs11.new$DHHAGMS)
str(cchs11.new$DHHAGMS)
levels(cchs11.new$DHHAGMS)

## Removing NAs
na.DHHAGMS <- which((cchs11.new$DHHAGMS %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED"))) 
cchs11.new$DHHAGMS[na.DHHAGMS] <- NA

## Dropping levels
cchs11.new$DHHAGMS <- droplevels(cchs11.new$DHHAGMS)

## Looking at variable
unique(cchs11.new$DHHAGMS)
str(cchs11.new$DHHAGMS)
levels(cchs11.new$DHHAGMS)
table(cchs11.new$DHHAGMS, exclude = NULL)

###############################################
## DHHA_SEX
unique(cchs11.new$DHHA_SEX)
str(cchs11.new$DHHA_SEX)
levels(cchs11.new$DHHA_SEX)
table(cchs11.new$DHHA_SEX)

## No Missing Vales

###############################################
## SDCAGRAC
unique(cchs11.new$SDCAGRAC)
str(cchs11.new$SDCAGRAC)
levels(cchs11.new$SDCAGRAC)
table(cchs11.new$SDCAGRAC)

## Removing missing values
na.SDCAGRAC <- which((cchs11.new$SDCAGRAC %in% c("NOT STATED"))) 
cchs11.new$SDCAGRAC[na.SDCAGRAC] <- NA

## Dropping levels
cchs11.new$SDCAGRAC <- droplevels(cchs11.new$SDCAGRAC)

## LOoking at data again
unique(cchs11.new$SDCAGRAC)
str(cchs11.new$SDCAGRAC)
levels(cchs11.new$SDCAGRAC)
table(cchs11.new$SDCAGRAC, exclude = NULL)

###############################################
## SDCAFIMM
unique(cchs11.new$SDCAFIMM)
str(cchs11.new$SDCAFIMM)
levels(cchs11.new$SDCAFIMM)
table(cchs11.new$SDCAFIMM)

## Removing missing values
na.SDCAFIMM <- which((cchs11.new$SDCAFIMM %in% c("NOT STATED"))) 
cchs11.new$SDCAFIMM[na.SDCAFIMM] <- NA

## Dropping levels
cchs11.new$SDCAFIMM <- droplevels(cchs11.new$SDCAFIMM)

## LOoking at data again
unique(cchs11.new$SDCAFIMM)
str(cchs11.new$SDCAFIMM)
levels(cchs11.new$SDCAFIMM)
table(cchs11.new$SDCAFIMM, exclude = NULL)

###############################################
## SDCAGRES
unique(cchs11.new$SDCAGRES)
str(cchs11.new$SDCAGRES)
levels(cchs11.new$SDCAGRES)
table(cchs11.new$SDCAGRES)

## Removing missing values
na.SDCAGRES <- which((cchs11.new$SDCAGRES %in% c("NOT STATED"))) 
cchs11.new$SDCAGRES[na.SDCAGRES] <- NA

## Dropping levels
cchs11.new$SDCAGRES <- droplevels(cchs11.new$SDCAGRES)

## LOoking at data again
unique(cchs11.new$SDCAGRES)
str(cchs11.new$SDCAGRES)
levels(cchs11.new$SDCAGRES)
table(cchs11.new$SDCAGRES, exclude = NULL)

###############################################
## EDUADR04
unique(cchs11.new$EDUADR04)
str(cchs11.new$EDUADR04)
levels(cchs11.new$EDUADR04)
table(cchs11.new$EDUADR04)

## Removing missing values
na.EDUADR04 <- which((cchs11.new$EDUADR04 %in% c("NOT STATED"))) 
cchs11.new$EDUADR04[na.EDUADR04] <- NA

## Dropping levels
cchs11.new$EDUADR04 <- droplevels(cchs11.new$EDUADR04)

## LOoking at data again
unique(cchs11.new$EDUADR04)
str(cchs11.new$EDUADR04)
levels(cchs11.new$EDUADR04)
table(cchs11.new$EDUADR04, exclude = NULL)

###############################################
## INCAGHH
unique(cchs11.new$INCAGHH)
str(cchs11.new$INCAGHH)
levels(cchs11.new$INCAGHH)
table(cchs11.new$INCAGHH)

## Removing missing values
na.INCAGHH <- which((cchs11.new$INCAGHH %in% c("NOT STATED"))) 
cchs11.new$INCAGHH[na.INCAGHH] <- NA

## Dropping levels
cchs11.new$INCAGHH <- droplevels(cchs11.new$INCAGHH)

## LOoking at data again
unique(cchs11.new$INCAGHH)
str(cchs11.new$INCAGHH)
levels(cchs11.new$INCAGHH)
table(cchs11.new$INCAGHH, exclude = NULL)

###############################################
## HWTAGBMI
unique(cchs11.new$HWTAGBMI)
str(cchs11.new$HWTAGBMI)
levels(cchs11.new$HWTAGBMI)
table(cchs11.new$HWTAGBMI)

## Removing missing values
na.HWTAGBMI <- which((cchs11.new$HWTAGBMI %in% c("NOT STATED", "NOT APPLICABLE"))) 
cchs11.new$HWTAGBMI[na.HWTAGBMI] <- NA

## Dropping levels
cchs11.new$HWTAGBMI <- droplevels(cchs11.new$HWTAGBMI)

## LOoking at data again
unique(cchs11.new$HWTAGBMI)
str(cchs11.new$HWTAGBMI)
levels(cchs11.new$HWTAGBMI)
table(cchs11.new$HWTAGBMI, exclude = NULL)

## Turning into numeric
cchs11.new$HWTAGBMI <- as.numeric(as.character(cchs11.new$HWTAGBMI))

## Recoding into variables
cchs11.new$BMI <- NA
cchs11.new$BMI[which(cchs11.new$HWTAGBMI < 18.5)] <- "underweight"
cchs11.new$BMI[which(cchs11.new$HWTAGBMI >= 18.5 & cchs11.new$HWTAGBMI < 25)] <- "healthy"
cchs11.new$BMI[which(cchs11.new$HWTAGBMI >= 25)] <- "overweight"

## Looking at structure
table(cchs11.new$BMI, exclude = NULL)

## Dropping variable
cchs11.new <- cchs11.new %>% 
  select(-HWTAGBMI)

###############################################
## PACADPAI
unique(cchs11.new$PACADPAI)
str(cchs11.new$PACADPAI)
levels(cchs11.new$PACADPAI)
table(cchs11.new$PACADPAI)

## Removing missing values
na.PACADPAI <- which((cchs11.new$PACADPAI %in% c("NOT STATED"))) 
cchs11.new$PACADPAI[na.PACADPAI] <- NA

## Dropping levels
cchs11.new$PACADPAI <- droplevels(cchs11.new$PACADPAI)

## LOoking at data again
unique(cchs11.new$PACADPAI)
str(cchs11.new$PACADPAI)
levels(cchs11.new$PACADPAI)
table(cchs11.new$PACADPAI, exclude = NULL)

###############################################
## TWDA_5
unique(cchs11.new$TWDA_5)
str(cchs11.new$TWDA_5)
levels(cchs11.new$TWDA_5)
table(cchs11.new$TWDA_5)

## Removing missing values
na.TWDA_5 <- which((cchs11.new$TWDA_5 %in% c("NOT STATED", "DON'T KNOW", "REFUSAL"))) 
cchs11.new$TWDA_5[na.TWDA_5] <- NA

## Dropping levels
cchs11.new$TWDA_5 <- droplevels(cchs11.new$TWDA_5)

## LOoking at data again
unique(cchs11.new$TWDA_5)
str(cchs11.new$TWDA_5)
levels(cchs11.new$TWDA_5)
table(cchs11.new$TWDA_5, exclude = NULL)

###############################################
## SMKADSTY
unique(cchs11.new$SMKADSTY)
str(cchs11.new$SMKADSTY)
levels(cchs11.new$SMKADSTY)
table(cchs11.new$SMKADSTY)

## Removing missing values
na.SMKADSTY <- which((cchs11.new$SMKADSTY %in% c("NOT STATED", "DON'T KNOW", "REFUSAL"))) 
cchs11.new$SMKADSTY[na.SMKADSTY] <- NA

## Dropping levels
cchs11.new$SMKADSTY <- droplevels(cchs11.new$SMKADSTY)

## LOoking at data again
unique(cchs11.new$SMKADSTY)
str(cchs11.new$SMKADSTY)
levels(cchs11.new$SMKADSTY)
table(cchs11.new$SMKADSTY, exclude = NULL)


###############################################
## ALCADTYP
unique(cchs11.new$ALCADTYP)
str(cchs11.new$ALCADTYP)
levels(cchs11.new$ALCADTYP)
table(cchs11.new$ALCADTYP)

## Removing missing values
na.ALCADTYP <- which((cchs11.new$ALCADTYP %in% c("NOT STATED", "DON'T KNOW", "REFUSAL"))) 
cchs11.new$ALCADTYP[na.ALCADTYP] <- NA

## Dropping levels
cchs11.new$ALCADTYP <- droplevels(cchs11.new$ALCADTYP)

## LOoking at data again
unique(cchs11.new$ALCADTYP)
str(cchs11.new$ALCADTYP)
levels(cchs11.new$ALCADTYP)
table(cchs11.new$ALCADTYP, exclude = NULL)

###############################################
## CCCA_071
unique(cchs11.new$CCCA_071)
str(cchs11.new$CCCA_071)
levels(cchs11.new$CCCA_071)
table(cchs11.new$CCCA_071)

## Removing missing values
na.CCCA_071 <- which((cchs11.new$CCCA_071 %in% c("NOT STATED", "DON'T KNOW", "REFUSAL"))) 
cchs11.new$CCCA_071[na.CCCA_071] <- NA

## Dropping levels
cchs11.new$CCCA_071 <- droplevels(cchs11.new$CCCA_071)

## LOoking at data again
unique(cchs11.new$CCCA_071)
str(cchs11.new$CCCA_071)
levels(cchs11.new$CCCA_071)
table(cchs11.new$CCCA_071, exclude = NULL)


###############################################
## CCCA_101
unique(cchs11.new$CCCA_101)
str(cchs11.new$CCCA_101)
levels(cchs11.new$CCCA_101)
table(cchs11.new$CCCA_101)

## Removing missing values
na.CCCA_101 <- which((cchs11.new$CCCA_101 %in% c("NOT STATED", "DON'T KNOW", "REFUSAL"))) 
cchs11.new$CCCA_101[na.CCCA_101] <- NA

## Dropping levels
cchs11.new$CCCA_101 <- droplevels(cchs11.new$CCCA_101)

## LOoking at data again
unique(cchs11.new$CCCA_101)
str(cchs11.new$CCCA_101)
levels(cchs11.new$CCCA_101)
table(cchs11.new$CCCA_101, exclude = NULL)

###############################################
## CCCA_91B
unique(cchs11.new$CCCA_91B)
str(cchs11.new$CCCA_91B)
levels(cchs11.new$CCCA_91B)
table(cchs11.new$CCCA_91B)

## Removing missing values
na.CCCA_91B <- which((cchs11.new$CCCA_91B %in% c("NOT STATED", "DON'T KNOW", "REFUSAL"))) 
cchs11.new$CCCA_91B[na.CCCA_91B] <- NA

## Dropping levels
cchs11.new$CCCA_91B <- droplevels(cchs11.new$CCCA_91B)

## LOoking at data again
unique(cchs11.new$CCCA_91B)
str(cchs11.new$CCCA_91B)
levels(cchs11.new$CCCA_91B)
table(cchs11.new$CCCA_91B, exclude = NULL)

###############################################
## FVCADTOT
unique(cchs11.new$FVCADTOT)
str(cchs11.new$FVCADTOT)
levels(cchs11.new$FVCADTOT)
table(cchs11.new$FVCADTOT)

## Removing missing values
na.FVCADTOT <- which((cchs11.new$FVCADTOT %in% c("NOT STATED", "NOT APPLICABLE"))) 
cchs11.new$FVCADTOT[na.FVCADTOT] <- NA

## Dropping levels
cchs11.new$FVCADTOT <- droplevels(cchs11.new$FVCADTOT)

## LOoking at data again
unique(cchs11.new$FVCADTOT)
str(cchs11.new$FVCADTOT)
levels(cchs11.new$FVCADTOT)
table(cchs11.new$FVCADTOT, exclude = NULL)

## Turning into numeric
cchs11.new$FVCADTOT <- as.numeric(as.character(cchs11.new$FVCADTOT))

## Recoding into variables
cchs11.new$veggies <- NA
cchs11.new$veggies[which(cchs11.new$FVCADTOT <= 3)] <- "low"
cchs11.new$veggies[which(cchs11.new$FVCADTOT > 3 & cchs11.new$FVCADTOT <= 6)] <- "medium"
cchs11.new$veggies[which(cchs11.new$FVCADTOT > 6)] <- "high"

## Looking at structure
table(cchs11.new$veggies, exclude = NULL)

## Dropping variable
cchs11.new <- cchs11.new %>% 
  select(-FVCADTOT)

###############################################
## GENA_07
unique(cchs11.new$GENA_07)
str(cchs11.new$GENA_07)
levels(cchs11.new$GENA_07)
table(cchs11.new$GENA_07)

## Removing missing values
na.GENA_07 <- which((cchs11.new$GENA_07 %in% c("NOT STATED", "DON'T KNOW", "REFUSAL"))) 
cchs11.new$GENA_07[na.GENA_07] <- NA

## Dropping levels
cchs11.new$GENA_07 <- droplevels(cchs11.new$GENA_07)

## LOoking at data again
unique(cchs11.new$GENA_07)
str(cchs11.new$GENA_07)
levels(cchs11.new$GENA_07)
table(cchs11.new$GENA_07, exclude = NULL)

###############################################
## GEOAGPRV
unique(cchs11.new$GEOAGPRV)
str(cchs11.new$GEOAGPRV)
levels(cchs11.new$GEOAGPRV)
table(cchs11.new$GEOAGPRV)

## Removing missing values

## Dropping levels
cchs11.new$GEOAGPRV <- droplevels(cchs11.new$GEOAGPRV)

## LOoking at data again
unique(cchs11.new$GEOAGPRV)
str(cchs11.new$GEOAGPRV)
levels(cchs11.new$GEOAGPRV)
table(cchs11.new$GEOAGPRV)

## Recoding
cchs11.new$Province <- ifelse(cchs11.new$GEOAGPRV %in% c("YUKON/NWT/NUNAVT"), "North", "South")

## Looking at data
table(cchs11.new$Province)

## Dropping geo
cchs11.new <- cchs11.new %>% 
  select(-GEOAGPRV)

###############################################
## WTSAM
unique(cchs11.new$WTSAM)
str(cchs11.new$WTSAM)
levels(cchs11.new$WTSAM)
table(cchs11.new$WTSAM, exclude = NULL)

## Dividing by 3?
cchs11.new$WTSAM <- cchs11.new$WTSAM/3

################################################
### Looking at data set ###
###########################

## structure
str(cchs11.new)

## Changing some variables to factors
cchs11.new$BMI <- factor(cchs11.new$BMI, levels = c("healthy", "overweight", "underweight"), 
                         labels = c("healthy", "overweight", "underweight"))

cchs11.new$veggies <- factor(cchs11.new$veggies, levels = c("low", "medium", "high"), 
                             labels = c("0-3servings", "3-6servings", "6+servings"))

cchs11.new$Province <- factor(cchs11.new$Province, levels = c("South", "North"),
                              labels = c("South", "North"))


cchs11_full <- cchs11.new
write.csv(cchs11_full, file = "cchs11_full", row.names = F)

## Example
data(africa)
a.out <- amelia(africa, ts = "year", cs = "country", m = 1, boot.type = "none")


a.out$imputations$imp1

## Subsetting data
cchs11_subset <- cchs11_full[sample(1:88961, 500),]
str(cchs11_subset)

## Subsetting variables
cchs11_subset2 <- cchs11_subset[, c(2, 3, 12, 20, 23)]
str(cchs11_subset2)

## Running amelia algorithm on this subset
cchs11.imputed <- amelia(cchs11_subset2, cs = 1, m = 1, boot.type = "none")

##