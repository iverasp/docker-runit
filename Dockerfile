FROM iverasp/base

RUN apt-get update -q -q && \
 apt-get install runit --yes --force-yes

COPY ./runsvdir-start /usr/local/sbin/runsvdir-start
RUN chmod +x  /usr/local/sbin/runsvdir-start
VOLUME /usr/local/sbin

ENTRYPOINT ["/usr/local/sbin/runsvdir-start"]

