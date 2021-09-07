package com.human.mapper;

import java.util.List;

import com.human.vo.Roominfo;
import com.human.vo.ReservTypeInfo;

public interface iBook {
	public void insertReservation();
	public List<Roominfo> getReservation(ReservTypeInfo reservInfo);
	public List<Roominfo> getReservated(ReservTypeInfo reservInfo);
}
