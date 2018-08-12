# https://medium.freecodecamp.org/how-to-get-https-working-on-your-local-development-environment-in-5-minutes-7af615770eec

NAME=$1
cp template.csr.cnf $NAME.csr.cnf
cp template.v3.ext $NAME.v3.ext
echo CN=$NAME >> $NAME.csr.cnf
echo DNS.1=$NAME >> $NAME.v3.ext

openssl req -new -sha256 -nodes -out $NAME.csr -newkey rsa:2048 -keyout $NAME.key -config <( cat $NAME.csr.cnf )
openssl x509 -req -in $NAME.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out $NAME.crt -days 500 -sha256 -extfile $NAME.v3.ext
