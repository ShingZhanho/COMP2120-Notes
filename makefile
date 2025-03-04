COMMAND=latexmk
FLAGS=--shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -pdf
ROOT=COMP2120-Notes

$(ROOT).pdf: $(ROOT).tex
	$(COMMAND) $(FLAGS) $(ROOT).tex

.PHONY: $(ROOT).pdf