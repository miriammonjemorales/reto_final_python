FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY run.py .
COPY app ./app

CMD [ "python", "run.py" ]
