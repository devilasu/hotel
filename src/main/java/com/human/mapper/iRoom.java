package com.human.mapper;

import java.util.ArrayList;

import com.human.vo.LoginInfo;
import com.human.vo.MemberInfo;
import com.human.vo.Roominfo;
import com.human.vo.Roomtype;

public interface iRoom {
	public ArrayList<Roominfo> getRoomList();
	public Roominfo searchRoom(int roomcode);
	public void updateRoom(Roominfo roominfo);
	public ArrayList<Roomtype> getRoomType();
	public void deleteRoom(int roomcode);
	public void insertRoom(Roominfo roominfo);
	//Member ฐüทร
	public void joinMember(MemberInfo memberinfo);
	public MemberInfo getMember(LoginInfo loginInfo);
}
