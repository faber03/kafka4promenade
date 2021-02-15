#!/usr/bin/env bash

export TILLER_NAMESPACE=promenade

oc delete pvc datadir-kafka-cp-zookeeper-2
oc delete pvc datadir-kafka-cp-zookeeper-1
oc delete pvc datadir-kafka-cp-zookeeper-0
oc delete pvc datadir-0-kafka-cp-kafka-2
oc delete pvc datadir-0-kafka-cp-kafka-1
oc delete pvc datadir-0-kafka-cp-kafka-0
oc delete pvc datalogdir-kafka-cp-zookeeper-0
oc delete pvc datalogdir-kafka-cp-zookeeper-1
oc delete pvc datalogdir-kafka-cp-zookeeper-2

helm3 delete kafka

helm3 delete kafka-connect-artemis

helm3 delete kafka-connect-neo4j

helm3 install kafka .

cd charts/cp-kafka-connect-artemis || exit

sleep 100

helm3 install kafka-connect-artemis .

cd ~/Desktop/Promenade/cp-kafka-helm-charts/charts/cp-kafka-connect-neo4j/ || exit

helm3 install kafka-connect-neo4j .