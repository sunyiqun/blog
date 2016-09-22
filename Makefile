NONE =
TAB = $(NONE)    $(NONE)

all: help

help:
	$(info Usage:)
	$(info $(TAB)update)
	$(info $(TAB)$(TAB)update-github-page)

update-github-page:
	@gem update github-pages

start:
	bundle exec jekyll serve --drafts --host 0.0.0.0
