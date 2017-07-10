FROM resin/rpi-raspbian

RUN apt-get update && \
    apt-get install -y python-pip && \
    apt-get install postgresql && \
    apt-get install python-psycopg2 && \
    apt-get install libpq-dev && \
    apt-get install pkg-config && \
    apt-get install libboost-python-dev && \
    apt-get install libboost-thread-dev && \
    apt-get install libbluetooth-dev && \
    apt-get install libglib2.0-dev && \
    apt-get install python-dev && \
    apt-get install build-essential && \
    pip install paho-mqtt && \
    pip install gattlib

RUN mkdir /ble_ingestor
COPY . /ble_ingestor
CMD ["tail", " -f", "/var/log/dmesg"]
# CMD ["python", "-u", "/ble_ingestor/miflora.py"]
