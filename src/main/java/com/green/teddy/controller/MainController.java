package com.green.teddy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.teddy.dto.Car;
import com.green.teddy.service.CarService;

@Controller
public class MainController {
	/*@Autowired
	private CarService cs;*/
	@GetMapping("main/main")
	public void main(Car car) {
		/*List<Car> carlist = cs.carList(car);*/
	}
}
