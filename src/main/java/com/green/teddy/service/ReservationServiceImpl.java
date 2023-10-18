package com.green.teddy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teddy.dao.ReservationDao;
import com.green.teddy.dto.Car_list;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationDao rd;

	
	@Override
	public List<Car_list> carlist() {
		return rd.carlist();
	}
}
