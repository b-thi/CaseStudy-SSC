# Initial Work

#Cycle 1
cchs11.new <- cchs11[, c("ADMA_RNO", "CCCA_121", "CCCA_051", "CCCA_05A", "DHHAGAGE", "DHHA_SEX", 
                      "DHHAGMS", "SDCAGRAC", "SDCAFIMM", "SDCAGRES", "EDUADR04", "INCAGHH", 
                      "HWTAGBMI", "PACADPAI", "TWDA_5", "SMKADSTY", "ALCADTYP", "CCCA_071", 
                      "CCCA_101", "CCCA_91B", "FVCADTOT", "GENA_07", "GEOAGPRV", "WTSAM")]

#Cycle 2
cchs21.new <- cchs21[, c("ADMC_RNO", "CCCC_121", "CCCC_051", "CCCC_05A", "DHHCGAGE", "DHHC_SEX", 
                         "DHHCGMS", "SDCCGRAC", "SDCCFIMM", "SDCCGRES", "EDUCDR04", "INCCGHH", 
                         "HWTCGBMI", "PACCDPAI", "HCUC_1AA", "SMKCDSTY", "ALCCDTYP", "CCCC_071", 
                         "CCCC_101", "CCCC_91B", "FVCCDTOT", "GENC_07", "GEOCGPRV", "WTSC_M")]

#Cycle 3
cchs31.new <- cchs31[, c("ADME_RNO", "CCCE_121", "CCCE_051", "CCCE_05A", "DHHEGAGE", "DHHE_SEX", 
                         "DHHEGMS", "SDCEGCGT", "SDCEFIMM", "SDCEGRES", "EDUEDR04", "INCEGHH", 
                         "HWTEGBMI", "PACEDPAI", "HCUE_1AA", "SMKEDSTY", "ALCEDTYP", "CCCE_071", 
                         "CCCE_101", "CCCE_91F", "FVCEDTOT", "GENE_07", "GEOEGPRV", "WTSE_M")]
