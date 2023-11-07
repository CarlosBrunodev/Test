# To buil a custom image

##  docker build -t o2boficial/logstash:7.17.3 .
##  docker push o2boficial/logstash:7.17.3

FROM docker.elastic.co/logstash/logstash:7.17.5

# To customize for SNMP monitoring
USER root

RUN mkdir -p /etc/logstash/mib && \
    chown -R logstash.logstash /etc/logstash/mib && \
    mkdir -p /usr/share/logstash/data && \
    chown -R logstash.logstash /usr/share/logstash/data && chmod -R 777 /usr/share/logstash/data

COPY ./TCP-MIB.dic /etc/logstash/mib/TCP-MIB.dic

RUN apt update && apt install snmp snmp-mibs-downloader -y && chown logstash.logstash /etc/logstash/mib/TCP-MIB.dic

USER logstash