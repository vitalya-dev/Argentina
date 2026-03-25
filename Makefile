# Имя основного файла (без расширения)
SRC = Argentina
OUT = $(SRC).odt

# Шаблон
TEMPLATE = Template.odt

# Pandoc и фильтры
PANDOC = pandoc
FILTERS = --filter pandoc-crossref

# Основная команда
all: $(OUT)

$(OUT): $(SRC).md
	$(PANDOC) $< -o $@ \
	$(FILTERS) \
	--reference-doc=$(TEMPLATE) \
	--toc \
	--table-caption-position=below

# Очистка
clean:
	rm -f $(OUT)

# Пересборка
rebuild: clean all