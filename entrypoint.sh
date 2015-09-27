#!/bin/sh

SOLR_MEM=${SOLR_MEM:-1g}

mkdir -p /var/lib/solr

if [ ! -f /var/lib/solr/solr.xml ]; then
	cp -r /opt/solr/server/solr/* /var/lib/solr
fi

/opt/solr/bin/solr start -d /opt/solr/server -s /var/lib/solr -f -m ${SOLR_MEM} -a "${SOLR_OPTS}"
