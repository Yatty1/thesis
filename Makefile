BUILD_DIR = ./build
SRC_DIR = ./src

MAIN_TEX = $(SRC_DIR)/thesis.tex
MAIN_PDF = $(MAIN_TEX:$(SRC_DIR)/%.tex=$(BUILD_DIR)/%.pdf)

.PHONY: build
build: $(MAIN_PDF)

.PHONY: $(MAIN_PDF)
$(MAIN_PDF): $(BUILD_DIR)/$(SRC_DIR)
	latexmk -pdfdvi $(PREVIEW_CONTINUOUSLY) -use-make $(MAIN_TEX)

# build/src ディレクトリがないとビルドに失敗する
$(BUILD_DIR)/$(SRC_DIR):
	mkdir -p $@

.PHONY: watch
watch: PREVIEW_CONTINUOUSLY=-pvc
watch: build

.PHONY: clean
clean:
	@$(RM) -rf $(BUILD_DIR)/*
