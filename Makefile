OUT_DIR    =	output
IN_DIR     =	markdown
STYLES_DIR =	styles

STYLE 	   =	style

FILTERS = pandoc-citeproc
PANDOC  = pandoc $(patsubst %,--filter %, $(FILTERS))

SASS    = python bin/sass.py


all: html pdf docx rtf

html: dir sass
	for f in $(IN_DIR)/*.md; do \
	FILE_NAME=`basename $$f | sed 's/.md//g'`; \
	echo $$FILE_NAME.html; \
	$(PANDOC) --standalone \
		--include-in-header $(STYLES_DIR)/$(STYLE).css \
		--from markdown --to html5 \
		--output $(OUT_DIR)/$$FILE_NAME.html $$f \
		--metadata pagetitle=$$FILE_NAME;\
	done

pdf: dir sass
	for f in $(IN_DIR)/*.md; do \
		FILE_NAME=`basename $$f | sed 's/.md//g'`; \
		echo $$FILE_NAME.pdf; \
		$(PANDOC) --standalone \
			--include-in-header $(STYLES_DIR)/$(STYLE).css \
			--from markdown --to html5 \
			--output $(OUT_DIR)/$$FILE_NAME.pdf $$f \
			--metadata pagetitle=$$FILE_NAME;\
	done

docx: dir version
	for f in $(IN_DIR)/*.md; do \
		FILE_NAME=`basename $$f | sed 's/.md//g'`; \
		echo $$FILE_NAME.docx; \
		$(PANDOC) --standalone $$SMART $$f \
			--output $(OUT_DIR)/$$FILE_NAME.docx; \
	done

rtf: dir version
	for f in $(IN_DIR)/*.md; do \
		FILE_NAME=`basename $$f | sed 's/.md//g'`; \
		echo $$FILE_NAME.rtf; \
		$(PANDOC) --standalone $$SMART $$f \
			--output $(OUT_DIR)/$$FILE_NAME.rtf; \
	done


sass:
	$(SASS) $(STYLES_DIR)/$(STYLE).scss $(STYLES_DIR)/$(STYLE).css


dir:
	mkdir -p $(OUT_DIR)

version:
	PANDOC_VERSION=`pandoc --version | head -1 | cut -d' ' -f2 | cut -d'.' -f1`; \
	if [ "$$PANDOC_VERSION" -eq "2" ]; then \
		SMART=-smart; \
	else \
		SMART=--smart; \
	fi \

clean:
	rm -f $(OUT_DIR)/*
