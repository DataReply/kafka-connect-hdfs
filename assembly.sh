#!/usr/bin/env bash
RELEASE_VERSION=v4.0.0

cd build_temp && \
cd kafka && \
gradle installAll && \
cd .. && \
echo "kafka is installed" && \
cd common && \
git checkout tags/v4.0.0 -b 4.0.0-datareply && \
mvn clean install && \
cd .. && \
echo "common is installed" && \
cd rest-utils && \
git checkout tags/v4.0.0 -b 4.0.0-datareply && \
mvn clean install && \
cd .. && \
echo "rest-utils is installed" && \
cd schema-registry && \
git checkout tags/v4.0.0 -b 4.0.0-datareply && \
mvn clean install && \
cd .. && \
echo "schema-registry is installed" && \
cd kafka-connect-storage-common && \
git checkout tags/v4.0.0 -b 4.0.0-datareply && \
mvn clean install -DskipTests=true && \
cd .. && \
echo "kafka-connect-storage-common is installed" && \
cd .. && \
rm -r build_temp && \
mvn clean package

#mkdir build_temp && \
#cd build_temp && \
#git clone https://github.com/apache/kafka/ && \
#cd kafka && \
#gradle installAll && \
#cd .. && \
#echo "kafka is installed" && \
#git clone https://github.com/confluentinc/common && \
#cd common && \
#git checkout tags/v4.0.0 -b 4.0.0-datareply && \
#mvn clean install && \
#cd .. && \
#echo "common is installed" && \
#git clone https://github.com/confluentinc/rest-utils && \
#cd rest-utils && \
#git checkout tags/v4.0.0 -b 4.0.0-datareply && \
#mvn clean install && \
#cd .. && \
#echo "rest-utils is installed" && \
#git clone https://github.com/confluentinc/schema-registry && \
#cd schema-registry && \
#git checkout tags/v4.0.0 -b 4.0.0-datareply && \
#mvn clean install && \
#cd .. && \
#echo "schema-registry is installed" && \
#git clone https://github.com/confluentinc/kafka-connect-storage-common && \
#cd kafka-connect-storage-common && \
#git checkout tags/v4.0.0 -b 4.0.0-datareply && \
#mvn clean install -DskipTests=true && \
#cd .. && \
#echo "kafka-connect-storage-common is installed" && \
#cd .. && \
#rm -r build_temp && \
#mvn clean package