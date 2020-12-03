FROM alpine:latest
ENV PORT=443 UUID=none PROT_IN="less" PROT_OUT="reedom"
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
&& curl -L -H "Cache-Control: no-cache" -o /xfly.zip https://github.com/XTLS/Xray-core/releases/download/v1.0.0/Xray-linux-64.zip \
&& mkdir /usr/bin/xfly /etc/xfly \
&& touch /etc/xfly/config.json \
&& unzip /xfly.zip -d /usr/bin/xfly \
&& rm -rf /xfly.zip /usr/bin/xfly/*.sig /usr/bin/xfly/doc /usr/bin/xfly/*.json /usr/bin/xfly/*.dat /usr/bin/xfly/sys*
ADD start.sh /start.sh
RUN /bin/chmod +x ./start.sh
ENTRYPOINT ./start.sh
EXPOSE 443
