package com.green.teddy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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

	// 시승예약 폼
	@GetMapping("car/reservationForm")
	public void reservationForm(Model model, Car car, Center center) {
		List<Car> brandlist = rs.brandlist(car); // 브랜드 select

		model.addAttribute("brandlist", brandlist);
	}

	// brand.do
	@RequestMapping(value = "/nolay/brand")
	public void brand(Model model, Car car) {
		List<Car> getCarName = rs.getCarName(car); // 모델 select

		model.addAttribute("getCarName", getCarName);
		/* return "nolay/brand"; */
	}

	// center.do
	@RequestMapping(value = "nolay/center")
	public void center(Model model, Center center) {

		System.out.println("control brand = " + center.getBrand());
		System.out.println("control gu = " + center.getFind_gu());

		List<Center> centerlist = rs.centerlist(center);

		model.addAttribute("centerlist", centerlist);
	}

	// 시승예약 결과
	@PostMapping("car/reservationResult")
	public void reservationInsert(Reservation reservation, Model model, HttpSession session) {
		int result = rs.insert(reservation);

		model.addAttribute("result", result);

	}
	

}
