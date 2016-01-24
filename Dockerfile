FROM iverasp/base

RUN apt-get update -q -q && \
 apt-get install runit --yes --force-yes

RUN wget https://raw.githubusercontent.com/iverasp/docker-runit/master/runsvdir-start -O /usr/local/sbin/runsvdir-start && chmod +x  /usr/local/sbin/runsvdir-start

ENTRYPOINT ["/usr/local/sbin/runsvdir-start"]

