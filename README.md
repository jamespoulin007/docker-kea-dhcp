![alt text](http://www.ungleich.ch/img/logo_200x200.svg "ungleich")

Container with Kea version 1.1.0 compiled from source and with support for PostgreSQL. By default, it listens DHCPv4 only.

# What is it?

Kea is the next generation of DHCP software developed by ISC. It supports both DHCPv4 and DHCPv6 protocols along with their extensions, e.g. prefix delegation and dynamic updates to DNS.

# How to use it?

The DHCP server is ready to use, but you have to mount the main configuration file from the host. A practical example is the following:

``` bash
docker run --name kea -v </path/to/kea.conf>:/usr/local/etc/kea/kea.conf:ro -p 67:67/udp -d ungleich/ungleich-kea
```

# What does it do?
This will create the container with its name as "kea", map the UDP 67 host's port to the container equivalent and mount any path to </usr/local/etc/kea/kea.conf> as read-only.

# How can my Kea container connect to a Postgres container?

Please refer to [ungleich/ungleich-postgres-kea](https://hub.docker.com/r/ungleich/ungleich-postgres-kea/) for instructions about how use a Postgres container adapted to this one and how to link it with your Kea instance.