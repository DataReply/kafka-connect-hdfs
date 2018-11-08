#!/usr/bin/env bash
RELEASE_VERSION=v4.0.0

cd build_temp && \
unzip kafka.zip && \
cd kafka-trunk && \
gradle -Dhttps.proxyHost=$1 -Dhttps.proxyPort=$2 installAll && \
cd .. && \
echo "kafka is installed" && \
unzip common.zip && \
cd common-4.0.0 && \
mvn clean install && \
cd .. && \
echo "common is installed" && \
unzip rest-utils.zip && \
cd rest-utils-4.0.0 && \
mvn clean install && \
cd .. && \
echo "rest-utils is installed" && \
unzip schema-registry.zip && \
cd schema-registry-4.0.0 && \
mvn clean install && \
cd .. && \
echo "schema-registry is installed" && \
unzip kafka-connect-storage-common.zip && \
cd kafka-connect-storage-common-4.0.0 && \
mvn clean install -DskipTests=true && \
cd .. && \
echo "kafka-connect-storage-common is installed" && \
cd .. && \
rm -r build_temp && \
mvn clean package -DskipTests=true