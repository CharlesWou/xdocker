FROM alpine:3.5
ENV PORT=443 UUID=none PATH=/ 
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && curl -L -H "Cache-Control: no-cache" -o /xfly.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
 && mkdir /usr/bin/xfly /etc/xfly \
 && touch /etc/xfly/config.json \
 && unzip /xfly.zip -d /usr/bin/xfly \
 && rm -rf /xfly.zip /usr/bin/xfly/*.sig /usr/bin/xfly/doc /usr/bin/xfly/*.json /usr/bin/xfly/*.dat /usr/bin/xfly/sys* \
 && chgrp -R 0 /etc/xfly \
 && chmod -R g+rwX /etc/xfly
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT ./configure.sh
EXPOSE 443
