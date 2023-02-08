FROM ubuntu:22.04

## Install python and flask
USER root
RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
    && pip3 install flask \
    && pip3 install flask-api \
    && pip3 install boto3

## Create app directory
RUN sudo mkdir -p var/www/flask
COPY apptest.py /var/www/flask/apptest.py
WORKDIR /var/www/flask 

## Run the service
EXPOSE 8000
CMD ["python3", "apptest.py"]
