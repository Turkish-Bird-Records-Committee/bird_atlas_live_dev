#!/usr/bin/env Rscript

library("tidyverse")
library("rgdal")

args <- commandArgs(trailingOnly = TRUE)

dat <- read_tsv(args[1]) %>%
    rename("CUSTOM ATLAS BLOCKS" = X47)

atlas_grid <- readOGR("../../data/atlas/grid50x50.shp", layer = "grid50x50")

points <- dat[, c("LONGITUDE", "LATITUDE")]
coordinates(points) <- ~ LONGITUDE + LATITUDE
proj4string(points) <- CRS(proj4string(atlas_grid))
dat["CUSTOM ATLAS BLOCKS"] <- over(points, atlas_grid)[,1]

head(dat)
