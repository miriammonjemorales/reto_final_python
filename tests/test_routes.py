def test_data_post_success(client):
    data = {"name": "data_01"}
    response = client.post("/data", json=data)

    assert response.status_code == 200
    assert response.json["message"] == "Data inserted successfully"


def test_data_post_already_exists(client):
    data = {"name": "data_01"}
    response = client.post("/data", json=data)
    response = client.post("/data", json=data)

    assert response.status_code == 409
    assert response.json["message"] == "Data already exists"


def test_data_get_success(client):
    data_list = [
        {"name": "data_01"},
        {"name": "data_02"}
    ]

    for data in data_list:
        client.post("/data", json=data)

    response = client.get("/data")

    assert response.status_code == 200
    assert response.json[0]["name"] == "data_01"
    assert response.json[1]["name"] == "data_02"


def test_data_delete_success(client):
    data = {"name": "data_01"}
    client.post("/data", json=data)

    response = client.delete("/data/1")

    assert response.status_code == 200
    assert response.json["message"] == "Data deleted successfully"


def test_data_delete_not_found(client):
    response = client.delete("/data/1")

    assert response.status_code == 404
    assert response.json["message"] == "Data not found"
