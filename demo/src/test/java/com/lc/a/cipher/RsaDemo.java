package com.lc.a.cipher;

import org.junit.Test;

import javax.crypto.Cipher;
import java.security.*;
import java.util.Base64;

/**
 * 来源：https://blog.csdn.net/qq_18870023/article/details/52596808
 * 三种方式获取key（公钥私钥）
 * 1. KeyPairGenerator获取key；
 * 2. String获取key；
 * 3. modulus和exponent获取key。（不大常用，讲demo3）
 */
public class RsaDemo {

    @Test
    public void test() throws Exception {

        KeyPair keyPair = genKeyPair(1024);

        //获取公钥，并以base64格式打印出来
        PublicKey publicKey = keyPair.getPublic();
        System.out.println("公钥：" + new String(Base64.getEncoder().encode(publicKey.getEncoded())));

        //获取私钥，并以base64格式打印出来
        PrivateKey privateKey = keyPair.getPrivate();
        System.out.println("私钥：" + new String(Base64.getEncoder().encode(privateKey.getEncoded())));

        //公钥加密
        byte[] encryptedBytes = encrypt("woshi1wen".getBytes(), publicKey);
        System.out.println("加密后：" + new String(encryptedBytes));

        //私钥解密
        byte[] decryptedBytes = decrypt(encryptedBytes, privateKey);
        System.out.println("解密后：" + new String(decryptedBytes));
    }

    /**
     * 生成密钥对
     *
     * @param keyLength
     * @return
     * @throws Exception
     */
    public static KeyPair genKeyPair(int keyLength) throws Exception {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        keyPairGenerator.initialize(keyLength);
        return keyPairGenerator.generateKeyPair();
    }

    /**
     * 公钥加密
     *
     * @param content   明文
     * @param publicKey 公钥
     * @return
     * @throws Exception
     */
    public static byte[] encrypt(byte[] content, PublicKey publicKey) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA");//java默认"RSA"="RSA/ECB/PKCS1Padding"
        cipher.init(Cipher.ENCRYPT_MODE, publicKey);
        return cipher.doFinal(content);
    }

    /**
     * 私钥解密
     *
     * @param content    密文
     * @param privateKey 私钥
     * @return
     * @throws Exception
     */
    public static byte[] decrypt(byte[] content, PrivateKey privateKey) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        return cipher.doFinal(content);
    }
}
