package com.human.vo;

public class Roominfo {
	private int roomcode;
	private String name;
	private String type;
	private int howmany;
	private int howmuch;
	
	@Override
	public String toString() {
		return "Roominfo [roomcode=" + roomcode + ", name=" + name + ", type=" + type + ", howmany=" + howmany
				+ ", howmuch=" + howmuch + "]";
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public int getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	
}
