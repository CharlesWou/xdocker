#!/bin/sh
cat <<-EOF > /usr/local/etc/xfly/config
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
          "path": "${PATH}"
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
/usr/local/bin/xfly/xray -config=/usr/local/etc/xfly/config

