package com.green.teddy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.teddy.dto.Car_list;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Car_list> carlist() {
		return sst.selectList("car_listns.carlist");
	}
}
