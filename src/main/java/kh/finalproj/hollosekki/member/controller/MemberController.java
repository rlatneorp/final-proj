package kh.finalproj.hollosekki.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@RequestMapping("myPage_Main.me")
	public String myPage_Main() {
		return "myPage_Main";
	}
}
