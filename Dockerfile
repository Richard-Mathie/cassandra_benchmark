FROM ricmathie/python_cassandra:python_2.7

MAINTAINER Richard Mathie "Richard.Mathie@amey.co.uk"

COPY cassandra-driver/benchmarks /benchmarks

WORKDIR /benchmarks

ENV CASSANDRA=cassandra \
    KEYSPACE=benchmark_1 \

ENTRYPOINT cd /benchmarks; \
           python callback_full_pipeline.py
CMD [ "-H $CASSANDRA",  "-k $KEYSPACE", "--protocol-version=4",  "-m", "-p",  "--keep-data",  "--column-type uuid", "-t 6",  "-c 10",  "-n 40000"]
