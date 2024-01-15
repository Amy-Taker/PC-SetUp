%:
	pandoc ${@:=.md} -o ${@:=.pdf} --pdf-engine=lualatex -V documentclass=ltjsarticle