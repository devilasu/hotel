package com.human.vo;

public class MemberInfo {
	private String name;
	private String uid;
	private String password;
	@Override
	public String toString() {
		return "MemberInfo [name=" + name + ", uid=" + uid + ", password=" + password + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
