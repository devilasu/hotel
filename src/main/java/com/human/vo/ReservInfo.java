package com.human.vo;


public class ReservInfo {
	private String startDate;
	private String endDate;
	private int howmany;
	private int roomcode;
	@Override
	public String toString() {
		return "ReservInfo [startDate=" + startDate + ", endDate=" + endDate + ", howmany=" + howmany + ", roomcode="
				+ roomcode + "]";
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
	
	
	
}
