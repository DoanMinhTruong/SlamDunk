FROM apache/superset:1.3.0

USER root

RUN apt-get update && apt-get install -y gnupg2 \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 \
 && apt-get update

RUN echo "deb http://archive.ubuntu.com/ubuntu bionic main universe" >> /etc/apt/sources.list \
 && echo "deb http://archive.ubuntu.com/ubuntu bionic-updates main universe" >> /etc/apt/sources.list \
 && echo "deb http://archive.ubuntu.com/ubuntu bionic-security main universe" >> /etc/apt/sources.list


RUN apt-get update \
 && apt-get install -y mysql-client
RUN apt-get update \
 && apt-get install -y mariadb-client

RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    mysql-client \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

RUN pip3 install \
    mysql-connector-python \
    pymysql \
    pyodbc \
    cx_Oracle \
    psycopg2-binary \
    superset
RUN pip3 install contextlib2
RUN pip3 install pathlib2
RUN pip3 install retry


USER superset

RUN superset db upgrade

EXPOSE 8088

CMD ["gunicorn", "--bind", "0.0.0.0:8088", "superset:app"]