#!/usr/bin/env bash
RELEASE_VERSION=v4.0.0

function installGradle()
{
    if ! [ -x "$(command -v gradle)" ]; then
        if ! [ -x "$(command -v /opt/gradle/gradle-4.10.2/bin/gradle)" ]; then
            wget https://services.gradle.org/distributions/gradle-3.4.1-bin.zip && \
            mkdir /opt/gradle && \
            unzip -d /opt/gradle gradle-4.10.2-bin.zip && \
            echo "/opt/gradle/gradle-4.10.2/bin/gradle"
        else
            echo "/opt/gradle/gradle-4.10.2/bin/gradle"
        fi
    else
        echo "gradle"
    fi
}

GRADLE_P=$(installGradle) && \
mkdir build_temp && \
cd build_temp && \
git clone https://github.com/apache/kafka/ && \
cd kafka && \
eval "$GRADLE_P installAll" && \
cd .. && \
echo "kafka is installed" && \
git clone https://github.com/confluentinc/common && \
cd common && \
git checkout tags/v4.0.0 -b 4.0.0-datareply && \
mvn clean install && \
cd .. && \
echo "common is installed" && \
git clone https://github.com/confluentinc/rest-utils && \
cd rest-utils && \
git checkout tags/v4.0.0 -b 4.0.0-datareply && \
mvn clean install && \
cd .. && \
echo "rest-utils is installed" && \
git clone https://github.com/confluentinc/schema-registry && \
cd schema-registry && \
git checkout tags/v4.0.0 -b 4.0.0-datareply && \
mvn clean install && \
cd .. && \
echo "schema-registry is installed" && \
git clone https://github.com/confluentinc/kafka-connect-storage-common && \
cd kafka-connect-storage-common && \
git checkout tags/v4.0.0 -b 4.0.0-datareply && \
mvn clean install -DskipTests=true && \
cd .. && \
echo "kafka-connect-storage-common is installed" && \
cd .. && \
rm -r build_temp && \
mvn clean package