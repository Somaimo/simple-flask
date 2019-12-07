FROM python:3.8.0-slim

ADD simple-flask/requirements.txt /app/requirements.txt

RUN set -ex \
    && pip install --upgrade pip \
    && pip install -r app/requirements.txt

ADD simple-flask/. /app
WORKDIR /app

EXPOSE 80
CMD ["gunicorn", "-b", "0.0.0.0:80", "--workers", "2" , "--worker-tmp-dir", "/dev/shm", "--access-logfile", "-", "--error-logfile", "-", "app"]