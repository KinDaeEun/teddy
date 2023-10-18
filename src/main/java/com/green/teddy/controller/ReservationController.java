package com.green.teddy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.green.teddy.dto.Car;
import com.green.teddy.dto.Car_list;
import com.green.teddy.dto.Reservation;
import com.green.teddy.service.ReservationService;

@Controller
public class ReservationController {

	private ReservationService rs;
	
	@GetMapping("car/reservationForm")
	public void reservationForm(Model model) {
	

	}
	
	@GetMapping("car/reservationInsert")
	public void reservationInsert() {

	}
	
	@PostMapping("car/car_list")
	public void car_list(Model model) {
		List<Car_list> list = rs.carlist();
		
		model.addAttribute("list", list);
	}
}
