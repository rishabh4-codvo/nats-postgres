#!/usr/bin/env sh
until cqlsh -e "describe cluster" &> /dev/null; do
  echo "Waiting for Cassandra to start..."
  sleep 1
done
cqlsh -e "CREATE KEYSPACE <keyspace_name> WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};"
