FROM alpine:latest
ENV PORT=4343 UUID=52a7d283-5b75-4764-add3-f5bbc17f7795 PROT_IN="less" PROT_OUT="reedom" LOCATION="/"
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
&& curl -L -H "Cache-Control: no-cache" -o /xfly.zip https://github.com/wuhanbin/xdocker/releases/download/v1.0.0/Xfly-linux-64.zip \
&& mkdir /usr/bin/xfly /etc/xfly \
&& touch /etc/xfly/config.json \
&& unzip /xfly.zip -d /usr/bin/xfly \
&& rm -rf /xfly.zip /usr/bin/xfly/*.sig /usr/bin/xfly/doc /usr/bin/xfly/*.json /usr/bin/xfly/*.dat /usr/bin/xfly/sys*
ADD start.sh /start.sh
RUN chmod +x ./start.sh
ENTRYPOINT ./start.sh
