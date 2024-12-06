DEV_FLASK_ENV=development
DEV_DATABASE_URI=postgresql://myuser:mypassword@127.0.0.1:5432/mydatabase

TEST_FLASK_ENV=testing
TEST_DATABASE_URI=sqlite:///:memory:


install:
	python3 -m venv env
	. env/bin/activate && \
	pip install -U pip && \
	pip install -r requirements.txt

install_db:
	export FLASK_ENV=$(DEV_FLASK_ENV) && \
	export DATABASE_URI=$(DEV_DATABASE_URI) && \
	. env/bin/activate && \
	python manage.py

install_testing:
	. env/bin/activate && \
	pip install -r requirements_testing.txt

run_dev:
	export FLASK_ENV=$(DEV_FLASK_ENV) && \
	export DATABASE_URI=$(DEV_DATABASE_URI) && \
	. env/bin/activate && \
	python run.py

run_tests:
	export FLASK_ENV=$(TEST_FLASK_ENV) && \
	export DATABASE_URI=$(TEST_DATABASE_URI) && \
	. env/bin/activate && \
	pytest --cov=app --cov-report=term-missing --cov-fail-under=80
