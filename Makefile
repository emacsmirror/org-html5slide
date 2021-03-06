EMACS ?= emacs
BATCH := $(EMACS) $(EFLAGS) -batch -q -no-site-file -L .

#all: ox-html5slide.elc

README.md: make-readme-markdown.el
	emacs --script $< <ox-html5slide.el>$@ 2>/dev/null
make-readme-markdown.el:
	wget -q -O $@ https://raw.github.com/mgalgs/make-readme-markdown/master/make-readme-markdown.el
.INTERMEDIATE: make-readme-markdown.el

clean:
	$(RM) *.elc

#%.elc: %.el
#	$(BATCH) --eval '(byte-compile-file "$<")'


.PHONY: check clean README.md
