FROM ubuntu:18.04

MAINTAINER platform@boodskap.io

LABEL Remarks="Elasticsearch preconfigured for Boodskap IoT Platform"

RUN apt-get -y update && apt-get install -y curl sudo

RUN sudo adduser --disabled-password --gecos ""  elastic && curl -sL https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.5.1-linux-x86_64.tar.gz | tar xzf - -C /home/elastic && mv /home/elastic/elasticsearch-7.5.1/* /home/elastic/ && rm -rf /home/elastic/elasticsearch-7.5.1*

WORKDIR /

COPY etc/ /etc/
COPY elastic/ /home/elastic/
COPY start-elastic.sh .
RUN chmod +x start-elastic.sh && mkdir -p /home/elastic/config/scripts && chown -R elastic:elastic /home/elastic

EXPOSE 9200 9300

CMD ["/start-elastic.sh"]
