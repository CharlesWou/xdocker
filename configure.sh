#!/bin/sh
cat <<-EOF > /etc/xfly/conf
{
  "inbounds": [
  {
    "port": ${PORT},
    "protocol": "${PROTOCOL}",
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
    "protocol": "freedom"
  }
  ]
}
EOF
/usr/bin/xfly/xfly -config=/etc/xfly/conf
