FROM iverasp/base

RUN apt-get update -q -q && \
 apt-get install runit --yes --force-yes

COPY ./runsvdir-start /usr/local/sbin/runsvdir-start

RUN chmod 777  /usr/local/sbin/runsvdir-start

ENTRYPOINT ["/usr/local/sbin/runsvdir-start"]

