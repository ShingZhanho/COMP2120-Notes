TEX_FILES := $(shell find . -name '*.tex')
TEX_ROOT = COMP2120-Notes
TEX_ENGINE := latexmk
TEX_ARGS = --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=.

TEX_CLEAN_EXT = *.aux *.lof *.log *.lot *.fls *.out *.toc *.fmt *.fot *.cb *.cb2 *.pdf *.fdb_latexmk *.synctex *.synctex\(busy\) *.synctex.gz *.synctex.gz\(busy\) *.pdfsync *.rubbercache *.pyg *.minted

$(TEX_ROOT).pdf: $(TEX_FILES)
	$(TEX_ENGINE) $(TEX_ARGS) $(TEX_ROOT).tex

clean:
	rm $(TEX_CLEAN_EXT)
	rm -rf _minted

.PHONY: $(TEX_ROOT).pdf clean
