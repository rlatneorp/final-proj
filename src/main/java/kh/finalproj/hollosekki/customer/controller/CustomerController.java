package kh.finalproj.hollosekki.customer.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import kh.finalproj.hollosekki.common.Pagination;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.customer.model.service.CustomerService;
import kh.finalproj.hollosekki.customer.model.vo.Customer;
import kh.finalproj.hollosekki.customer.model.vo.Qna;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Orders;

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
		model.addAttribute("nlist", nlist);
		model.addAttribute("pi", pi);
		
		return "noticeBoard";
	}	
	
	@RequestMapping("faqBoard.cs")
	public String faqBoard(@RequestParam(value="category", required=false) String category,@RequestParam(value="search", required=false) String search, HttpSession session, @RequestParam(value="page", required=false) Integer currentPage,
			Model model) {
		if(currentPage == null) {
			
			currentPage = 1;
		}
		
//		int categoryAndSearchCount = csService.getFListCount(category);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("search", search);
		
		int	listCount = csService.getCategoryFListCount(map);
//		System.out.println("category " + category);
//		System.out.println("search " + search);
//		System.out.println("count " + listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
//		System.out.println("p "  + pi);

		ArrayList<Customer> flist = csService.fBoardList(pi, map);
//		System.out.println("f " + flist);
		model.addAttribute("flist", flist);
		model.addAttribute("pi", pi);
		model.addAttribute("category", category);
		model.addAttribute("search", search);
		
		return "faqBoard";
	}	
	
	@RequestMapping("personalBoard.cs")
	public String personalBoard(HttpSession session, @RequestParam(value="page", required=false) Integer currentPage,
			Model model) {
		Users u = (Users)session.getAttribute("loginUser");
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int usersNo = 0;
		if(u != null) {
			usersNo = u.getUsersNo();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("usersNo", usersNo);
		
		int	listCount = csService.getPListCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		
		
		ArrayList<Customer> plist = csService.pBoardList(pi, map);
		
		model.addAttribute("plist", plist);
		model.addAttribute("pi", pi);
		
		return "personalBoard";
	}
	
	@RequestMapping("personalQuestion.cs")
	public String personalQuestion(HttpSession session, @ModelAttribute Qna q, @ModelAttribute Orders o, Model model) {
		Users u = (Users)session.getAttribute("loginUser");
		int usersNo = 0;
//		int adminNo = 0;
		if(u != null) {
			usersNo = u.getUsersNo();
//			if(u.getIsAdmin().equals('Y')) {
//				adminNo = u.getUsersNo();
//			} else {
//				adminNo = 0;
//			}
		}
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(q.getQnaContent() != null) {
			map.put("qnaContent", q.getQnaContent());
			map.put("qnaTitle", q.getQnaTitle());
			map.put("usersNo", usersNo);
			map.put("qnaType", q.getQnaType());
//			map.put("adminNO", adminNo);
			if(q.getOrderNo() > 0) {
				int result2 = csService.qnaProduct(map);
				return "redirect:personalBoard.cs";
			}else {
				int result1 = csService.qnaInsert(map);
				if(result1 > 0) {
					return "redirect:personalBoard.cs";
				}
			}
			
		}
		return "personalQuestion";
	}
			
			
	
	@RequestMapping("qnaProductNo.cs")
	public void qnaProductNo(@ModelAttribute Orders o,HttpServletResponse response) {
		
		ArrayList<Orders> list = csService.selectQnaProduct(o);
			
	    response.setContentType("application/json; charset=UTF-8"); 
	  
	    GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
	    Gson gson = gb.create();
	    try {
	       gson.toJson(list, response.getWriter());
	    } catch (JsonIOException | IOException e) {
	       e.printStackTrace();
	    }
	      
	}
	
	
}

