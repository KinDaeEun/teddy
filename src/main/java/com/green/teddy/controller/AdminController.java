package com.green.teddy.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.teddy.dto.Car;
import com.green.teddy.dto.Design_img;
import com.green.teddy.dto.Help;
import com.green.teddy.dto.Member;
import com.green.teddy.dto.Notice;
import com.green.teddy.dto.Review;
import com.green.teddy.service.BoardService;
import com.green.teddy.service.CarService;
import com.green.teddy.service.Design_imgService;
import com.green.teddy.service.HelpService;
import com.green.teddy.service.MemberService;
import com.green.teddy.service.PageBean;
import com.green.teddy.service.ReviewService;

@Controller
public class AdminController {
	@Autowired
	private HelpService hs;

	@Autowired
	private CarService cs;

	@Autowired
	private Design_imgService ds;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private ReviewService res;


	@RequestMapping("admin/adminMain")
	public void adminMain() {
	}

	// 차량 관리
	@RequestMapping("admin/adminCarList")
	public void adminCar(Car car, String pageNum, Model model) {
		final int ROW_PER_PAGE = 5;// 한페이지의 차량 갯수
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
		int total = cs.adminGetTotal(car); // 총 댓글 수
		int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE); // 총 페이지 수
		// 현재페이지 - (현재페이지 - 1)%10
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;// 한 블록의 사작 페이지
		// 시작페이지 + 블록당페이지 수 -1
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		// endPage는 총페이지 보다 크면 안된다
		if (endPage > totalPage)
			endPage = totalPage;

		List<Car> carList = cs.adminCarList(car);
		String[] title = {"차량번호","이름","브랜드","차종"};

