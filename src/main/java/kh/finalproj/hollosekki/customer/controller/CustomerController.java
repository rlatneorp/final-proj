package kh.finalproj.hollosekki.customer.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.finalproj.hollosekki.common.model.Pagination;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.customer.model.service.CustomerService;
import kh.finalproj.hollosekki.customer.model.vo.Customer;
import kh.finalproj.hollosekki.enroll.model.vo.Users;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService csService;
	
	@RequestMapping("askBoard.cs")
	public String askBoard() {
		return "askBoard";
	}
	
	@RequestMapping("nBoard.cs")
	public void nBoard(HttpSession session, @RequestParam(value="page", required=false) Integer currentPage
			,@ModelAttribute Customer customer,HttpServletResponse response) {
		Users u = (Users)session.getAttribute("loginUser");
		int usersNo = 0;
		if(currentPage == null) {
			currentPage = 1;
		}
		
		if(u != null) {
			usersNo = u.getUsersNo();
		}
		int faqType = 0;
		System.out.println(customer);
		if(customer != null) {
			faqType = customer.getFaqType();
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("usersNo", usersNo);
		map.put("faqType", faqType);
		int listCount = csService.getListCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		map.put("pi", pi);
		
		ArrayList<Customer> nlist = csService.nBoardList(pi, map);
		System.out.println(nlist);
		response.setContentType("application/json; charset=UTF-8"); 
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
		Gson gson = gb.create();
		String json = gson.toJson(nlist);
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
		 
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
