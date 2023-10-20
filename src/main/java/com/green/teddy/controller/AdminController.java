package com.green.teddy.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.teddy.dto.Car;
import com.green.teddy.dto.Help;
import com.green.teddy.service.CarService;
import com.green.teddy.service.HelpService;
import com.green.teddy.service.PageBean;

@Controller
public class AdminController {
	@Autowired
	private HelpService hs;

	@Autowired
	private CarService cs;

	@RequestMapping("admin/adminMain")
	public void adminMain() {
	}

	// 차량 관리
	@RequestMapping("admin/adminCar")
	public void adminCar(Car car, String pageNum, Model model) {
		final int ROW_PER_PAGE = 10;// 한페이지의 차량 갯수
		final int PAGE_PER_BLOCK = 10;// 한 블록의 페이지 갯수
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

	@RequestMapping("admin/insertCarForm")
	public void insertCarForm() {

	}

	@RequestMapping("admin/insertCar")
	public void insertCar(Model model, Car car, HttpSession session) throws IOException {
		String real = session.getServletContext().getRealPath("/resources/upload");
		// 표지 사진
		String c_cover_img1 = car.getC_cover_img_file().getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		String c_cover_img = uuid + c_cover_img1.substring(c_cover_img1.lastIndexOf("."));
		car.setC_cover_img(c_cover_img);
		FileOutputStream fos = new FileOutputStream(new File(real + "/" + c_cover_img));
		fos.write(car.getC_cover_img_file().getBytes());
		fos.close();
		// 사진
		String c_img1 = car.getC_img_file().getOriginalFilename();
		UUID uuid2 = UUID.randomUUID();
		String c_img = uuid2 + c_img1.substring(c_img1.lastIndexOf("."));
		car.setC_img(c_img);
		FileOutputStream fos2 = new FileOutputStream(new File(real + "/" + c_img));
		fos2.write(car.getC_img_file().getBytes());
		fos2.close();
		int result = cs.insertCar(car);
		model.addAttribute("result", result);

	}

//	영세
	@RequestMapping("admin/adminHelpList")
	public void adminHelpList(Model model, HttpSession session, String pageNum, Help help) {
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 5;
		int total = hs.adminGetTotal(help);// 전체 회원 문의 총 갯수
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		help.setStartRow(startRow);
		help.setEndRow(endRow);

		List<Help> list = hs.adminList(help); // 전체 회원 문의 리스트
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		int num = total - startRow + 1;
		String[] title = { "제목", "내용", "제목+내용" };
		model.addAttribute("title", title);
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("help", help);

	}

	@RequestMapping("admin/adminHelpView")
	public void adminHelpView(int hno, String pageNum, Model model) {
		Help help = hs.selectHelp(hno);
		System.out.println("pageNum = " + pageNum);
		model.addAttribute("help", help);
		model.addAttribute("pageNum", pageNum);
	}

	@RequestMapping("admin/adminHelpUpdateForm")
	public void adminHelpUpdateForm(Model model, int hno, String pageNum) {
		Help help = hs.selectHelp(hno);
		model.addAttribute("help", help);
		model.addAttribute("pageNum", pageNum);
	}

	@RequestMapping("admin/adminHelpUpdateResult")
	public void adminHelpUpdateResult(Help help, Model model, String pageNum, HttpSession session){
		int result = 0;
		String id = (String) session.getAttribute("id");
		result = hs.updateHelp(help);
		model.addAttribute("id", id);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
	}

	@RequestMapping("admin/adminHelpDelete")
	public void adminHelpDelete(Model model, HttpSession session, int hno, String pageNum) {
		String id = (String) session.getAttribute("id");
		int result = hs.deleteHelp(hno);
		model.addAttribute("id", id);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
	}
}
