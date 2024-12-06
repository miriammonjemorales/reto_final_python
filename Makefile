


install:
	python3 -m venv env
	. env/bin/activate && \
	pip install -U pip && \
	pip install -r requirements.txt

install_testing:
	. env/bin/activate && \
	pip install -r requirements_testing.txt
