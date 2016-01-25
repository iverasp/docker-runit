FROM iverasp/base

RUN yum install -y wget tar glibc-static && yum groupinstall -y "Development Tools"
RUN mkdir -p /package ; chmod 1755 /package
RUN cd /tmp; wget http://smarden.org/runit/runit-2.1.2.tar.gz && tar xvzf runit-2.1.2.tar.gz --strip-components=1 && rm -f runit-2.1.2.tar.gz && cd runit-2.1.2 && package/install && mkdir /service
RUN cd /tmp; wget https://s3.amazonaws.com/rubyists/aur/runit-services/runit-services-1.1.2-1.tar.gz && tar xzvf runit-services-1.1.2-1.tar.gz && cd runit-services/ && install -D -m 0755 rsvlog /usr/bin/rsvlog && install -D -d /etc/sv && for service in etc/sv/*; do cp -a $service /etc/sv/; done && mkdir -p /run/runit/sv/

CMD runsvdir /service
