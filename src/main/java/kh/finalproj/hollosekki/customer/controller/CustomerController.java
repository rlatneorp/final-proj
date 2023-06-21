package kh.finalproj.hollosekki.customer.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.tag.common.fmt.FormatDateSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.finalproj.hollosekki.common.model.Pagination;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.customer.model.service.CustomerService;
import kh.finalproj.hollosekki.customer.model.vo.Customer;
import kh.finalproj.hollosekki.enroll.model.vo.Users;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService csService;
	
	@RequestMapping("noticeBoard.cs")
	public String nBoard(HttpSession session, @RequestParam(value="page", required=false) Integer currentPage,
			 Model model) {
		if(currentPage == null) {
			currentPage = 1;
		}
		int listCount = csService.getNListCount(1);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<Customer> nlist = csService.nBoardList(pi);
		
		
//		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy≥‚MMø˘dd¿œ");
//		 
		
		model.addAttribute("nlist", nlist);
		model.addAttribute("pi", pi);
		
		return "noticeBoard";
	}	
	
	@RequestMapping("faqBoard.cs")
	public String faqBoard(HttpSession session, @RequestParam(value="page", required=false) Integer currentPage,
			Model model) {
		if(currentPage == null) {
			currentPage = 1;
		}
			
		int	listCount = csService.getFListCount(2);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<Customer> flist = csService.fBoardList(pi);
		
		model.addAttribute("flist", flist);
		model.addAttribute("pi", pi);
		
		return "faqBoard";
	}	
	
	@RequestMapping("personalBoard.cs")
	public String personalBoard(HttpSession session, @RequestParam(value="page", required=false) Integer currentPage,
			@ModelAttribute Customer customer, Model model) {
		Users u = (Users)session.getAttribute("loginUser");
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int usersNo = 0;
		if(u != null) {
			usersNo = u.getUsersNo();
		}
		Integer faqType = 0;
		if(customer != null) {
			faqType = customer.getFaqType();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("usersNo", usersNo);
		map.put("faqType", faqType);
		
		int	listCount = csService.getPListCount(3, map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		
		ArrayList<Customer> plist = csService.pBoardList(pi, map);
		
		model.addAttribute("plist", plist);
		model.addAttribute("pi", pi);
		
		return "personalBoard";
	}
	
	@RequestMapping("personalQuestion.cs")
	public String personalQuestion() {
		return "personalQuestion";
	}
}

