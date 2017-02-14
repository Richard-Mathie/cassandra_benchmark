# cassandra_benchmark
Simple docker container for benchmarking Cassandra cluster

## Usage
```
docker run --rm -it --name cassandra_benchmark --network MYNETWORK -e CASSANDRA=MYCASSANDRAHOST ricmathie/cassandra_benchmark:pypy_2_cassandra_3.7.1
docker run --rm -it --name cassandra_benchmark --network MYNETWORK -e CASSANDRA=MYCASSANDRAHOST ricmathie/cassandra_benchmark:python_2.7_cassandra_3.7.1
```
