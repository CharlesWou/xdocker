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
mv /usr/local/bin/xfly/x${STR_RA}y /usr/local/bin/xfly/xfly
/usr/local/bin/xfly/xfly -config=/usr/local/etc/xfly/config

