#!/usr/bin/env bash

oc delete pvc datadir-kafka-cp-zookeeper-2
oc delete pvc datadir-kafka-cp-zookeeper-1
oc delete pvc datadir-kafka-cp-zookeeper-0
oc delete pvc datadir-0-kafka-cp-kafka-2
oc delete pvc datadir-0-kafka-cp-kafka-1
oc delete pvc datadir-0-kafka-cp-kafka-0
oc delete pvc datalogdir-kafka-cp-zookeeper-0
oc delete pvc datalogdir-kafka-cp-zookeeper-1
oc delete pvc datalogdir-kafka-cp-zookeeper-2

helm del --purge kafka

helm del --purge kafka-connect-artemis


helm install --name kafka .

cd charts/cp-kafka-connect-artemis || exit

sleep 120

helm install --name kafka-connect-artemis .