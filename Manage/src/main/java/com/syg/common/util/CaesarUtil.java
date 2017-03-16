package com.syg.common.util;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

/**
 * Caesar加解密算法实现
 * {@docRoot 加密算法：对明文的每个字符加上密钥，然后对256取模}
 * {@docRoot 解密算法：对密文的每个字符减掉密钥}
 * {@docRoot 密钥：1-255的数字}
 * @author Samuel Gavin
 *
 */
public class CaesarUtil {
	private final int SECRET_KEY;
	public CaesarUtil(int secretKey) {
		SECRET_KEY = secretKey;
	}
	
	/**
	 * 加密 对明文的每个字符加上密钥，然后对256取模
	 * @param beforeEncrypt 明文
	 * @return
	 */
	public String encrypt(String beforeEncrypt) {
		StringBuffer result = new StringBuffer();
		for (int i = 0; i < beforeEncrypt.length(); i++) {
			result.append((char) ((beforeEncrypt.charAt(i) + SECRET_KEY) % 256));
		}
		return result.toString();
	}
	
	/**
	 * 解密 对密文的每个字符减掉密钥
	 * @param afterEncrypt 密文
	 * @return
	 */
	public String decrypt(String afterEncrypt) {
		StringBuffer result = new StringBuffer();
		for (int i = 0; i < afterEncrypt.length(); i++) {
			result.append((char) (afterEncrypt.charAt(i) - SECRET_KEY));
		}
		return result.toString();
	}
	
	private static void cipherText2PlainText(){
		CaesarUtil util = new CaesarUtil(4);
		Resource res = new ClassPathResource("init.cla");
		try {
			StringBuffer s = new StringBuffer();
			BufferedReader reader = new BufferedReader(new InputStreamReader(res.getInputStream()));
			String content;
			while ((content = reader.readLine()) != null) {
				//System.out.println(util.decrypt(content));
				s.append(util.decrypt(content));
				s.append("\n");
			}
			System.out.println(s.toString());
			//
			String plain=System.getProperty("user.dir")+"\\src\\main\\config\\plaintext.cla";
			System.out.println(plain);
			FileOutputStream fos = new FileOutputStream(plain);
			fos.write(s.toString().getBytes());
			fos.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private static void plainText2CipherText(){
		//
		CaesarUtil util = new CaesarUtil(4);
		Resource res = new ClassPathResource("plaintext.cla");
		try {
			StringBuffer s = new StringBuffer();
			BufferedReader reader = new BufferedReader(new InputStreamReader(res.getInputStream()));
			String content;
			while ((content = reader.readLine()) != null) {
				//System.out.println(util.decrypt(content));
				s.append(util.encrypt(content));
				s.append("\n");
			}
			System.out.println(s.toString());
			//
			String plain=System.getProperty("user.dir")+"\\src\\main\\config\\init.cla";
			System.out.println(plain);
			FileOutputStream fos = new FileOutputStream(plain);
			fos.write(s.toString().getBytes());
			fos.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public static void main(String...args) {
		//plainText2CipherText();
		CaesarUtil util = new CaesarUtil(4);
//		Resource res = new ClassPathResource("init.cla");				// 文件解密使用
		Resource res = new ClassPathResource("jdbc.properties");		// 文件加密使用
		try {
			StringBuffer s = new StringBuffer();
			BufferedReader reader = new BufferedReader(new InputStreamReader(res.getInputStream()));
			String content;
			while ((content = reader.readLine()) != null) {
//				System.out.println(util.decrypt(content));				// 文件解密使用
				s.append(util.encrypt(content));						// 文件加密使用
				s.append("\n");
			}
			//
			System.out.println(s.toString());						
		} catch (IOException e) {
			e.printStackTrace();
		}
//		System.out.println(util.decrypt("qereki2hvmzivGpewwReqiAgsq2q}wup2nhfg2Hvmziv"));
//		System.out.println(util.decrypt("qereki2yvpAnhfg>q}wup>335=625:<262::>774:3jmwlcqerekicxiwxCywiYrmgshiAxvyi*glevegxivIrgshmrkAyxj1<"));
//		System.out.println(util.decrypt("qereki2ywivreqiAvssx"));
//		System.out.println(util.decrypt("qereki2teww{svhAtowk6455"));
		
		//cipherText2PlainText();
		
		
	}
	
}
