package com.green.teddy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.teddy.dto.Car;

@Repository
public class CarDaoImpl implements CarDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int getTotal(Car car) {
		return sst.selectOne("carns.getTotal",car);
	}

	@Override
	public List<Car> carList(Car car) {
		return sst.selectList("carns.carList",car);
	}
}
