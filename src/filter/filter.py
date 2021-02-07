#!/usr/bin/env python3
import sys
from ebird_filter import ebird

ebird.use_filter("breeding")
ebird.use_filter("date", "2019-01-01", "2020-12-31")
ebird.process(sys.argv[1])
