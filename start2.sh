#!/bin/sh
cat <<-EOF > /etc/xfly/conf
{
  "inbounds": [
  {
    "port": 443,
    "protocol": "${PROT}",
    "settings": {
      "${CLI}": [
        {
          "id": "${UUID}",
          "level": 0
        }
      ],
      "${DEC}": "none"
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
    "protocol": "${FREE}"
  }
  ]
}
EOF
/usr/bin/xfly/xfly -config=/etc/xfly/conf
