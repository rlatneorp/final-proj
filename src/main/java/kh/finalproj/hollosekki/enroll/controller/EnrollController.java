package kh.finalproj.hollosekki.enroll.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kh.finalproj.hollosekki.board.model.vo.Board;
import kh.finalproj.hollosekki.common.model.vo.BookMark;
import kh.finalproj.hollosekki.common.model.vo.Follow;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.Product;
import kh.finalproj.hollosekki.enroll.model.exception.EnrollException;
import kh.finalproj.hollosekki.enroll.model.service.EnrollService;
import kh.finalproj.hollosekki.enroll.model.vo.SocialLogin;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Review;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;
import kh.finalproj.hollosekki.users.model.service.UsersService;


@SessionAttributes({"loginUser", "socialUser"})
@Controller
public class EnrollController {
		

		@Autowired
		private BCryptPasswordEncoder bcrypt;
		
		@Autowired
		private EnrollService eService;
		
		@Autowired
		private UsersService uService;
		
		@Autowired
		private JavaMailSender mailSender;

		@RequestMapping("join.en")
		public String join() {
			return "join";
		}
		
//		@RequestMapping("insertUser.en")
//		public String insertUser(@ModelAttribute Users u) {
//			
//			String userPwd = bcrypt.encode(u.getUsersPw());
//			u.setUsersPw(userPwd);
//			
//			int result = eService.insertUser(u);
//			if(result > 0) {
//				return "redirect:login.en";
//			} else {
//				return "회원가입실패...페이지 만드나? 아님 exception?";
//			}
//		}
		
		@RequestMapping("insertUser.en")
		@ResponseBody
		public void insertUser(@ModelAttribute Users u, PrintWriter out) {
			
			String userPwd = bcrypt.encode(u.getUsersPw());
			u.setUsersPw(userPwd);
			
			int count = eService.insertUser(u);
			String result = count > 0 ? "yes" : "no";
			out.print(result);
		}
		
		@RequestMapping("login.en")
		public String login() {
			return "login";
		}
		
		@RequestMapping("loginCheck.en")
		public String loginCheck(@ModelAttribute Users u, Model model) {
			
			Users loginUser = eService.login(u);
			if(loginUser == null) {
				int num = 1;
				model.addAttribute("login", num);
				return "loginfalse";
			} else {
				if(bcrypt.matches(u.getUsersPw(), loginUser.getUsersPw())) {
					model.addAttribute("loginUser", loginUser);
					return "redirect:home.do";
				} else {
					return "loginfalse";
				}
			}
		}
		
		@RequestMapping("checkId.en")
		public void checkId(@RequestParam("id") String id, PrintWriter out) {
			
			int count = (int)eService.checkId(id);
			
			String result = count == 0 ? "yes" : "no";
			out.print(result);
		}
		
		@RequestMapping("checkNickName.en")
		public void checkNickName(@RequestParam("nickName") String nickName, PrintWriter out) {
			
			int count = (int)eService.checkNickName(nickName);
			String result = count == 0 ? "yes" : "no";
			out.print(result);
		}
		
		@RequestMapping("checkEmail.en")
		public void checkEmail(@RequestParam("email") String email, PrintWriter out) {
			
			int count = (int)eService.checkEmail(email);
			String result = count == 0 ? "yes" : "no";
			out.print(result);
		}
		
		@RequestMapping("logout.en")
		public String logout(SessionStatus status) {
			status.setComplete();
			return "redirect:home.do";
		}
		
		@RequestMapping("findId.en")
		public String findId(){
			
			return "findId";
		}
		
		@RequestMapping("findIdResult.en")
		public String findIdResult(@RequestParam("name") String name, @RequestParam("email") String email, Model model) {
			
			Users result = eService.findIdResult(name, email);
			
			if(result != null) {
				
				model.addAttribute("usersInfo", result);
				
				return "findIdResult";
			} else {
				throw new EnrollException("아이디찾기에 실패했습니다.");
			}
		}
		
		@RequestMapping("findPwd.en")
		public String findPwd() {
			return "findPwd";
		}
		
