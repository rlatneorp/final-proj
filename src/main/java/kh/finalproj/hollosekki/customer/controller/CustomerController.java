package kh.finalproj.hollosekki.customer.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.finalproj.hollosekki.common.model.Pagination;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.customer.exception.CustomerException;
import kh.finalproj.hollosekki.customer.model.service.CustomerService;
import kh.finalproj.hollosekki.customer.model.vo.Customer;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService csService;
	
	@RequestMapping("askBoard.cs")
	public String noticeBoardList(@RequestParam(value="page", required=false) Integer currentPage, Model model) {
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int nlistCount = csService.getListCount(0);
		int alistCount = csService.getListCount(1);
		PageInfo npi = Pagination.getPageInfo(currentPage, nlistCount, 5);
		PageInfo api = Pagination.getPageInfo(currentPage, alistCount, 5);
		ArrayList<Customer> nlist = csService.noticeBoardList(npi);
		ArrayList<Customer> alist = csService.faqBoardList(api);
		
		
		if(nlist != null) {
			model.addAttribute("nlist", nlist);
			model.addAttribute("alist", alist);
			model.addAttribute("npi", npi);
			model.addAttribute("api", api);
			return "askBoard";
		} else {
			throw new CustomerException("게시글 조회에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("personalQuestion.cs")
	public String personalQuestion(@RequestParam(value="page", required=false) Integer currentPage, Model model) {
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int listCount = csService.getListCount(2);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<Customer> flist = csService.personalQuestion(pi);
		
		if(flist != null) {
			model.addAttribute("flist", flist);
			model.addAttribute("pi", pi);
			return "askBoard";
		} else {
			throw new CustomerException("게시글 조회에 실패하였습니다.");
		}
	}
	
	
}
