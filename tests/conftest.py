import pytest
from app import create_app, db


@pytest.fixture
def app():
    """Creates a Flask app instance configured for testing."""
    app = create_app('testing')
    with app.app_context():
        db.create_all()
        yield app
        db.session.remove()
        db.drop_all()


@pytest.fixture
def client(app):
    """Provides a test client for sending requests."""
    return app.test_client()
