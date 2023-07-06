package kh.finalproj.hollosekki;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.finalproj.hollosekki.common.model.vo.Healther;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.enroll.model.service.EnrollService;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.service.MarketService;
import kh.finalproj.hollosekki.market.model.vo.Product;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;
import kh.finalproj.hollosekki.users.model.service.UsersService;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes({"loginUser"})
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private UsersService uService;
	
	@Autowired
	private EnrollService eService;
	
	@Autowired
	private MarketService mkService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		Users loginUsers = (Users)model.getAttribute("loginUser");
		
		
		// 간단 레시피
		ArrayList<Recipe> mainRecipeList = eService.mainRecipeList();
		model.addAttribute("mrList", mainRecipeList);
//		System.out.println(mainRecipeList);
		
		// 영양사 조회
		ArrayList<Healther> healtherList = eService.healtherList();
		model.addAttribute("hList", healtherList);
		System.out.println(healtherList);
		
		// 식단 조회
		ArrayList<Menu> menuList = eService.menuProductList();
		model.addAttribute("mList", menuList);
		
		//잘 나가는 상품 조회 
		ArrayList<Product> likeOrderByOne = mkService.selectLikeOrderBy();
		model.addAttribute("likeOrderByOne", likeOrderByOne);
		
		//밀키트 조회 
		ArrayList<Product> mealKit = mkService.selectMealKit();
		model.addAttribute("mealKit", mealKit);
		
		if(loginUsers != null) {
			Users u = (Users)model.getAttribute("loginUser");
			Users loginUser = eService.login(u);
			model.addAttribute("loginUser", loginUser);
			if(loginUser != null) {
				Image image = uService.selectImage(loginUser.getUsersNo());
				model.addAttribute("image", image);
			} else {
				Users user = eService.login2(u);
				model.addAttribute("loginUser", user);
			}
			return "home";
		} else {
			model.addAttribute("serverTime", formattedDate );
			return "home";
		}
	}
	
}
