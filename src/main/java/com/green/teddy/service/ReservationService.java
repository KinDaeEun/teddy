package com.green.teddy.service;

import java.util.List;

import com.green.teddy.dto.Car;
import com.green.teddy.dto.Center;
import com.green.teddy.dto.Reservation;

public interface ReservationService {

	List<Center> centerlist(Center center);

	List<Car> getCarName(Car car);

	List<Car> brandlist(Car car);

	int insert(Reservation reservation);
	

}
