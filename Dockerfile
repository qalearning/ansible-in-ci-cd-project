FROM python:3.10

COPY ./requirements.txt .

RUN pip install -r requirements.txt

COPY app.py .

ENTRYPOINT ["python", "app.py"]
