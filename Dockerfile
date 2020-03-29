#FROM arm32v7/debian:bullseye-slim


#FROM python:3.8-buster

#RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tshark libxml2 libxml2-dev libxslt1.1 libxslt1-dev build-essential \
#    && rm -rf /var/lib/apt/lists/* \
#    && apt-get -y autoremove

FROM python:3.8-alpine

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN apk add --update --no-cache --virtual .build-deps \
        g++ \
        python-dev \
        libxml2 \
        libxml2-dev && \
    apk add libxslt-dev aircrack-ng tshark bash && \
    pip install --no-cache-dir -r requirements.txt && \
    apk del .build-deps

#RUN apk add --update --no-cache py3-lxml aircrack-ng bash

COPY . .

CMD ./start.sh



