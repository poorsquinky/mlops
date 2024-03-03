FROM ubuntu:23.10

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        python3-pip \
    && pip3 install --break-system-packages \
        feast \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /repo

CMD feast serve -p 8086 -h 0.0.0.0

