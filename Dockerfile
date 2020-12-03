FROM alpine:latest
ENV PORT=443 UUID=none PATH="/" PROT_IN="less" PROT_OUT="reedom"
RUN export PATH=/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin
RUN apk add --no-cache --virtual .build-deps ca-certificates curl
RUN curl -L -H "Cache-Control: no-cache" -o /xfly.zip https://github.com/XTLS/Xray-core/releases/download/v1.0.0/Xray-linux-64.zip
RUN mkdir /usr/bin/xfly /etc/xfly
RUN touch /etc/xfly/config.json
RUN unzip /xfly.zip -d /usr/bin/xfly
RUN rm -rf /xfly.zip /usr/bin/xfly/*.sig /usr/bin/xfly/doc /usr/bin/xfly/*.json /usr/bin/xfly/*.dat /usr/bin/xfly/sys*
RUN /bin/chmod g+rwx /usr/bin/xfly
ADD start.sh /start.sh
RUN /bin/chmod +x /start.sh
ENTRYPOINT ./start.sh
EXPOSE 443
