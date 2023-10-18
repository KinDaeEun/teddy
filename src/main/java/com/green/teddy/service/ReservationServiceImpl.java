package com.green.teddy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teddy.dao.ReservationDao;
import com.green.teddy.dto.Car;
import com.green.teddy.dto.Center;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationDao rd;

	@Override
	public List<Car> getCarName(Car car) {
		return rd.getCarName(car);
	}

	@Override
	public List<Center> centerlist(Center center) {
		return rd.centerlist(center);
	}

	@Override
	public List<Car> brandlist(Car car) {
		return rd.brandlist(car);
	}

}
