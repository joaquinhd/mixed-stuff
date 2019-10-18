#!/bin/bash
#To generate a key and csr, put your txt templates with .txt extension and the name of the domain, in the directory where you lauch the script
#it generate a directory for each certificate with the domain name, and inside the .key and the .csr to order the certificate.

domains=$(ls *.com.txt | sed s/.txt//g)
for i in $domains
  do
    mkdir $i
    openssl genpkey -outform PEM -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out $i/$i.key
    openssl req -new -nodes -key $i/$i.key -config $i.txt -out $i/$i.csr
    mv $i.txt $i
  done
