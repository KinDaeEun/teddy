package com.green.teddy.dao;

import java.util.List;

import com.green.teddy.dto.Car;

public interface CarDao {

	int getTotal(Car car);

	List<Car> carList(Car car);

	int insertCar(Car car);

}
