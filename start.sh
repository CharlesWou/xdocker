#!/bin/sh
cat <<-EOF > /etc/xfly/conf
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
/usr/bin/xfly -config=/etc/xfly/conf

