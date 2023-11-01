package com.green.teddy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.teddy.dto.Car;

import com.green.teddy.dto.Design_img;
import com.green.teddy.service.CarService;
import com.green.teddy.service.PageBean;
import com.green.teddy.service.Design_imgService;

import com.green.teddy.dto.Review;
import com.green.teddy.service.ReviewService;

@Controller
public class CarController {
	@Autowired
	private CarService cs;

	@Autowired
	private Design_imgService ds;

	@Autowired
	private ReviewService res;

	@GetMapping("car/findCenter")
	public void findCenter() {

	}

	@GetMapping("car/carForm")
	public void carForm(Car car, String pageNum, Model model) {

		final int ROW_PER_PAGE = 6;// 한페이지의 차량 갯수
		final int PAGE_PER_BLOCK = 5;// 한 블록의 페이지 갯수
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);// 페이지 번호

		// 시작번호 (페이지번호 - 1) * 페이지당 갯수+ 1
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;// 해당 페이지의 첫 댓글
		// 끝번호 시작번호 + 페이지당개수 - 1
		int endRow = startRow + ROW_PER_PAGE - 1;
		car.setStartRow(startRow);
		car.setEndRow(endRow);
		int total = cs.getTotal(car); // 총 댓글 수
		int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE); // 총 페이지 수
		// 현재페이지 - (현재페이지 - 1)%10
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;// 한 블록의 사작 페이지
		// 시작페이지 + 블록당페이지 수 -1
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		// endPage는 총페이지 보다 크면 안된다
		if (endPage > totalPage)
			endPage = totalPage;
		
		List<Car> carList = cs.carList(car);

		model.addAttribute("carList", carList);
		model.addAttribute("car", car);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		model.addAttribute("currentPage", currentPage);

	}

	@RequestMapping("car/carView")
	public void carview(Model model, int cno, String pageNum, HttpSession session) {
		Car car = cs.selectCar(cno);

		String id = (String) session.getAttribute("id");
		
		// paging
		Review review = new Review();
		if ( pageNum == null || pageNum.equals("") )
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 3;
		int pagePerBlock = 5;
		review.setId(id);
		review.setCno(cno);
		int startRow = ( currentPage - 1 ) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		review.setStartRow(startRow);
		review.setEndRow(endRow);
		
		int total = res.getTotal(cno);
		int totalPage = (int) Math.ceil((double) total / rowPerPage); // 총 페이지 수
		int startPage = currentPage - (currentPage - 1) % rowPerPage;// 한 블록의 사작 페이지
		int endPage = startPage + pagePerBlock - 1;
		
		if (endPage > totalPage)
			endPage = totalPage;
		List<Design_img> imgList = ds.imgList(cno);
		
		
		List<Review> reviewList = res.reviewList(review);
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		int num = total - startRow + 1;
		
		float rateAvg = res.rateAvg(cno);
		
		model.addAttribute("pb", pb);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("num", num);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("car", car);
		model.addAttribute("total", total);
		model.addAttribute("rateAvg", rateAvg);
		model.addAttribute("car", car);
		model.addAttribute("imgList", imgList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("cno", cno);


	}

}
