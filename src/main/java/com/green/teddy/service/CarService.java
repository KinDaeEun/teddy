package com.green.teddy.service;

import java.util.List;

import com.green.teddy.dto.Car;
import com.green.teddy.dto.Review;

public interface CarService {

	int getTotal(Car car);

	List<Car> carList(Car car);

	int insertCar(Car car);

	Car selectCar(int cno);

	int getMaxCno();

}
