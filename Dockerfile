FROM    appertise/oracle-jdk8
MAINTAINER Appertise <appertise.co@gmail.com>

ENV SOLR_VERSION 5.2.1

RUN apt-get update && apt-get install -y procps

RUN cd /tmp && \
	wget "http://mirror.nbtelecom.com.br/apache/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz"

RUN cd /tmp && \
	tar xzf "solr-$SOLR_VERSION.tgz" && \
	rm solr-$SOLR_VERSION.tgz && \
	mv /tmp/solr-$SOLR_VERSION /opt/solr

VOLUME /var/lib/solr

COPY entrypoint.sh /

EXPOSE 8983


ENTRYPOINT /entrypoint.sh
