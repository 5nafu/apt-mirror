FROM debian:9
RUN apt-get update -q && \
    apt install -y -qq apt-mirror && \
    rm -rf /var/cache/apt/* /etc/cron.d/apt-mirror
COPY mirror.list /mirror.list
COPY run.sh /run.sh
VOLUME ["/var/spool/apt-mirror"]
ENV RUNAT ""
USER apt-mirror
CMD ["/run.sh"]
