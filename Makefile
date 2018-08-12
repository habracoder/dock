copyfiles:
	cp  ./ssl/*.key ./images/nginx/certs/
	cp  ./ssl/*.crt ./images/nginx/certs/
	cp  ./ssl/rootCA.pem ./images/nginx/certs/cert.pem
	cp  ./ssl/*.key ./images/php/certs/
	cp  ./ssl/*.crt ./images/php/certs/
	cp  ./ssl/rootCA.pem ./images/php/certs/cert.pem

