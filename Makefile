help:
	@echo "Available commands:\n"
	@echo "'make | make help'"
	@echo "'make reindex folder=[folder] pattern=[find pattern] silent=[true/false]"
	@exit 0

reindex:
	sh ./reindex.sh $(folder) $(pattern) $(silent)

setup:
	npm install
	npm install