FROM python:3.8-alpine

RUN apk add --no-cache mariadb-dev build-base pkgconf

COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install --trusted-host pypi.python.org -r requirements.txt

COPY . /app

ENV MYSQL_USER Ian
ENV MYSQL_PASSWORD secret
ENV MYSQL_DB student
ENV MYSQL_HOST 35.234.132.116
ENV MYSQL_PORT 3306
ENV MYSQLCLIENT_CFLAGS "-I/usr/include/mariadb"
ENV MYSQLCLIENT_LDFLAGS "-L/usr/lib/"

EXPOSE 8080

ENTRYPOINT ["gunicorn", "--workers=3", "--bind=0.0.0.0:8080", "app:app"]