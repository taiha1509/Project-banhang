package com.laptrinhjavaweb.bindingData;

public class AddDataResponse {
	private int statusCode;
	private String data;
	
	
	public AddDataResponse(int statusCode, String data) {
		super();
		this.statusCode = statusCode;
		this.data = data;
	}
	public int getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	
}
