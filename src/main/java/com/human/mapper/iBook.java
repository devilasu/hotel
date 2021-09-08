package com.human.mapper;

import java.util.List;

import com.human.vo.Roominfo;
import com.human.vo.ReservTypeInfo;
import com.human.vo.ReservedInfo;

public interface iBook {
	public void insertReservation(ReservedInfo reservInfo);
	public void updateReservation(ReservedInfo reservInfo);
	public void deleteReservation(int roomcode);
	public List<Roominfo> getReservation(ReservTypeInfo reservInfo);
	public List<ReservedInfo> getReserved(ReservTypeInfo reservInfo);
}
