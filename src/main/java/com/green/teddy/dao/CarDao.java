package com.green.teddy.dao;

import java.util.List;

import com.green.teddy.dto.Car;
import com.green.teddy.dto.Review;

public interface CarDao {

	int getTotal(Car car);

	List<Car> carList(Car car);

	int insertCar(Car car);

	Car selectCar(int cno);

	int getMaxCno();

}
