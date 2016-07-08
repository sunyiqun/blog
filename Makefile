NONE =
TAB = $(NONE)    $(NONE)

all: help

help:
	$(info Usage:)
	$(info $(TAB)update)
	$(info $(TAB)$(TAB)update-github-page)

update-github-page:
	@gem update github-pages
