package com.syg.common;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Properties;

import org.springframework.core.io.support.PropertiesLoaderUtils;

public class RemoteFileUtils {

	private static String[] serverIps;

	private static String[] serverPorts;

	private static String flashesPath;

	private static String imagesPath;

	private static String webshopImages;
	
	private static final int BUFFER_SIZE = 1024 * 10;

	static {
		try {
			Properties props = PropertiesLoaderUtils
					.loadAllProperties("fileSockerServer.properties");
			String serverIp = (String) props.get("serverIps");
			String serverPort = (String) props.get("serverPorts");
			flashesPath = props.getProperty("flashes");
			imagesPath = props.getProperty("images");
			webshopImages = props.getProperty("webshopImages");
			if (serverIp.contains(";")) {
				serverPorts = serverPort.split(";");
				serverIps = serverIp.split(";");
			} else {
				serverPorts = new String[] { serverPort };
				serverIps = new String[] { serverIp };
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static synchronized void copyImage(File src, String filename) {
		try {
			copy(src, imagesPath + "/" + filename);
		} catch (Exception e) {
			throw new RuntimeException("请检查服务器：" + serverIps[0] + ":" + serverPorts[0] + "是否连接通畅");
		}
	}

	public static synchronized void copyFlash(File src, String filename) {
		try {
			copy(src, flashesPath + "/" + filename);
		} catch (Exception e) {
			throw new RuntimeException("请检查服务器：" + serverIps[0] + ":" + serverPorts[0] + "是否连接通畅");
		}
	}

	public static synchronized void copyWebImage(File src, String filename) {
		try {
			copy(src, webshopImages + "/" + filename);
		} catch (Exception e) {
			throw new RuntimeException("请检查服务器：" + serverIps[0] + ":" + serverPorts[0] + "是否连接通畅");
		}
	}

	/**
	 * 文件拷贝
	 * 
	 * @param src
	 * @param dst
	 * @throws IOException
	 * @throws UnknownHostException
	 */
	private static synchronized void copy(File src, String filename)
			throws UnknownHostException, IOException {
		for (int i = 0; i < serverIps.length; i++) {
			Socket client = new Socket(serverIps[i], Integer
					.parseInt(serverPorts[i]));
			OutputStream os = client.getOutputStream();
			os.write((filename + ";").getBytes());
			byte[] byteBuffer = new byte[BUFFER_SIZE];
			FileInputStream fos = new FileInputStream(src);
			BufferedInputStream bis = new BufferedInputStream(fos);
			while (bis.read(byteBuffer) != -1) {
				os.write(byteBuffer);
			}
			os.flush();
			bis.close();
			fos.close();
			os.close();
			client.close();
		}
	}
}
