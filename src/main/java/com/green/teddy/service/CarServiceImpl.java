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

	public int getTotal(Car car) {
		return cd.getTotal(car);
	}

	public List<Car> carList(Car car) {
		return cd.carList(car);
	}

	public int insertCar(Car car) {
		return cd.insertCar(car);
	}

	public Car selectCar(int cno) {
		return cd.selectCar(cno);
	}

	public int getMaxCno() {
		return cd.getMaxCno();
	}

}
