# FROM eclipse-temurin:21-jdk AS java-build

ARG JDK_TAG=24.0.1_9-jdk
ARG JRE_TAG=24.0.1_9-jre-ubi9-minimal

FROM eclipse-temurin:${JDK_TAG} AS yaci-build

RUN apt update && apt install git -y
RUN git clone --depth 1 --branch v2.0.0-beta2-preview https://github.com/bloxbean/yaci-store.git
WORKDIR /yaci-store
RUN 


FROM eclipse-temurin:${JRE_TAG} AS yaci-store

ARG NETWORK
ARG POSTGRES_DB
ARG POSTGRES_HOST
ARG POSTGRES_USER
ARG POSTGRES_PASSWORD

ENV NETWORK=${NETWORK}
ENV POSTGRES_HOST=${POSTGRES_HOST}
ENV POSTGRES_DB=${POSTGRES_DB}
ENV POSTGRES_USER=${POSTGRES_USER}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

WORKDIR /app
COPY --from=yaci-build applications/all/build/libs/yaci-store*.jar /app/yaci-store.jar
COPY components/plugin-polyglot/build/libs/yaci-store-plugin-polyglot*.jar /app/plugins/yaci-store-plugin-polyglot.jar
COPY components/plugin-polyglot/build/libs/plugin-libs/*.jar /app/plugins/lib/
COPY application.properties /yaci-store/config

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "yaci-store.jar"]


### Debugging only
# ENTRYPOINT ["tail"]
# CMD ["-f","/dev/null"]


# FROM eclipse-temurin:21-jre AS server

# ### Debugging only
# ENTRYPOINT ["tail"]
# CMD ["-f","/dev/null"]