package com.douzone.common.model.dto;

public class JSONRequest {
	
	private String code;		// 상태값
	private String dc;			// DB Code(001: ORACLE, 002: MSSQL)
	private String msg;			// result가 "fail" 이면 에러 내용, "success"이면 null
	private String proc;		// 프로시저명칭
	private String pageNum;		// 페이지 번호
	private String pageCount;	// 페이지에 리턴할 리스트 개수
	
	private Object data;	

	// 기본 생성자 만들지 않음
	private JSONRequest(String code, String dc, String msg, String proc, String pageNum, String pageCount, Object data) {
		this.code = code;
		this.dc = dc;
		this.msg = msg;
		this.proc = proc;
		this.pageNum = pageNum;
		this.pageCount = pageCount;
		this.data = data;
	}
	
	/*
	public static JSONRequest success(Object data) {
		return new JSONRequest("success", null, data);
	}
	
	public static JSONRequest fail(String msg) {
		return new JSONRequest("fail", msg, null);
	}
	*/
	
	public String getCode() {
		return code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}

	public String getDc() {
		return dc;
	}
	
	public void setDc(String dc) {
		this.dc = dc;
	}
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getProc() {
		return proc;
	}
	
	public void setProc(String proc) {
		this.proc = proc;
	}

	public String getPageNum() {
		return pageNum;
	}
	
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public String getPageCount() {
		return pageCount;
	}
	
	public void setPageCount(String pageCount) {
		this.pageCount = pageCount;
	}
	
	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
	
}
