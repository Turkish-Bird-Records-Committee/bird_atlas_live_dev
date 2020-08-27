from ebird_filter import ebird

ebird.use_filter("breeding")
ebird.use_filter("date", "2020-01-01", "2020-12-31")
#ebird.use_filter("species", ["Vanellus spinosus", "Periparus ater", "Tachybaptus ruficollis", "Sturnus vulgaris"])
ebird.process("../../data/ebd-test/ebd_TR_sample.txt")
