//
//  ViewController.m
//  RSAUtil
//
//  Created by ideawu on 7/14/15.
//  Copyright (c) 2015 ideawu. All rights reserved.
//

#import "ViewController.h"
#import "RSA.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];


//    NSString *pubkey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI2bvVLVYrb4B0raZgFP60VXY\ncvRmk9q56QiTmEm9HXlSPq1zyhyPQHGti5FokYJMzNcKm0bwL1q6ioJuD4EFI56D\na+70XdRz1CjQPQE3yXrXXVvOsmq9LsdxTFWsVBTehdCmrapKZVVx6PKl7myh0cfX\nQmyveT/eqyZK1gYjvQIDAQAB\n-----END PUBLIC KEY-----";
//    NSString *privkey = @"-----BEGIN PRIVATE KEY-----\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMMjZu9UtVitvgHS\ntpmAU/rRVdhy9GaT2rnpCJOYSb0deVI+rXPKHI9Aca2LkWiRgkzM1wqbRvAvWrqK\ngm4PgQUjnoNr7vRd1HPUKNA9ATfJetddW86yar0ux3FMVaxUFN6F0KatqkplVXHo\n8qXubKHRx9dCbK95P96rJkrWBiO9AgMBAAECgYBO1UKEdYg9pxMX0XSLVtiWf3Na\n2jX6Ksk2Sfp5BhDkIcAdhcy09nXLOZGzNqsrv30QYcCOPGTQK5FPwx0mMYVBRAdo\nOLYp7NzxW/File//169O3ZFpkZ7MF0I2oQcNGTpMCUpaY6xMmxqN22INgi8SHp3w\nVU+2bRMLDXEc/MOmAQJBAP+Sv6JdkrY+7WGuQN5O5PjsB15lOGcr4vcfz4vAQ/uy\nEGYZh6IO2Eu0lW6sw2x6uRg0c6hMiFEJcO89qlH/B10CQQDDdtGrzXWVG457vA27\nkpduDpM6BQWTX6wYV9zRlcYYMFHwAQkE0BTvIYde2il6DKGyzokgI6zQyhgtRJ1x\nL6fhAkB9NvvW4/uWeLw7CHHVuVersZBmqjb5LWJU62v3L2rfbT1lmIqAVr+YT9CK\n2fAhPPtkpYYo5d4/vd1sCY1iAQ4tAkEAm2yPrJzjMn2G/ry57rzRzKGqUChOFrGs\nlm7HF6CQtAs4HC+2jC0peDyg97th37rLmPLB9txnPl50ewpkZuwOAQJBAM/eJnFw\nF5QAcL4CYDbfBKocx82VX/pFXng50T7FODiWbbL4UnxICE0UBFInNNiWJxNEb6jL\n5xd0pcy9O2DOeso=\n-----END PRIVATE KEY-----";

    NSString *pubkey = @"-----BEGIN PUBLIC KEY-----MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtu6d0V7zwb+n4ZRwMVgA25O/5GKDgahidzAYHHvMtbAlcozo2QPJKPQ8OFY8/jSislctYEu5vNt4lCqznG/5drlaQ8n6L+SHz6qS6dTWs0jOVqUlJd9RkpDCksHVVQQcEBx3g/n+zBqgcZJ/2I4M8iUUrV9kmBsdBgUmGeBJ2DpIAnmFJ0FCS1q2PQjqsRQl1ogTlEKbvyHPaxPWlOpm+MzqNoijyY4uan6K3HZTwNaweScbwdCg1fC875VNZvzdTL6q9DfM7tMkF66jeuSdDgK8seT613rm1lHK8N0noBSU0agWW/4CINCRETrbtrp57WJ0h6+z5zFZKX2HAdzwNQIDAQAB-----END PUBLIC KEY-----";
    
    NSString *privkey = @"-----BEGIN PRIVATE KEY-----MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC27p3RXvPBv6fhlHAxWADbk7/kYoOBqGJ3MBgce8y1sCVyjOjZA8ko9Dw4Vjz+NKKyVy1gS7m823iUKrOcb/l2uVpDyfov5IfPqpLp1NazSM5WpSUl31GSkMKSwdVVBBwQHHeD+f7MGqBxkn/YjgzyJRStX2SYGx0GBSYZ4EnYOkgCeYUnQUJLWrY9COqxFCXWiBOUQpu/Ic9rE9aU6mb4zOo2iKPJji5qforcdlPA1rB5JxvB0KDV8LzvlU1m/N1Mvqr0N8zu0yQXrqN65J0OAryx5PrXeubWUcrw3SegFJTRqBZb/gIg0JEROtu2unntYnSHr7PnMVkpfYcB3PA1AgMBAAECggEATlTpEUFmgX1vBuJIFGkJnPyse8BPbZLL7xuSB4hfhSFTN7Ts9Bhx5+6FZt5Oqc+iJ1m7HXPvqdYU0OVkGcW8/cCqzUJMtntWSG9TD3vLH+Q6LtHykUAKLwd7udn0Xr4uwhtedg3ztDRmpZtE0VcqZfnI2+BwM83QZMaJpSTsmgDJAoIA/CEzmq9FsSYpw37dZqWcfOvpRPLN4jo0pL7Pmai3HgwcVtGCz9xOGjdUErdx9XE2hdVRvgcDA3b78cZit0wDbnBfO3GwQmaXPQgqRny1922x7HZImKqptPPzfxfClv+9sJdhxz9obCwtXGSknEAjQJ+FSB3BlmET1wbJdQKBgQDpIsGFr4dAXJVM40KnSn3hjFk0Sk8tovAxij4nfvAaasdN01hVAlaPhYhk9PpvZ6nuuCuCxdsOUcc266fnVD/byjLyEwEMxsbH8TmJH4CPYFxcURwEwWMgkVZWfTqP3ZkpElzgqmaGIjOL0FGecoRJkZA5RNOyG/pvvAKNPl3h9wKBgQDI32rmjaoCaHkp5FNlSxYnVwb4TCVPLXYzLuTIVj/hi6gG5JGTXEu4dfy+bMQzuv98VXvSR/ojKnlC7OS6kQGxTNhX12QSx3GJ19oGz7ARKDe6QlZ2s1wnq0cYBxnKTAkQ9HJUQnZ8SjVbe06JtyvYGeDQQiZh2vM+vQxkiiN0MwKBgEtEA0JLptiqizDlddFYhUdZ7jqpeuJ65hy4StSpcI62xl1jy/K17IgtThl51Zg92WjOYI25nr0CvdQHRI+0bWFh6AyrAf3D9sz6Hd8dIn4nV+od7XPDk2MiSMNnbo6ftiDCYuXNXYgUZpvOx2rmAbtWmT9D7yxjR/jms9QxvFGFAoGAXLkk83/5Nltbcsb+6AcdFtPJV9xubHoj0cSXvxJxMn/w9B2WRVuZaHCuVoiGmQp83LvpCExJXupAR3BqtOQyz9EVHJdEjpaaBnMpJXPBZmoWL1hn6SsqIvWhP6oncYZfuP/dtp9nakAnGS92NYPkLUDk0b13UjxrhE5n5hEOBJkCgYEA6J1v3JlU0zRCjgnM8tvFaic9NUrZMyjeGxFusFamX+qtdLtewWL9M7MadD5qomUcwgHkCfcJu4IVm6763oRXRiM20Nu6TWfoSdhERZ4g6+OQv6CCyHKaE27ZWux6iWucQPjVU5zQxiMAz9VBwhd9JeR98y9Ym5YzmBFZUNPFP/8=-----END PRIVATE KEY-----";
    
    
	NSString *originString = @"this is aviva pocket app with react native ";
	NSString *encWithPubKey;
	NSString *decWithPrivKey;
	NSString *encWithPrivKey;
	NSString *decWithPublicKey;
	
	NSLog(@"Original string(%d): %@", (int)originString.length, originString);
	
	// Demo: encrypt with public key
	encWithPubKey = [RSA encryptString:originString publicKey:pubkey];
	NSLog(@"Enctypted with public key: %@", encWithPubKey);
	// Demo: decrypt with private key
	decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privkey];
	NSLog(@"Decrypted with private key: %@", decWithPrivKey);
	
	// by PHP
	encWithPubKey = @"CKiZsP8wfKlELNfWNC2G4iLv0RtwmGeHgzHec6aor4HnuOMcYVkxRovNj2r0Iu3ybPxKwiH2EswgBWsi65FOzQJa01uDVcJImU5vLrx1ihJ/PADUVxAMFjVzA3+Clbr2fwyJXW6dbbbymupYpkxRSfF5Gq9KyT+tsAhiSNfU6akgNGh4DENoA2AoKoWhpMEawyIubBSsTdFXtsHK0Ze0Cyde7oI2oh8ePOVHRuce6xYELYzmZY5yhSUoEb4+/44fbVouOCTl66ppUgnR5KjmIvBVEJLBq0SgoZfrGiA3cB08q4hb5EJRW72yPPQNqJxcQTPs8SxXa9js8ZryeSxyrw==";
	decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privkey];
	NSLog(@"(PHP enc)Decrypted with private key: %@", decWithPrivKey);
	
	// Demo: encrypt with private key
	encWithPrivKey = [RSA encryptString:originString privateKey:privkey];
	NSLog(@"Enctypted with private key: %@", encWithPrivKey);

	// Demo: decrypt with public key
	decWithPublicKey = [RSA decryptString:encWithPrivKey publicKey:pubkey];
	NSLog(@"(PHP enc)Decrypted with public key: %@", decWithPublicKey);
}

@end
