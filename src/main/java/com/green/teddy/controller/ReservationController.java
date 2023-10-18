package com.green.teddy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.teddy.dto.Car;
import com.green.teddy.dto.Center;
import com.green.teddy.dto.Reservation;
import com.green.teddy.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired
	private ReservationService rs;
	
	@GetMapping("car/reservationForm")
	public void reservationForm(Model model, Car car, Center center) {
		List<Car> brandlist = rs.brandlist(car);				// 브랜드 select
		List<Center> centerlist = rs.centerlist(center);		// 구랑 센터 
		
		model.addAttribute("brandlist", brandlist);
		model.addAttribute("centerlist", centerlist);
	}
	
	@GetMapping("car/reservationInsert")
	public void reservationInsert() {

	}
	
	@RequestMapping( value = "/nolay/brand" )
	public void brand(Model model, Car car) {
		List<Car> getCarName = rs.getCarName(car);				// 모델 select
		
		model.addAttribute("getCarName", getCarName);
		/* return "nolay/brand"; */
	}
	
	@RequestMapping( value = "nolay/center" )
	public void center(Model model, Center center) {
		
		System.out.println("control brand = "+center.getBrand());
		System.out.println("control gu = "+center.getFind_gu());
		
		List<Center> centerlist = rs.centerlist(center);
		
		
		model.addAttribute("centerlist", centerlist);
	}
	
	
}
