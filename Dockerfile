FROM confluentinc/cp-kafka-connect-base:7.5.3

RUN confluent-hub install --no-prompt debezium/debezium-connector-postgresql:2.2.1

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:10.7.4

ENV CONNECT_PLUGIN_PATH="/usr/share/confluent-hub-components,/usr/share/java/kafka"