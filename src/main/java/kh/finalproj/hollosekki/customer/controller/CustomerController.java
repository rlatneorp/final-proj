package kh.finalproj.hollosekki.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.finalproj.hollosekki.common.model.Pagination;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.customer.exception.CustomerException;
import kh.finalproj.hollosekki.customer.model.service.CustomerService;
import kh.finalproj.hollosekki.customer.model.vo.Customer;
import kh.finalproj.hollosekki.enroll.model.vo.Users;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService csService;
	
	@RequestMapping("askBoard.cs")
	public String askBoard(HttpSession session, @RequestParam(value="page", required=false) Integer currentPage,
			@RequestParam(value="uNo", required=false) Integer uNo,
			@RequestParam(value="bType", required=false) Integer bType, Model model, @ModelAttribute Customer customer) {
		Users u = (Users)session.getAttribute("loginUser");
		System.out.println(bType);
		
		if(currentPage == null) {
			currentPage = 1;
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bType", bType);
		map.put("uNo", uNo);
		map.put("u", u);
		int listCount = csService.getListCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		map.put("pi", pi);
		ArrayList<Customer> list = csService.faqBoardList(pi, map);
		System.out.println(list);
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("bType", bType);
			return "askBoard";
		} else {
			throw new CustomerException("게시글 조회에 실패하였습니다.");
		}
		
	}

	
}
