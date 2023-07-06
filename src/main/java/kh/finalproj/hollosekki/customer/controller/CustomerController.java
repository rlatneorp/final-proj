package kh.finalproj.hollosekki.customer.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("search", search);
		
		int	listCount = csService.getCategoryFListCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);

		ArrayList<Customer> flist = csService.fBoardList(pi, map);
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
		
		
//		ArrayList<Customer> plist = csService.pBoardList(pi, map);
		ArrayList<Qna> qlist = csService.qBoardList(pi, map);
		System.out.println(qlist);
//		model.addAttribute("plist", plist);
		model.addAttribute("qlist", qlist);
		model.addAttribute("pi", pi);
		
		return "personalBoard";
	}
	
	@RequestMapping("personalQuestion.cs")
	public String personalQuestion(HttpSession session, 
			@RequestParam(value="qnaContent",required=false) String qnaContent,
			@RequestParam(value="qnaTitle",required=false) String qnaTitle, 
			@RequestParam(value="usersNo",required=false) Integer usersNo, 
			@RequestParam(value="qnaType",required=false) Integer qnaType,
			@RequestParam(value="orderNo",required=false) Integer orderNo,
			Model model) {
		Users u = (Users)session.getAttribute("loginUser");
//		int adminNo = 0;
		if(u != null) {
			usersNo = u.getUsersNo();
//			if(u.getIsAdmin().equals('Y')) {
//				adminNo = u.getUsersNo();
//			} else {
//				adminNo = 0;
//			}
		}
		
		if(qnaContent != null) {
			
			HashMap<Object, Object> map = new HashMap<Object, Object>();
			map.put("qnaContent", qnaContent);
			map.put("qnaTitle", qnaTitle);
			map.put("usersNo", usersNo);
			map.put("qnaType", qnaType);
			map.put("orderNo", orderNo);
			if(orderNo == null) {
				int result2 = csService.qnaInsert(map);
				if(result2 > 0) {
					return "redirect:personalBoard.cs";
				}
			}else if(orderNo != null){
				int result1 = csService.qnaProduct(map);
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
	@RequestMapping("qnaType.cs")
	public void qnaType(@RequestParam(value="usersNo",required=false) Integer usersNo, 
			@RequestParam(value="qnaNo",required=false) Integer qnaNo, HttpServletResponse response) {
		
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("usersNo", usersNo);
		map.put("qnaNo", qnaNo);
		
		
		response.setContentType("application/json; charset=UTF-8"); 
		
		ArrayList<Qna> olist = csService.qnaType(map);
		System.out.println(olist);
		  
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
		Gson gson = gb.create();
		try {
		    gson.toJson(olist, response.getWriter());
		} catch (JsonIOException | IOException e) {
		    e.printStackTrace();
		    }
		      
	    }
	
	
}

