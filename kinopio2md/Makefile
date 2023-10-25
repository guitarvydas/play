all:
	python3 cull.py
	make pl

pl:
	swipl -g 'consult(k2m).' -g 'main.' -g 'halt.'
