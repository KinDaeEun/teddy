package com.green.teddy.dao;

import java.util.List;

import com.green.teddy.dto.Car;
import com.green.teddy.dto.Center;

public interface ReservationDao {

	List<Center> centerlist(Center center);

	List<Car> getCarName(Car car);

	List<Car> brandlist(Car car);

}
