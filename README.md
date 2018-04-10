
Mac OS:
1)openssl
2)genrsa -out rsa_private_key.pem 2048 -days 9999 // 生成私钥
3)pkcs8 -topk8 -in rsa_private_key.pem -out pkcs8_rsa_private_key.pem -nocrypt
//把RSA私钥转换成PKCS8格式
4)rsa -in rsa_private_key.pem -pubout -out rsa_public_key.pem //生成公钥
