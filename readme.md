### Launch a new connector instance
```
cd /etc; curl -s -X POST -H 'Content-Type: application/json' --data @artemis-source.json http://localhost:8083/connectors
cd /etc/neo4j; curl -s -X POST -H 'Content-Type: application/json' --data @neo4j-sink.json http://localhost:8083/connectors
curl -s -X DELETE http://localhost:8083/connectors/neo4j-sink
curl -s -X DELETE http://localhost:8083/connectors/artemis-source
```