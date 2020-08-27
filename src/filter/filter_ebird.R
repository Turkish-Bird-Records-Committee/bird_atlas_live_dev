#!/usr/bin/env Rscript

library("dplyr")
library("auk")

# filters

test_filter <- auk_ebd("ebd_TR_sample.txt") %>%
    auk_breeding() %>%
    auk_date(c("2020-01-01", "2020-12-31"))

# print(test_filter)

test_filter %>%
    auk_filter("test_output_R.tsv", overwrite = TRUE)
