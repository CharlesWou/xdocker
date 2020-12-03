FROM alpine:3.5
ENV PORT=443 UUID=none PATH=/ 
WORKDIR /usr/bin
RUN chmod -R g+rwX /etc/xfly
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT ./configure.sh
EXPOSE 443
