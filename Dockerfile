FROM alpine:3.5
ENV PORT=443 UUID=none PATH="/" PROT_IN="less" PROT_OUT="reedom"
RUN export PATH=$PATH:/sbin:/bin:/usr/bin \
 && apk add --no-cache --virtual .build-deps ca-certificates curl \
 && curl -L -H "Cache-Control: no-cache" -o /xfly.zip https://github.com/XTLS/Xray-core/releases/download/v1.0.0/Xray-linux-64.zip \
 && mkdir /usr/local/bin/xfly /usr/local/etc/xfly \
 && touch /usr/local/etc/xfly/config.json \
 && unzip /xfly.zip -d /usr/local/bin/xfly \
 && rm -rf /xfly.zip /usr/local/bin/xfly/*.sig /usr/local/bin/xfly/doc /usr/local/bin/xfly/*.json /usr/local/bin/xfly/*.dat /usr/local/bin/xfly/sys* \
 && chgrp -R 0 /usr/local/etc/xfly \
 && chmod -R g+rwX /usr/local/etc/xfly
ADD start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ./start.sh
EXPOSE 443
