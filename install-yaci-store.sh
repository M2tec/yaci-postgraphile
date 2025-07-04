#!/bin/bash

sudo apt install -y wget apt-transport-https
wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | sudo tee /etc/apt/sources.list.d/adoptium.list

sudo apt install temurin-17-jdk

echo 'export JAVA_HOME=/usr/lib/jvm/temurin-21-jdk-amd64/' >> ~/.bashrc
echo 'export PATH="$PATH:/usr/lib/jvm/temurin-21-jdk-amd64/bin/"' >> ~/.bashrc

git clone --depth 1 --branch v2.0.0-beta2-preview https://github.com/bloxbean/yaci-store.git

cd yaci-store
./gradlew clean build
