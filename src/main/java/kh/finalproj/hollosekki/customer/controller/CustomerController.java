package kh.finalproj.hollosekki.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproj.hollosekki.common.model.Pagination;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.customer.model.service.CustomerService;
import kh.finalproj.hollosekki.customer.model.vo.Customer;
import kh.finalproj.hollosekki.enroll.model.vo.Users;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService csService;
//	
//	@RequestMapping("nBoard.cs")
//	public String askBoard() {
//		return "askBoard";
//	}
	
	@RequestMapping("askBoard.cs")
	public ModelAndView nBoard(HttpSession session, @RequestParam(value="page", required=false) Integer currentPage,
			 @ModelAttribute Customer customer, ModelAndView mv) {
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
		int listCount = 0;
		if(faqType == 1 || faqType == null) {
			listCount = csService.getNListCount(1);
		} else if(faqType == 2) {
			listCount = csService.getFListCount(2);
		} else if(faqType == 3 && usersNo != 0) {
			listCount = csService.getPListCount(map);
		}
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<Customer> nlist = csService.nBoardList(pi);
		ArrayList<Customer> flist = csService.fBoardList(pi);
		ArrayList<Customer> plist = csService.pBoardList(pi, map);
		
		mv.addObject("nlist", nlist);
		mv.addObject("flist", flist);
		mv.addObject("plist", plist);
		mv.addObject("pi", pi);
		mv.setViewName("askBoard");
		System.out.println(pi);
		return mv;
		
//		
//		response.setContentType("application/json; charset=UTF-8"); 
//		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
//		Gson gson = gb.create();
//		String json = gson.toJson(nlist);
//		try {
//			response.getWriter().write(json);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		 
    }
	    
		
//	@RequestMapping("fBoard.cs")
//	public void fBoard(HttpSession session, @RequestParam(value="page", required=false) Integer currentPage
//			,Model model, @ModelAttribute Customer customer,HttpServletResponse response) {
//		Users u = (Users)session.getAttribute("loginUser");
//		if(currentPage == null) {
//			currentPage = 1;
//		}
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("u", u);
//		map.put("c", customer);
//		
//		int listCount = csService.getListCount(map);
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
//		map.put("pi", pi);
//		ArrayList<Customer> flist = csService.fBoardList(pi, map);
//		response.setContentType("application/json; charset=UTF-8"); 
//		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
//		Gson gson = gb.create();
//		String json = gson.toJson(flist);
//		try {
//			response.getWriter().write(json);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		model.addAttribute("flist", flist);
//		model.addAttribute("pi", pi);
//		
//	}
//	@RequestMapping("pBoard.cs")
//	public void pBoard(HttpSession session, @RequestParam(value="page", required=false) Integer currentPage
//			,Model model, @ModelAttribute Customer customer,HttpServletResponse response) {
//		Users u = (Users)session.getAttribute("loginUser");
//		int usersNo = 0;
//		if(currentPage == null) {
//			currentPage = 1;
//		}
//		if(u != null) {
//			usersNo = u.getUsersNo();
//		}
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("usersNo", usersNo);
//		map.put("c", customer);
//		
//		int listCount = csService.getListCount(map);
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
//		map.put("pi", pi);
//		ArrayList<Customer> plist = csService.pBoardList(pi, map);
//		response.setContentType("application/json; charset=UTF-8"); 
//		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
//		Gson gson = gb.create();
//		String json = gson.toJson(plist);
//		try {
//			response.getWriter().write(json);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		model.addAttribute("plist", plist);
//		model.addAttribute("pi", pi);
//		
//	}

	
}
