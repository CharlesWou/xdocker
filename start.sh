#!/bin/sh
cat <<-EOF > /etc/xfly/config
{
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
      "network": "ws",
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

