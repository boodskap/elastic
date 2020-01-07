FROM boodskapiot/ubuntu:18.04.jdk13

MAINTAINER platform@boodskap.io

LABEL Remarks="Elasticsearch preconfigured for Boodskap IoT Platform"

RUN sudo adduser --disabled-password --gecos ""  elastic

RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.5.1-linux-x86_64.tar.gz
RUN tar -xzf elasticsearch-7.5.1-linux-x86_64.tar.gz
RUN mv elasticsearch-7.5.1/* /home/elastic/
RUN rm -rf elasticsearch-7.5.1*

WORKDIR /

COPY etc/ /etc/
COPY elastic/ /home/elastic/
COPY start-elastic.sh .

RUN chmod +x start-elastic.sh

RUN mkdir -p /home/elastic/config/scripts
RUN chown -R elastic:elastic /home/elastic

EXPOSE 9200 9300

CMD ["/start-elastic.sh"]
