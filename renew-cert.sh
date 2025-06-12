#!/bin/sh

CAKEY=certs/ca.key
CACERT=certs/ca.crt

SERVERKEY=certs/rsyslog.key
SERVERCSR=certs/rsyslog.csr
SERVERCERT=certs/rsyslog.crt

CA_SUBJ="/C=IT/ST=Italy/L=Verona/O=MyCompany/OU=IT/CN=MyRootCA"
SERVER_SUBJ="/C=IT/ST=Italu/L=Verona/O=MyCompany/OU=IT/CN=localhost"

# Generate CA key and certificate
openssl genrsa -out $CAKEY 4096
openssl req -x509 -new -nodes -key $CAKEY -sha256 -days 3650 -out $CACERT -subj "$CA_SUBJ"

# Generate server key
openssl genrsa -out $SERVERKEY 2048

# Generate CSR and temporarily store it
openssl req -new -key $SERVERKEY -out $SERVERCSR -subj "$SERVER_SUBJ"

# Sign server cert
openssl x509 -req -in $SERVERCSR -CA $CACERT -CAkey $CAKEY -CAcreateserial -out $SERVERCERT -days 825 -sha256

# Clean up
rm $SERVERCSR
rm $CAKEY

echo "Done! Certificates generated:"
echo "CA: $CACERT"
echo "Server Key: $SERVERKEY"
echo "Server Cert: $SERVERCERT"
