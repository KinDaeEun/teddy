package com.green.teddy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teddy.dao.ReservationDao;
import com.green.teddy.dto.Board;
import com.green.teddy.dto.Car;
import com.green.teddy.dto.Center;
import com.green.teddy.dto.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationDao rd;

	public List<Car> getCarName(Car car) {
		return rd.getCarName(car);
	}

	public List<Center> centerlist(Center center) {
		return rd.centerlist(center);
	}

	public List<Car> brandlist() {
		return rd.brandlist();
	}

	public int insert(Reservation reservation) {
		return rd.insert(reservation);
	}

	public List<Reservation> list(String id) {
		return rd.list(id);
	}

	public int delete(int rno) {
		return rd.delete(rno);
	}

	public int adminGetTotal(Reservation reservation) {
		return rd.adminGetTotal(reservation);
	}

	public List<Board> adminReservationList(Reservation reservation) {
		return rd.adminReservationList(reservation);
	}

	public int adminDelete(Reservation reservation) {
		return rd.adminDelete(reservation);
	}

}
