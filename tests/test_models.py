from app import db
from app.models import Data


def test_user_creation(app):
    with app.app_context():
        data = Data(name="testdata")
        db.session.add(data)
        db.session.commit()

        fetched_data = Data.query.filter_by(name="testdata").first()
        assert fetched_data is not None
        assert fetched_data.name == "testdata"
        assert str(fetched_data) == "<Data id=1 name=testdata>"
