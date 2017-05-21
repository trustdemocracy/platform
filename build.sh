#!/bin/sh

cd keys
openssl genrsa -out private_key.pem 2048
openssl pkcs8 -topk8 -inform PEM -outform DER -in private_key.pem -out private_key.der -nocrypt
openssl rsa -in private_key.pem -pubout -outform DER -out public_key.der

cd ../..

git clone https://github.com/trustdemocracy/client.git
cd client
docker run -it -v `pwd`:/app -w /app node:alpine sh -c "npm install -g @angular/cli; npm install; ng build -prod"
cd ..

git clone https://github.com/trustdemocracy/users.git
cd users
docker run -it -v `pwd`:/app -w /app maven:alpine mvn clean package -Dmaven.test.skip=true
cd ..

git clone https://github.com/trustdemocracy/proposals.git
cd proposals
docker run -it -v `pwd`:/app -w /app maven:alpine mvn clean package -Dmaven.test.skip=true
cd ..


git clone https://github.com/trustdemocracy/social.git
cd social
docker run -it -v `pwd`:/app -w /app maven:alpine mvn clean package -Dmaven.test.skip=true
cd ..


git clone https://github.com/trustdemocracy/votes.git
cd votes
docker run -it -v `pwd`:/app -w /app maven:alpine mvn clean package -Dmaven.test.skip=true
cd ..


git clone https://github.com/trustdemocracy/ranker.git
cd ranker
docker run -it -v `pwd`:/app -w /app maven:alpine mvn clean package -Dmaven.test.skip=true
cd ..
