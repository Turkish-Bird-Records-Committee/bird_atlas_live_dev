#!/usr/bin/env Rscript

library("tidyverse")
library("lubridate")

args <- commandArgs(trailingOnly = TRUE)

breeding_codes <- tibble(
    code = c("H", "S", "S7", "M", "P", "T", "C", "N", "A", "B", "PE", "CN",
             "NB", "DD", "UN", "ON", "FL", "CF", "FY", "FS", "NE", "NY"),
    prob = c(1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3),
    rank = 1:22
)

dat <- read_csv(args[1]) %>%
    mutate(YEAR = year(`OBSERVATION DATE`)) %>%
    left_join(breeding_codes, by=c("BREEDING BIRD ATLAS CODE" = "code")) %>%
    group_by(YEAR, `CUSTOM ATLAS BLOCKS`) %>%
    summarize(max(rank))
