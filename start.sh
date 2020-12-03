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
/bin/sh -c '/usr/bin/xfly/xray -config=/etc/xfly/config'