		model.addAttribute("carList", carList);
		model.addAttribute("car", car);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("title", title);
	}

	@RequestMapping("admin/adminCarInsertForm")
	public void insertCarForm() {}

	// 차량 정보및 디자인 이미지 입력
	@RequestMapping("admin/adminCarInsertResult")
	public void insertCar(Model model, Car car, HttpSession session, MultipartHttpServletRequest mhr)
			throws IOException {
		String real = session.getServletContext().getRealPath("/resources/upload");

		MultipartFile[] files = new MultipartFile[] { car.getC_cover_img_file(), car.getC_cover_img_file(),
				car.getFormt_img_file(), car.getSide_img_file() };
		for (int i = 0; i < files.length; i++) {
			MultipartFile file = files[i];

			if (!file.isEmpty()) {
				String originalFileName = file.getOriginalFilename();
				String uniqueFileName = generateUniqueFileName(originalFileName);
				FileOutputStream fos = new FileOutputStream(new File(real + "/" + uniqueFileName));
				fos.write(file.getBytes());
				fos.close();

				if (i == 0) {
					car.setC_cover_img(uniqueFileName);
				} else if (i == 1) {
					car.setC_img(uniqueFileName);
				} else if (i == 2) {
					car.setFormt_img(uniqueFileName);
				} else if (i == 3) {
					car.setSide_img(uniqueFileName);
				}
			}
		}

		List<MultipartFile> imgs = mhr.getFiles("img_file");
		List<Design_img> design_img = new ArrayList<Design_img>();

		// 방금 입력한 차량 번호를 조회
		int cno = cs.getMaxCno();

		for (MultipartFile mf : imgs) {
			Design_img di = new Design_img();
			String originalFileName = mf.getOriginalFilename();
			String uniqueFileName = generateUniqueFileName(originalFileName);
			di.setImg_name(uniqueFileName);
			di.setCno(cno);
			design_img.add(di);
			// 사진 저장
			FileOutputStream fos = new FileOutputStream(new File(real + "/" + uniqueFileName));
			fos.write(mf.getBytes());
			fos.close();
		}

		int carResult = cs.insertCar(car);
		int designResult = ds.insertImg(design_img);
		int result = 0;
		if (carResult != 0 && designResult != 0) {
			result = 1;
		}
		model.addAttribute("result", result);
	}

	// UUID생성
	private String generateUniqueFileName(String originalFileName) {
		UUID uuid = UUID.randomUUID();
		return uuid + originalFileName.substring(originalFileName.lastIndexOf("."));
	}
	
	@RequestMapping("admin/adminCarUpdateForm")
	public void adminCarUpdateForm(Model model, int cno) {
		Car car = cs.selectCar(cno);
		model.addAttribute("car",car);
	}
	
	@RequestMapping("admin/adminCarUpdateResult")
	public void adminCarUpdateResult(Model model, Car car, HttpServletRequest request) {
		int result = cs.updateCar(car);
		String referer = request.getHeader("Referer");
		model.addAttribute("referer",referer);
		model.addAttribute("result",result);
	}
	
	@RequestMapping("admin/adminCarDelete")
	public void adminCarDelete(Model model, Car car, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		System.out.println(referer);
		String c_del = "";
		if(car.getC_del().equals("y")) {
			c_del="n";
		}
		if(car.getC_del().equals("n")) {
			c_del="y";
		}
		car.setC_del(c_del);
		int result = cs.deleteCar(car);
		
		model.addAttribute("result",result);
		model.addAttribute("referer",referer);
	}
	
	@RequestMapping("admin/adminReviewList")
	public void adminReviewList(Model model, Review review, String pageNum) {
		final int ROW_PER_PAGE = 10;// 한페이지의 차량 갯수
		final int PAGE_PER_BLOCK = 5;// 한 블록의 페이지 갯수
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);// 페이지 번호

		// 시작번호 (페이지번호 - 1) * 페이지당 갯수+ 1
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;// 해당 페이지의 첫 댓글
		// 끝번호 시작번호 + 페이지당개수 - 1
		int endRow = startRow + ROW_PER_PAGE - 1;
		review.setStartRow(startRow);
		review.setEndRow(endRow);
		int total = res.adminGetTotal(review); // 총 댓글 수
		int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE); // 총 페이지 수
		// 현재페이지 - (현재페이지 - 1)%10
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;// 한 블록의 사작 페이지
		// 시작페이지 + 블록당페이지 수 -1
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		// endPage는 총페이지 보다 크면 안된다
		if (endPage > totalPage)
			endPage = totalPage;
		
		List<Review> reviewList = res.adminReviewList(review);
		String[] title = {"리뷰번호","작성자"};
		Car car = cs.selectCar(review.getCno());
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("review", review);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("title", title);
		model.addAttribute("c_name",car.getC_name());
	}
	
	@RequestMapping("admin/adminReviewDelete")
	public void adminReviewDelete(Model model, Review review, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		String re_del = "";
		if(review.getRe_del().equals("y")) {
			re_del="n";
		}
		if(review.getRe_del().equals("n")) {
			re_del="y";
		}
		review.setRe_del(re_del);
		int result = res.deleteReview(review);
		model.addAttribute("result",result);
		model.addAttribute("referer",referer);
	}
	
	@RequestMapping("admin/adminReviewContent")
	public void adminReviewContent(Model model, int re_no) {
		Review review = res.selectReview(re_no);
		model.addAttribute("review",review);
	}
	
	@RequestMapping("admin/adminCarImgList")
	public void adminImgList(Model model, int cno) {
		List<Design_img> imgList = ds.imgList(cno);
		model.addAttribute("imgList",imgList);
	}
	
	@RequestMapping("admin/adminCarImgDelete" )
	public void adminCarImgDelete(Model model, Integer[] Dno, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		int result = 0;
		for(int dno:Dno) {
			result = ds.deleteImg(dno);
		}
		model.addAttribute("result",result);
		model.addAttribute("referer",referer);
	}
	

	// 1:1문의 리스트
	@RequestMapping("admin/adminHelpList")
	public void adminHelpList(Model model, HttpSession session, String pageNum, Help help) {
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;
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

	// 회원 문의 내용
	@RequestMapping("admin/adminHelpView")
	public void adminHelpView(int hno, String pageNum, Model model) {
		Help help = hs.selectHelp(hno);
		System.out.println("pageNum = " + pageNum);
		model.addAttribute("help", help);
		model.addAttribute("pageNum", pageNum);
	}

	// 문의 내용 답변 폼
	@RequestMapping("admin/adminHelpInsertForm")
	public void adminHelpUpdateForm(Model model, int hno, String pageNum) {
		Help help = hs.selectHelp(hno);
		model.addAttribute("help", help);
		model.addAttribute("pageNum", pageNum);
	}

	// 문의 내용 답변 처리
	@RequestMapping("admin/adminHelpInsertResult")
	public void adminHelpUpdateResult(Help help, Model model, String pageNum, HttpSession session) {
		int result = 0;
		String id = (String) session.getAttribute("id");
		result = hs.updateHelp(help);
		model.addAttribute("id", id);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
	}

	// 문의 내용 삭제
	@RequestMapping("admin/adminHelpDelete")
	public void adminHelpDelete(Model model, HttpSession session, int hno, String pageNum) {
		String id = (String) session.getAttribute("id");
		int result = hs.deleteHelp(hno);
		model.addAttribute("id", id);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
	}

	// 관리자 회원 리스트
	@RequestMapping("admin/adminMemberList")
	public void adminMemberList(Model model, String pageNum, Member member) {
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int rowPerPage = 10;
		int total = ms.adminMbTotal(member);// 전체 회원 수
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		member.setStartRow(startRow);
		member.setEndRow(endRow);
		List<Member> mbList = ms.mbList(member);// 회원목록
		// int num = total - startRow + 1;
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		String[] title = { "아이디", "이름", "성별", "삭제여부" };
		model.addAttribute("total", total);
		model.addAttribute("title", title);
		// model.addAttribute("num", num);
		model.addAttribute("mbList", mbList);
		model.addAttribute("pb", pb);
		model.addAttribute("pageNum", pageNum);
	}

	// 관리자 회원 상세정보보기
	@RequestMapping("admin/adminMemberView")
	public void adminMemberView(String id, int pageNum, Model model) {
		Member member = ms.select(id);
		model.addAttribute("member", member);
		model.addAttribute("pageNum", pageNum);
	}

	// 관리자 회원 삭제
	@RequestMapping("admin/adminMemberDelete")
	public void adminMemberDelete(String id, String pageNum, Model model) {
		Member member = ms.select(id);
		int result = ms.deleteAdmin(member.getId());
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
	}
	// 게시판 관리
	@GetMapping("adminBoard/adminBoard_memu")
	public void adminBoard_memu() {
	}
	@GetMapping("adminBoard/adminNotice")
	public void adminNotice() {

	}
	
}
