package com.syg.common;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import com.syg.common.exception.BaseException;

public class HttpHelper {
	private final static int READ_BODY_SIZE = 5120;
	public static String post(String strUrl,String content){
		return post(strUrl, content, 20);
	}
	public static String post(String strUrl,String content,int timeoutSecond){
		try {
			URL url = new URL(strUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setConnectTimeout(timeoutSecond * 1000);//连接主机超时 毫秒
			con.setReadTimeout(timeoutSecond * 1000);//从主机读取数据超时 毫秒
			con.setDoInput(true);//设置从HttpURLConnection读入
			con.setDoOutput(true);//设置是否向httpUrlConnection输出，因为这个是post请求，参数要放在http正文内，因此需要设为true, 默认情况下是false;  
			con.setAllowUserInteraction(false);//设置该URLConnection的allowUserInteraction请求头字段的值
			con.setUseCaches(true);
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
			//此处getOutputStream会隐含的进行connect,所以在开发中不调用上述的connect()也可以
			BufferedWriter bout = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
			bout.write(content);
			bout.flush();
			bout.close();
			return streamReadHtml(con.getInputStream());
		} catch (MalformedURLException e) {
			e.printStackTrace();
			throw new BaseException("网络异常");
		} catch (IOException e) {
			e.printStackTrace();
			throw new BaseException("网络异常");
		}
	}
	
	private static String streamReadHtml(InputStream istream)
			throws UnsupportedEncodingException {
		String html = "";
		byte[] responseBody = new byte[READ_BODY_SIZE];
		int npos = 0;
		int nread = 0;
		try {
			while ((nread = istream.read(responseBody, npos,
					responseBody.length - npos)) >= 0) {
				npos += nread;
				byte[] tmpBuf = new byte[npos + READ_BODY_SIZE];
				System.arraycopy(responseBody, 0, tmpBuf, 0, npos);
				responseBody = tmpBuf;
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (istream != null) {
					istream.close();
				}
				istream = null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		html = new String(responseBody, 0, npos, "UTF-8");
		return html;
	}
}



