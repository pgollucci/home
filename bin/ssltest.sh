#!/bin/sh

# OpenSSL requires the port number.
SERVER="$1"

ciphers=$(openssl ciphers 'ALL:eNULL' | sed -e 's/:/ /g')
tls_protos="tls1_2 tls1_1 tls1"
ssl_protos="ssl3 ssl23 ssl2 ssl"

for proto in $tls_protos $ssl_protos; do
  for cipher in $ciphers; do
    result=$(echo "GET /" | openssl s_client -$proto -cipher "$cipher" -connect $SERVER 2>&1)
    worked=$(echo $result |grep -c DONE)
    if [ $worked -gt 0 ]; then
      echo "[ OK   ]: openssl s_client -$proto -cipher $cipher -connect $SERVER"
    else
      echo "[ FAIL ]: openssl s_client -$proto -cipher $cipher -connect $SERVER"
    fi 
  done
done
