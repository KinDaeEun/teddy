package com.green.teddy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.teddy.service.ReservationService;

@Controller
public class ReservationController {

	@GetMapping("car/reservationForm")
	public void reservationForm() {
		
	}
}
