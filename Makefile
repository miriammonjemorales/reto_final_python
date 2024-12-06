DEV_FLASK_ENV=development
DEV_DATABASE_URI=postgresql://myuser:mypassword@127.0.0.1:5432/mydatabase



install:
	python3 -m venv env
	. env/bin/activate && \
	pip install -U pip && \
	pip install -r requirements.txt

install_testing:
	. env/bin/activate && \
	pip install -r requirements_testing.txt

install_db:
	export FLASK_ENV=$(DEV_FLASK_ENV) && \
	export DATABASE_URI=$(DEV_DATABASE_URI) && \
	. env/bin/activate && \
	python manage.py
