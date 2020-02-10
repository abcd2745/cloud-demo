package com.lc.a.cipher;

import com.lc.a.code.MyBase64Util;
import org.junit.Assert;
import org.junit.Test;

import javax.crypto.Cipher;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Arrays;
import java.util.Base64;

/**
 * 给定公钥私钥加密解密
 * 签名 （MD5withRSA的方式) 和 验签
 * 公钥加密、私钥解密、私钥签名、公钥验签。
 */
public class RsaDemo2 {

    public static final String KEY_ALGORITHM = "RSA";
    /**
     * 签名算法
     * SHA256WithRSA （RSA2），MD5WithRSA  SHA1WithRSA （RSA）
     */
    public static final String SIGNATURE_ALGORITHM = "SHA256WithRSA";
    private static final int KEY_SIZE = 1024;
    private static final String PUBLIC_KEY = "RSAPublicKey";
    private static final String PRIVATE_KEY = "RSAPrivateKey";
    public static String str_pubK = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCvHyjdaX6V2OTyAS27DtyhbQbiHIeNTsYPxqJ/rx2qwcnnCUD1MqunKwazh82jTWYGMW7jko8TN4qcNAdqUoCgQYUxi+1PZV/oCd8lnhV9Qut/tVlWuezDg7QXLUhbfQ1izZO7d8gjKxfNBa6+jiB5sPMvRbe3OzRAkpw5KW7HMwIDAQAB";
    public static String str_priK = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK8fKN1pfpXY5PIBLbsO3KFtBuIch41Oxg/Gon+vHarByecJQPUyq6crBrOHzaNNZgYxbuOSjxM3ipw0B2pSgKBBhTGL7U9lX+gJ3yWeFX1C63+1WVa57MODtBctSFt9DWLNk7t3yCMrF80Frr6OIHmw8y9Ft7c7NECSnDkpbsczAgMBAAECgYBXbmcopBLfHXqwmIYMbk8ZCSX2nefPVRTtq25V8UgOiNIU1znnMXUh8QlXeOXiMjJNxUBnvjRQk9pQQmmxW597jxg8/UpqQOIGSS5zagYtK0u70zIDQsj7RR4ki9cXDxKbBh90sK31JLBW3GzTL3LGOcQMAsJJ8LR8vNi1ODZfgQJBAOXUHP75juLOdMIotKV/eJvz1F2VgqKpGhhkseAssMZ43pNWnnTTnos6BW58EHOoYnVQR+QgCh7PHSX3Hi4yygUCQQDDEEASNuqbwldGzKAZTxusp/85XMCGVNO++/KuKMnV7PExpO5RLI3+FiWg7vV8sQE6TdvvsFz4WsSmb+LkXDnXAkB1WYwAqP5LUq2NYelzQ5Ya0zJRIoEUexGm+OtWEpuki5ziUG0SK+edIWAanOBtncHAMuCyW6WvO4OfmgFgB3DdAkBL+apa7dTXMgy4YL8C3JMU3qJD/2Jlb+jBfHR7bRugHReclHbWWxo7GvkxA6HOHUszIFxHsVOk0AXEJdQjyeAlAkEAvwRCRZSl6twx84CUj7KyTbTwd9hlqa2C+jIYuR4sGOHC3F5cjUQIoSmNwlNh4imNKbIIFLHmhjM0wpBxfReD2g==";

    /**
     * 这里对加密后的byte数组同故宫base64编码
     * java8 自带的编码是补成功的，自定义的编码方法和org.apache.commons.codec.binary.Base64.encodeBase64String(bt_cipher)
     * 不影响实际结果，只是输出打印问题
     *
     * @throws Exception
     */
    @Test
    public void test() throws Exception {
        String str_plaintext = "这是一段用来测试密钥转换的明文";
        System.err.println("明文：" + str_plaintext);
        byte[] bt_cipher = encrypt(str_plaintext.getBytes());
        System.out.println("加密后byte数组：" + Arrays.toString(bt_cipher));
        //TODO  这里其实没明白为什么
//        System.out.println("加密后：" + Base64.getDecoder().decode(new String(bt_cipher)));
        System.out.println("加密后：" + new MyBase64Util().encode(new String(bt_cipher)));
        System.out.println("加密后：" + org.apache.commons.codec.binary.Base64.encodeBase64String(bt_cipher));

        byte[] bt_original = decrypt(bt_cipher);
        String str_original = new String(bt_original);
        System.out.println("解密结果:" + str_original);

        Assert.assertEquals(str_plaintext, str_original);

        String str = "被签名的内容";
        System.err.println("\n原文:" + str);
        byte[] signature = sign(str.getBytes());
        System.out.println("产生签名：" + org.apache.commons.codec.binary.Base64.encodeBase64String(signature));
        boolean status = verify(str.getBytes(), signature);
        System.out.println("验证情况：" + status);
        Assert.assertTrue(status);
    }

    /**
     * 得到公钥
     *
     * @param key 密钥字符串（经过base64编码）
     * @throws Exception
     */
    public static PublicKey getPublicKey(String key) throws Exception {
        byte[] keyBytes = Base64.getDecoder().decode(key);
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PublicKey publicKey = keyFactory.generatePublic(keySpec);
        return publicKey;
    }

    /**
     * 得到私钥
     *
     * @param key 密钥字符串（经过base64编码）
     * @throws Exception
     */
    public static PrivateKey getPrivateKey(String key) throws Exception {
//        byte[] keyBytes = (new BASE64Decoder()).decodeBuffer(key);
        byte[] keyBytes = Base64.getDecoder().decode(key);
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PrivateKey privateKey = keyFactory.generatePrivate(keySpec);
        return privateKey;
    }

    //***************************签名和验证*******************************

    /**
     * 签名是请求接收方（私钥加签）发起
     * eg：热风请求ICBC支付，ICBC 是请求接收方，发送公钥给热风。
     * 热风发起支付请求，对请求mds加签名，然后用公钥加密请求ICBC。
     * ICBC 响应结果，并用私钥加签，热风用公钥验签。证明响应是ICBC发出的，并且未被篡改
     *
     * @param data
     * @return
     * @throws Exception
     */
    public static byte[] sign(byte[] data) throws Exception {
        PrivateKey priK = getPrivateKey(str_priK);
        Signature sig = Signature.getInstance(SIGNATURE_ALGORITHM);
        sig.initSign(priK);
        sig.update(data);
        return sig.sign();
    }

    /**
     * 请求发起方（公钥验签）验证
     *
     * @param data
     * @param sign
     * @return
     * @throws Exception
     */
    public static boolean verify(byte[] data, byte[] sign) throws Exception {
        PublicKey pubK = getPublicKey(str_pubK);
        Signature sig = Signature.getInstance(SIGNATURE_ALGORITHM);
        sig.initVerify(pubK);
        sig.update(data);
        return sig.verify(sign);
    }

    //************************加密解密**************************
    public static byte[] encrypt(byte[] bt_plaintext) throws Exception {
        PublicKey publicKey = getPublicKey(str_pubK);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE, publicKey);
        return cipher.doFinal(bt_plaintext);
    }

    public static byte[] decrypt(byte[] bt_encrypted) throws Exception {
        PrivateKey privateKey = getPrivateKey(str_priK);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        return cipher.doFinal(bt_encrypted);
    }
}
