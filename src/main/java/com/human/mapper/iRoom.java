package com.human.mapper;

import java.util.ArrayList;

import com.human.vo.Roominfo;
import com.human.vo.Roomtype;

public interface iRoom {
	public ArrayList<Roominfo> getRoomList();
	public ArrayList<Roomtype> getRoomType();
	public void deleteRoom(int roomcode);
	public void insertRoom(Roominfo roominfo);
}
