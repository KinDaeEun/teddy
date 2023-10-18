package com.green.teddy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	public List<Car> brandlist(Car car) {
		return sst.selectList("carns.brandlist", car);
	}

	public int insert(Reservation reservation) {
		return sst.insert("reservationns.insert", reservation);
	}


}
