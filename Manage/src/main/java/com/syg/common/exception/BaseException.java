package com.syg.common.exception;

public class BaseException extends RuntimeException {
	private static final long serialVersionUID = 3928924179697332043L;
	
	
	private String code = "E";
	private String msg = "程序异常";
	
	public BaseException() {
		super();
	}
	
	public BaseException(String msgOut) {
		super(msgOut);
		this.msg = msgOut;
	}
	
	public BaseException(String msgOut,Exception e) {
		super(msgOut,e);
		this.msg = msgOut;
	}
	
	public BaseException(String msgOut ,String codeOut) {
		super(msgOut);
		msg = msgOut;
		code = codeOut;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
	
}
