# influxdb 0.8.5

FROM debian:jessie

#ADD http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb /influxdb_latest_amd64.deb
ADD http://get.influxdb.org/influxdb_0.9.0-rc7_amd64.deb /influxdb_0.9.0-rc7_amd64.deb
RUN mkdir -p /opt/influxdb/shared/data && \
    dpkg -i /influxdb_0.9.0-rc7_amd64.deb && \
    rm -rf /opt/influxdb/shared/data && \
    chown -R daemon:daemon /opt/influxdb

USER daemon
EXPOSE 8083 8086

ENTRYPOINT ["/usr/bin/influxdb"]
CMD ["-config=/opt/influxdb/shared/config.toml"]
