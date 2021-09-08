package com.human.vo;

public class ReservedInfo {
	private int bookcode;
	private String startDate;
	private String endDate;
	private int howmany;
	private int roomcode;
	private String name;
	private int type;
	private int howmuch;
	private String mobile;
	@Override
	public String toString() {
		return "ReservedInfo [bookcode=" + bookcode + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", howmany=" + howmany + ", roomcode=" + roomcode + ", name=" + name + ", type=" + type + ", howmuch="
				+ howmuch + ", mobile=" + mobile + "]";
	}
	public int getBookcode() {
		return bookcode;
	}
	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	

}