		@ResponseBody
		@RequestMapping("findPwdCheck.en")
		public String findPwdcheck(@RequestParam("id") String id, @RequestParam("email") String email, Model model) {
			
			int result = eService.findPwdCheck(id, email);
			
			if(result > 0) { // 아이디랑 메일주소 일치할때만 메일 발송
				model.addAttribute("id", id);
				Random random = new Random();
				int checkNum = random.nextInt(888888) + 111111;
				
				String setFrom = "hollosekki@gmail.com";
				String toMail = email;
				String title = "본인인증 이메일 입니다.";
		        String content = 
		        		"<br>" + 
		                "홀로세끼를 방문해주셔서 감사합니다." +
		                "<br>" + 
		                "본인인증 이후 비밀번호를 재설정 합니다." +
		                "<br><br>" + 
		                "인증 번호는 " + checkNum + " 입니다." + 
		                "<br>" + 
		                "해당 인증번호를 인증번호 확인란에 기입하여 주세요." +
		                "<br>";
		       
		        try {
		        	MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
					helper.setFrom(setFrom);
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content,true);
		            mailSender.send(message);
				} catch (MessagingException e) {
					e.printStackTrace();
				}
		        
		        return Integer.toString(checkNum);
			} else {
				return "0";
			}
		}
		
		@RequestMapping("updatePwd.en")
		public String updatePwd(@RequestParam("id") String id, Model model) {
			model.addAttribute("id", id);
			
			return "updatePwd";
		}
		
		@RequestMapping("updatePwdResult.en")
		public String updatePwdResult(@RequestParam("id") String id, @RequestParam("pwd") String pwd) {
			
			String usersPwd = bcrypt.encode(pwd);
			
			int result = eService.updatePwdResult(id, usersPwd);
			
			if(result > 0) {
				return "updatePwdFinish";
			} else {
				throw new EnrollException("비밀번호 재설정에 실패했습니다.");
			}
		}
		
		@RequestMapping("kakaoLogin.en")
		public void kakaoLogin(HttpServletRequest request, HttpServletResponse response, Model model){
			String id = request.getParameter("id");					// 2827339121
			String name = request.getParameter("name");				// 정흠
			String email = request.getParameter("email");			// sk6522@hanmail.net
			String profileImg = request.getParameter("profileImg");	// http://k.kakaocdn.net/dn/KMVzH/btrOQyPkSGp/6psjYBhYIgREkghu0yVwK0/img_640x640.jpg
		        
			SocialLogin sl = eService.SocialLogin(id);
			
			if(sl == null) { // 회원 아닐경우 -> 새로 등록
				SocialLogin sl2 = new SocialLogin(); // kakaoLogin 테이블에 저장 -> 안해도되나? 이미지주소만 저장하면 될듯
				sl2.setSocialId(id);
				sl2.setSocialProfileImg(profileImg);
		        	
				eService.socialInsertUser(sl2); // 카톡프사이미지 가져올때 쓸 것
				
	        	Users u = new Users();
	        	u.setUsersId(id);
	        	u.setUsersPw("카카오로그인 회원입니다");
	        	u.setUsersName(name);
	        	u.setNickName(name);
	        	
	        	if(email != null) {
	        		u.setEmail(email);
	        	} else {
	        		u.setEmail("카카오로그인 회원입니다");
	        	}
	        	u.setPhone("카카오로그인 회원입니다");
		        
		        int result = eService.insertUser(u);
		        		
	        	if(result > 0) { // 회원정보 저장했을때 
	        		Users u2 = eService.socialLoginUpdate(id);
	        		
		        	model.addAttribute("socialUser", sl2);
	        		model.addAttribute("loginUser", u2);
	        		
	        	} else { // 회원정보 저장 실패
	        	}
	        } else { // 기존 회원일 경우 -> 불러오기 (프사랑 닉넴 업뎃해서 가져와야함)
	        	String nickName = name;
				eService.socialInfoUpdate(id, profileImg); // 프사이미지 업데이트
				eService.socialInfoUpdate2(id, name, nickName); // 이름, 닉넴 업데이트
				
				SocialLogin sl2 = eService.SocialLogin(id); // 업데이트된거 새로 불러옴
	        	Users u2 = eService.socialLoginUpdate(id); // 업테이트된거 새로 불러옴
	        	
	        	
	        	model.addAttribute("socialUser", sl2);
	        	model.addAttribute("loginUser", u2);
	        }
		}
		
		@RequestMapping("naverLogin.en")
		public String naverLogin(HttpServletRequest request, Model model) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String nickName = request.getParameter("nickName");
			String email = request.getParameter("email");
			String profileImg = request.getParameter("profileImg");
			
			SocialLogin sl = eService.SocialLogin(id);
			
			if(sl == null) { // 회원 아닐경우 -> 새로 등록
				SocialLogin sl2 = new SocialLogin();
				sl2.setSocialId(id);
				sl2.setSocialProfileImg(profileImg);
				
				eService.socialInsertUser(sl2);
				
				Users u = new Users();
				u.setUsersId(id);
				u.setUsersPw("네이버로그인 회원입니다");
				u.setUsersName(name);
				u.setNickName(nickName);
				
				if(email != null) {
	        		u.setEmail(email);
	        	} else {
	        		u.setEmail("네이버로그인 회원입니다");
	        	}
				u.setPhone("네이버로그인 회원입니다");
				
				int result = eService.insertUser(u);
				
				if(result > 0) { // 등록 잘 된 경우
					Users u2 = eService.socialLoginUpdate(id);
					
					model.addAttribute("socialUser", sl2);
					model.addAttribute("loginUser", u2);
					
					return "redirect:home.do";
				} else { // 등록 안된경우
					throw new EnrollException("네이버 간편로그인 사용자 등록에 실패했습니다.");
				}
			} else { // 기존 회원일경우 -> 불러오기
				eService.socialInfoUpdate(id, profileImg); // 프사이미지 업데이트
				eService.socialInfoUpdate2(id, name, nickName); // 이름, 닉넴 업데이트
				
				SocialLogin sl2 = eService.SocialLogin(id); // 업데이트된거 새로 불러옴
	        	Users u2 = eService.socialLoginUpdate(id); // 업테이트된거 새로 불러옴
	        	
	        	model.addAttribute("socialUser", sl2);
	        	model.addAttribute("loginUser", u2);
	        	
	        	return "redirect:home.do";
			}
		}
		
		@RequestMapping("others_profile.en")
		public String others_profile() {
			return "others_Profile";
		}
		

		@RequestMapping("otherUsersProfile.en")
		public String otherUsersProfile(@RequestParam("uId") String id, @RequestParam("uNo") int usersNo, @RequestParam(value = "page", required = false) Integer page, Model model
										,HttpServletRequest request) {
			// 유저정보
			Users user = eService.socialLoginUpdate(id);
			model.addAttribute("user", user);
			
			// 팔로우 정보
			int follow = eService.follow(usersNo);
			int following = eService.following(usersNo);
			model.addAttribute("follow", follow); // 남이 나를 카운트
			model.addAttribute("following", following); // 내가 남을 카운트
			
			ArrayList<Follow> followList =  eService.followList(usersNo);
			ArrayList<Follow> followingLsit =  eService.followingLsit(usersNo);
			model.addAttribute("followList", followList);
			model.addAttribute("followingLsit", followingLsit);
			
			HttpSession session = request.getSession();
			Users loginUser = (Users)session.getAttribute("loginUser");
			
			if(loginUser != null) {
				ArrayList<Follow> loginUserFollowingList = eService.loginUserFollowingList(loginUser.getUsersNo());
				model.addAttribute("lList", loginUserFollowingList);
			}
			
			// 프사정보
			SocialLogin social = eService.SocialLogin(id);
			model.addAttribute("social", social);
			Image userImage = uService.selectImage(usersNo);
			model.addAttribute("userImage", userImage);
				
			// 작성 레시피 목록 + image
			ArrayList<Recipe> recipe = eService.recipeList(usersNo);
			model.addAttribute("rList", recipe);
			model.addAttribute("page", page);
			
			// 작성 글 목록
			ArrayList<Board> board = eService.boardList(usersNo); // 작성 글
			model.addAttribute("boList", board);
			ArrayList<Board> allBoardList = eService.allBoardList(); // 전체 글
			model.addAttribute("allBoardList", allBoardList);
			
			// 작성 댓글 목록
			ArrayList<Review> replyList = eService.replyList(); // 전체댓글
			model.addAttribute("replyList", replyList);
			String nickName = user.getNickName();
			ArrayList<Review> userReplyList = eService.userReplyList(nickName);
			model.addAttribute("userRList", userReplyList);
			
			// 레시피 리뷰 목록
			String usersId = user.getUsersId();
			ArrayList<Review> recipeReviewList = eService.reviewList(usersId); // 작성 레시피 리뷰
			model.addAttribute("rvList", recipeReviewList);
			
			// 식단 리뷰 목록
			ArrayList<Review> menuReviewList = eService.menuReviewList(usersId); // 작성 식단리뷰
			model.addAttribute("mrList", menuReviewList);
			ArrayList<Image> menuReviewImageList = eService.menuReviewImageList(); // 전체 식단리뷰 이미지
			model.addAttribute("menuReviewImageList", menuReviewImageList);
			
			// 북마크 목록
			ArrayList<BookMark> bookMarkList = eService.bookMarkList(usersNo);
			model.addAttribute("bList", bookMarkList);
			int recipeBookMarkList = eService.recipeBookMarkList(usersNo);
			model.addAttribute("rCount" ,recipeBookMarkList);
			int menuBookMarkList = eService.menuBookMarkList(usersNo);
			model.addAttribute("mCount", menuBookMarkList);
			
			// 북마크 - 레시피목록
			ArrayList<Recipe> allRecipeList = eService.allRecipeList();
			model.addAttribute("aList", allRecipeList);
			
			ArrayList<Image> allRecipeImageList = eService.allRecipeImageList();
			model.addAttribute("recipeImageList", allRecipeImageList);
			
			// 북마크 - 식단목록...모든 식단목록 가져와서....
			ArrayList<Menu> allMenuList = eService.menuList();
			model.addAttribute("mList", allMenuList);
			
			ArrayList<Image> menuImageList = eService.menuImageList();
			model.addAttribute("menuImageList", menuImageList);
			
			ArrayList<Product> productList = eService.productList(); // 영양사정보 가져오기
			model.addAttribute("pList", productList);
			ArrayList<Users> AllUsersList = eService.AllUsersList();
			model.addAttribute("hList", AllUsersList);
			
			
			
			
			return "othersProfile";
		}
		
}
