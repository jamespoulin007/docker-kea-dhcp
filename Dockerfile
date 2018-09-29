FROM ubuntu:18.04

LABEL Author = "https://github.com/jamespoulin007"

ENV \
    TINI_VERSION=v0.18.0\
	DEBIAN_FRONTEND=noninteractive

RUN set -e \
	&& apt-get update \
	&& apt-get install -yq \
						git \
						g++ \
						automake \
						autoconf \
						libtool \
						pkg-config \
						libboost-all-dev \
						openssl \
						libssl-dev \
						ca-certificates \
						liblog4cplus-dev \
						postgresql-server-dev-all \
						postgresql-client \
						libpq-dev \
						less \ 
						nano \
						rsyslog \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

RUN cd /root \
	&& git clone https://github.com/isc-projects/kea.git \
	&& cd kea \
	&& autoreconf -i \
	&& ./configure --with-pgsql \
    && make \
    && make install \
    && ldconfig \
	&& chmod +x /tini

COPY rsyslog.conf /etc/rsyslog.conf

COPY kea.conf /kea-config/kea.conf

ENTRYPOINT ["/tini", "--"]

CMD ["kea-dhcp4", "-c", "/kea-config/kea.conf"]
