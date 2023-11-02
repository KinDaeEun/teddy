package com.green.teddy.dao;

import java.util.List;

import com.green.teddy.dto.Board;
import com.green.teddy.dto.Car;
import com.green.teddy.dto.Center;
import com.green.teddy.dto.Reservation;

public interface ReservationDao {

	List<Center> centerlist(Center center);

	List<Car> getCarName(Car car);

	List<Car> brandlist();

	int insert(Reservation reservation);

	List<Reservation> list(String id);

	int delete(int rno);

	int adminGetTotal(Reservation reservation);

	List<Board> adminReservationList(Reservation reservation);

	int adminDelete(Reservation reservation);

}
