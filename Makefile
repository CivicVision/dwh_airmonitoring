GENERATED_FILES = airquality.csv
.PHONY: all

all: $(GENERATED_FILES)

.INTERMEDIATE: airquality.zip
airquality.zip:
	curl -o $@ "https://edg.epa.gov/data/PUBLIC/OSWER/OEM/DEEPWATERHORIZON/MONITORING/DWH_Air_Monitoring.zip"

.INTERMEDIATE: DWH_Air_Monitoring.xlsx
DWH_Air_Monitoring.xlsx: airquality.zip
	unzip $<

airquality.csv: DWH_Air_Monitoring.xlsx
	in2csv $< | tail -n +2 > $@
