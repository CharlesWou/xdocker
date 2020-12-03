#!/bin/sh
# new configuration
cat <<-EOF > /etc/v2ray/config.json
{
  "inbounds": [
  {
    "port": ${PORT},
    "protocol": "vless",
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
# Run
/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
