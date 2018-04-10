
openssl
genrsa -out rsa_private_key.pem 2048 -days 9999 // 公钥
pkcs8 -topk8 -in rsa_private_key.pem -out pkcs8_rsa_private_key.pem -nocrypt
//把RSA私钥转换成PKCS8格式

rsa -in rsa_private_key.pem -pubout -out rsa_public_key.pem //生成私钥
