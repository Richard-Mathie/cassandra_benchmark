FROM python:2.7

MAINTAINER Richard Mathie "Richard.Mathie@amey.co.uk"

RUN apt-get update \
	&& apt-get install -y python-dev build-essential apt-utils libev4 libev-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install lz4
RUN pip install scales
RUN pip install cassandra-driver

RUN git clone -b 3.3.0 https://github.com/datastax/python-driver.git cassandra-driver
WORKDIR /cassandra-driver
RUN  virtualenv --system-site-packages /venv
RUN . /venv/bin/activate
RUN pip install -r test-requirements.txt
ENTRYPOINT . /venv/bin/activate; \
           cd /cassandra-driver/benchmarks; \
           python callback_full_pipeline.py
CMD [ "-H mercury_seed_1,mercury_cnode_1",  "-k benchmark", "--protocol-version=4",  "-m", "-p",  "--keep-data",  "-t 6",  "-c 10",  "-n 40000"]
