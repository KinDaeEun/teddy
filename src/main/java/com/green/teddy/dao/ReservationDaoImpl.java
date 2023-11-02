package com.green.teddy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.teddy.dto.Board;
import com.green.teddy.dto.Car;
import com.green.teddy.dto.Center;
import com.green.teddy.dto.Reservation;


@Repository
public class ReservationDaoImpl implements ReservationDao {
	@Autowired
	private SqlSessionTemplate sst;

	public List<Car> getCarName(Car car) {
		System.out.println("brand = " + car.getBrand());
		return sst.selectList("carns.getCarName", car);
	}

	public List<Center> centerlist(Center center) {
		return sst.selectList("centerns.centerlist",center);
	}

	public List<Car> brandlist() {
		return sst.selectList("carns.brandlist");
	}

	public int insert(Reservation reservation) {
		return sst.insert("reservationns.insert", reservation);
	}

	public List<Reservation> list(String id) {
		return sst.selectList("reservationns.list", id);
	}

	public int delete(int rno) {
		return sst.update("reservationns.delete", rno);
	}

	public int adminGetTotal(Reservation reservation) {
		return sst.selectOne("reservationns.adminGetTotal", reservation);
	}

	public List<Board> adminReservationList(Reservation reservation) {
		return sst.selectList("reservationns.adminReservationList", reservation);
	}

	public int adminDelete(Reservation reservation) {
		return sst.update("reservationns.adminDelete", reservation);
	}


}
