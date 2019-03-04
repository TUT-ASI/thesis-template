MASTER_FILE = thesis
BUILD_DIR   = build

.PHONY: all clean view clean autobuild

all:
	mkdir -p -- $(BUILD_DIR)
	latexmk -pdf -halt-on-error -jobname=$(BUILD_DIR)/$(MASTER_FILE) $(MASTER_FILE)

view:
	xdg-open $(BUILD_DIR)/$(MASTER_FILE).pdf

clean:
	rm -f  -- $(BUILD_DIR)/*
	rm -fd -- $(BUILD_DIR)

autobuild:
	mkdir -p -- $(BUILD_DIR)
	latexmk -pvc -pdf -halt-on-error -jobname=$(BUILD_DIR)/$(MASTER_FILE) $(MASTER_FILE)
