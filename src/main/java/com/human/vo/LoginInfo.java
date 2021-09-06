package com.human.vo;

public class LoginInfo {
	private String uid;
	private String password;
	@Override
	public String toString() {
		return "LoginInfo [uid=" + uid + ", password=" + password + "]";
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
