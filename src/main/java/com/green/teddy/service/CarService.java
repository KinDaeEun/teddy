package com.green.teddy.service;

import java.util.List;

import com.green.teddy.dto.Car;

public interface CarService {

	int getTotal(Car car);

	List<Car> carList(Car car);

}
