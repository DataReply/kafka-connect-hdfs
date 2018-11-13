#!/usr/bin/env bash
RELEASE_VERSION=v4.0.0

cd build_temp && \
wget -q -O kafka.zip https://github.com/apache/kafka/archive/trunk.zip && \
wget -q -O common.zip https://github.com/confluentinc/common/archive/v4.0.0.zip && \
wget -q -O rest-utils.zip https://github.com/confluentinc/rest-utils/archive/v4.0.0.zip && \
wget -q -O schema-registry.zip https://github.com/confluentinc/schema-registry/archive/v4.0.0.zip && \
wget -q -O kafka-connect-storage-common.zip https://github.com/confluentinc/kafka-connect-storage-common/archive/v4.0.0.zip && \
unzip -q kafka.zip && \
cd kafka-trunk && \
gradle -Dhttps.proxyHost=$1 -Dhttps.proxyPort=$2 installAll -q -x test && \
cd .. && \
echo "kafka is installed" && \
unzip -q common.zip && \
cd common-4.0.0 && \
mvn clean install -q -DskipTests=true && \
cd .. && \
echo "common is installed" && \
unzip -q rest-utils.zip && \
cd rest-utils-4.0.0 && \
mvn clean install -q -DskipTests=true && \
cd .. && \
echo "rest-utils is installed" && \
unzip -q schema-registry.zip && \
cd schema-registry-4.0.0 && \
mvn clean install -q -DskipTests=true && \
cd .. && \
echo "schema-registry is installed" && \
unzip -q kafka-connect-storage-common.zip && \
cd kafka-connect-storage-common-4.0.0 && \
mvn clean install -q -DskipTests=true && \
cd .. && \
echo "kafka-connect-storage-common is installed" && \
cd .. && \
rm -r -f build_temp && \
mvn clean package -q -DskipTests=true