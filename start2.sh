#!/bin/sh
cat <<-EOF > /etc/xfly/conf
{
  "${IN}": [
  {
    "port": ${PORT},
    "protocol": "${PROTOCOL}",
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
  "${OUT}": [
  {
    "protocol": "freedom"
  }
  ]
}
EOF
/usr/bin/xfly/xfly -config=/etc/xfly/conf
