#!/bin/sh
cat <<-EOF > /etc/xfly/config
{
  "log": {
    "loglevel": "debug"
  },
  "inbounds": [
  {
    "port": ${PORT},
    "protocol": "v${PROT_IN}",
    "settings": {
      "clients": [
        {
          "id": "${UUID}",
          "level": 0
        }
      ],
      "decryption": "none"
    },
    "streamSettings": {
      "network": "h2",
      "security": "none",
      "wsSettings": {
          "path": "${LOCATION}"
      }
    }
  }
  ],
  "outbounds": [
  {
    "protocol": "f${PROT_OUT}"
  }
  ]
}
EOF
chmod -R +x /usr/bin/xfly
/usr/bin/xfly/xray -config=/etc/xfly/config

