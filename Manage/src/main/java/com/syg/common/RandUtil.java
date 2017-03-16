package com.syg.common;

public class RandUtil {
	
	/**
	 * 生成n位长度的随机数字
	 * @param len
	 * @return
	 */
	public static int genNum(int len){
		if ( len>9) {
			throw new RuntimeException("random num error");
		}
		String numStr=genNumStr(len);
		return Integer.valueOf(numStr);
	}
	
	
	/**
	 * 生成n位长度的随机数字
	 * @param len
	 * @return
	 */
	public static String genNumStr(int len){
		if (len<=0) {
			throw new RuntimeException("random num error");
		}
		String numStr="";
		for (int i = 0; i < len; i++) {
			if (i==0) {
				numStr += ((int)(Math.random()*9) + 1);
			}else{
				numStr += (int)(Math.random()*10);
			}
		}
		return numStr;
	}
	
}
