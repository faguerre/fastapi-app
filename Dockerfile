FROM python:3.9

RUN apt-get update && \
    apt-get install -y build-essential 
RUN apt-get install ffmpeg libsm6 libxext6  -y

COPY . /app

RUN pip install --upgrade pip && \
    pip install uwsgi

RUN pip install -r app/requirements.txt

CMD ["uvicorn", "app.main:app", "--workers", "1", "--host", "0.0.0.0", "--port", "5000"]
