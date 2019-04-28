# Initial Work

#CYCLE 1
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


#CYCLE 2
cchs21.new <- cchs21[, c("ADMC_RNO", "CCCC_121", "CCCC_051", "CCCC_05A", "DHHCGAGE", "DHHC_SEX", 
                         "DHHCGMS", "SDCCGRAC", "SDCCFIMM", "SDCCGRES", "EDUCDR04", "INCCGHH", 
                         "HWTCGBMI", "PACCDPAI", "HCUC_1AA", "SMKCDSTY", "ALCCDTYP", "CCCC_071", 
                         "CCCC_101", "CCCC_91B", "FVCCDTOT", "GENC_07", "GEOCGPRV", "WTSC_M")]

#Find Missing or Invalid Values

#Has heart disease
na.CCCC_121 <- which(!(cchs21.new$CCCC_121 %in% c("YES", "NO"))) 

#Has arthritis or rheumatism
na.CCCC_051 <- which(!(cchs21.new$CCCC_051 %in% c("YES", "NO"))) 

#Kind of arthritis
na.CCCC_05A <- which((cchs21.new$CCCC_05A %in% c("OTHER", "RHEUMATOID ARTH"))) 

#Age - restrict analysis to ages 20-64, as instructed
na.DHHCGAGE <- which((cchs21.new$DHHCGAGE %in% c("12 TO 14 YEARS", "15 TO 19 YEARS", "65 TO 69 YEARS", "70 TO 74 YEARS", "75 TO 79 YEARS", "80 YEARS OR MORE"))) 

#Marital status
na.DHHCGMS <- which((cchs21.new$DHHCGMS %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED"))) 

#Cultural / racial origin
na.SDCCGRAC <- which((cchs21.new$SDCCGRAC %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Immigrant status
na.SDCCFIMM <- which(!(cchs21.new$SDCCFIMM %in% c("YES", "NO"))) 

#Of those who answered "YES" above, which didn't specify their time in Canada since immigrating
na.SDCCGRES <- which((cchs21.new$SDCCFIMM %in% "YES") & (cchs11.new$SDCCGRES %in% "NOT STATED")) 

#Highest level of education
na.EDUCDR04 <- which((cchs21.new$EDUCDR04 %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Total household income
na.INCCGHH <- which((cchs21.new$INCCGHH %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#BMI
na.HWTCGBMI <- which((cchs21.new$HWTCGBMI %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Physical activity index
na.PACCDPAI <- which((cchs21.new$PACCDPAI %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Has a regular medical doctor 
na.HCUC_1AA <- which((cchs21.new$HCUC_1AA %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Type of smoker
na.SMKCDSTY <- which((cchs21.new$SMKCDSTY %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Type of drinker
na.ALCCDTYP <- which((cchs21.new$ALCCDTYP %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Has high blood pressure
na.CCCC_071 <- which((cchs21.new$CCCC_071 %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Has diabetes
na.CCCC_101 <- which((cchs21.new$CCCC_101 %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Has emphysema or chronic obstructive pulmonary disease (COPD)
na.CCCC_91B <- which((cchs21.new$CCCC_91B %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Daily consumption - total fruits and vegetables
na.FVCCDTOT <- which((cchs21.new$FVCCDTOT %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Self-perceived stress
na.GENC_07 <- which((cchs21.new$GENC_07 %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Province
na.GEOCGPRV <- which((cchs21.new$GEOCGPRV %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))


#CYCLE 3
cchs31.new <- cchs31[, c("ADME_RNO", "CCCE_121", "CCCE_051", "CCCE_05A", "DHHEGAGE", "DHHE_SEX", 
                         "DHHEGMS", "SDCEGCGT", "SDCEFIMM", "SDCEGRES", "EDUEDR04", "INCEGHH", 
                         "HWTEGBMI", "PACEDPAI", "HCUE_1AA", "SMKEDSTY", "ALCEDTYP", "CCCE_071", 
                         "CCCE_101", "CCCE_91F", "FVCEDTOT", "GENE_07", "GEOEGPRV", "WTSE_M")]

#Find Missing or Invalid Values

#Has heart disease
na.CCCE_121 <- which(!(cchs31.new$CCCE_121 %in% c("YES", "NO"))) 

#Has arthritis or rheumatism
na.CCCE_051 <- which(!(cchs31.new$CCCE_051 %in% c("YES", "NO"))) 

#Kind of arthritis
na.CCCE_05A <- which((cchs31.new$CCCE_05A %in% c("OTHER", "RHEUMATOID ARTH"))) 

#Age - restrict analysis to ages 20-64, as instructed
na.DHHEGAGE <- which((cchs31.new$DHHEGAGE %in% c("12 TO 14 YEARS", "15 TO 19 YEARS", "65 TO 69 YEARS", "70 TO 74 YEARS", "75 TO 79 YEARS", "80 YEARS OR MORE"))) 

#Marital status
na.DHHEGMS <- which((cchs31.new$DHHEGMS %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED"))) 

#Cultural / racial origin
na.SDCEGCGT <- which((cchs31.new$SDCEGCGT %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Immigrant status
na.SDCEFIMM <- which(!(cchs31.new$SDCEFIMM %in% c("YES", "NO"))) 

#Of those who answered "YES" above, which didn't specify their time in Canada since immigrating
na.SDCEGRES <- which((cchs31.new$SDCEFIMM %in% "YES") & (cchs11.new$SDCEGRES %in% "NOT STATED")) 

#Highest level of education
na.EDUEDR04 <- which((cchs31.new$EDUEDR04 %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Total household income
na.INCEGHH <- which((cchs31.new$INCEGHH %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#BMI
na.HWTEGBMI <- which((cchs31.new$HWTEGBMI %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Physical activity index
na.PACEDPAI <- which((cchs31.new$PACEDPAI %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Has a regular medical doctor 
na.HCUE_1AA <- which((cchs31.new$HCUE_1AA %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Type of smoker
na.SMKEDSTY <- which((cchs31.new$SMKEDSTY %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Type of drinker
na.ALCCDTYP <- which((cchs31.new$ALCCDTYP %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Has high blood pressure
na.CCCE_071 <- which((cchs31.new$CCCE_071 %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Has diabetes
na.CCCE_101 <- which((cchs31.new$CCCE_101 %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Has emphysema or chronic obstructive pulmonary disease (COPD)
na.CCCE_91F <- which((cchs31.new$CCCE_91F %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Daily consumption - total fruits and vegetables
na.FVCEDTOT <- which((cchs31.new$FVCEDTOT %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Self-perceived stress
na.GENE_07 <- which((cchs31.new$GENE_07 %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))

#Province
na.GEOEGPRV <- which((cchs31.new$GEOEGPRV %in% c("NOT APPLICABLE", "DON'T KNOW", "REFUSAL", "NOT STATED")))
