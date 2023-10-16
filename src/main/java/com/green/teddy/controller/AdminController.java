package com.green.teddy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.teddy.dto.Car;
import com.green.teddy.service.CarService;

@Controller
public class AdminController {
	
	@Autowired
	private CarService cs;
	
	
	@RequestMapping("admin/adminMain")
	public void adminMain() {
	}
	
	//차량 관리
	@RequestMapping("admin/adminCar")
	public void adminCar(Car car,String pageNum, Model model) {
		final int ROW_PER_PAGE = 10;//한페이지의 차량 갯수
		final int PAGE_PER_BLOCK = 10;//한 블록의 페이지 갯수
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);//페이지 번호

		//	시작번호	(페이지번호 - 1) * 페이지당 갯수+ 1				
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;//해당 페이지의 첫 댓글
		//  끝번호 	시작번호 + 페이지당개수 - 1			
		int endRow = startRow + ROW_PER_PAGE - 1;
		car.setStartRow(startRow);
		car.setEndRow(endRow);
		int total = cs.getTotal(car); //총 댓글 수
		int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE); //총 페이지 수
		//	현재페이지 - (현재페이지 - 1)%10
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;//한 블록의 사작 페이지
		//	시작페이지 + 블록당페이지 수 -1
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		//  endPage는 총페이지 보다 크면 안된다	
		if (endPage > totalPage)
			endPage = totalPage;
	
		List<Car> carList = cs.carList(car);
		
		model.addAttribute("carList",carList);
		model.addAttribute("car",car);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("PAGE_PER_BLOCK",PAGE_PER_BLOCK);
		model.addAttribute("currentPage",currentPage);
	}
	
	@RequestMapping("admin/insertCarForm")
	public void insertCarForm() {
		
	}
	
}
