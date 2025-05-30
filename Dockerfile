FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY . /app

COPY nlp_key.json /app/nlp_key.json

ENV GOOGLE_APPLICATION_CREDENTIALS=/app/nlp_key.json

RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

RUN pip install -r requirements.txt


EXPOSE 8080

CMD ["python", "app.py"]
