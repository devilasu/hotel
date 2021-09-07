package com.human.vo;

public class ReservTypeInfo {
	private String startDate;
	private String endDate;
	private int roomType;
	@Override
	public String toString() {
		return "reservTypeInfo [startDate=" + startDate + ", endDate=" + endDate + ", roomType=" + roomType + "]";
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
	public int getRoomType() {
		return roomType;
	}
	public void setRoomType(int roomType) {
		this.roomType = roomType;
	}
	
	
}
