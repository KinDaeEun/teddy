package com.green.teddy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teddy.dao.CarDao;
import com.green.teddy.dto.Car;
import com.green.teddy.dto.Review;

@Service
public class CarServiceImpl implements CarService {
	@Autowired
	private CarDao cd;

	@Override
	public int getTotal(Car car) {
		return cd.getTotal(car);
	}

	@Override
	public List<Car> carList(Car car) {
		return cd.carList(car);
	}

	@Override
	public int insertCar(Car car) {
		return cd.insertCar(car);
	}

	@Override
	public Car selectCar(int cno) {
		return cd.selectCar(cno);
	}

	@Override
	public int getMaxCno() {
		return cd.getMaxCno();
	}
}
