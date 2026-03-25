# Имя основного файла (без расширения)
SRC = Argentina
PRESENT = presentation

# Выходные файлы
ODT = $(SRC).odt
PPT = $(PRESENT).pptx
PDF = $(SRC).pdf

# Шаблоны
TEMPLATE_ODT = Template.odt
TEMPLATE_PPT = Template.pptx

# Pandoc и фильтры
PANDOC = pandoc
FILTERS = --filter pandoc-crossref

# =========================
# Основные цели
# =========================

all: odt ppt

odt: $(ODT)
ppt: $(PPT)
pdf: $(PDF)

# =========================
# Сборка ODT
# =========================

$(ODT): $(SRC).md
	$(PANDOC) $< -o $@ \
	$(FILTERS) \
	--reference-doc=$(TEMPLATE_ODT) \
	--toc \
	--table-caption-position=below

# =========================
# Сборка презентации PPTX
# =========================

$(PPT): $(PRESENT).md
	$(PANDOC) $< -o $@ 

# =========================
# Сборка PDF (опционально)
# =========================

$(PDF): $(SRC).md
	$(PANDOC) $< -o $@

# =========================
# Очистка
# =========================

clean:
	rm -f $(ODT) $(PPT) $(PDF)

# Пересборка
rebuild: clean all