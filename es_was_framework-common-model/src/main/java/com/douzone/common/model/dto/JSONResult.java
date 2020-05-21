package com.douzone.common.model.dto;

public class JSONResult {
	private String code;	// "sueccess: 200", "fail: 0"
	private String result;	// "sueccess", "fail"
	private String message;	// result가 "fail" 이면 에러 내용, "success"이면 null
	
	private Object data;	// result가 "fail" 이면 null, "success"이면 객체

	public JSONResult() {
	}
	
	// 기본 생성자 만들지 않음
	private JSONResult(String code, String result, String message, Object data) {
		this.code = code;
		this.result = result;
		this.message = message;
		this.data = data;
	}
	
	public static JSONResult success(Object data) {
		return new JSONResult("200", "success", null, data);
	}
	
	public static JSONResult fail(String code, String message) {
		return new JSONResult(code, "fail", message, null);
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
	
}
