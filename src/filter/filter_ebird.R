#!/usr/bin/env Rscript

library("dplyr")
library("auk")

# filters

test_filter <- auk_ebd("ebd_TR_sample.txt") %>%
    auk_date(c("2020-01-01", "2020-12-31"))

print(test_filter)

res <- test_filter %>%
    auk_filter(tempfile()) %>%
    read_ebd()

print(res)
