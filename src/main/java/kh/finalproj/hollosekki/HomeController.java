package kh.finalproj.hollosekki;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.enroll.model.service.EnrollService;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.service.MarketService;
import kh.finalproj.hollosekki.market.model.vo.Food;
import kh.finalproj.hollosekki.market.model.vo.Product;
import kh.finalproj.hollosekki.market.model.vo.Tool;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;
import kh.finalproj.hollosekki.users.model.service.UsersService;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes({"loginUser", "cart"})
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
		
		// 영양사 조회
		ArrayList<Healther> healtherList = eService.healtherList();
		model.addAttribute("hList", healtherList);
		
		// 식단 조회
		ArrayList<Menu> menuList = eService.menuProductList();
		model.addAttribute("mList", menuList);
		
		//전체 상품 중 좋아요가 많은 상위 8개 조회 
		ArrayList<HashMap<String, Object>> likeOrderBy = mkService.selectLikeOrderBy();
		ArrayList<Product> lists = new ArrayList<>();
			if(!likeOrderBy.isEmpty()) {
				for(HashMap<String, Object> map : likeOrderBy) {
					int productNo = Integer.parseInt(map.get("PRODUCT_NO").toString()); 
				    String img = null; 
				   
				    Food food = mkService.selectFood(productNo); 
				    Tool tool = mkService.selectTool(productNo); 
				    Ingredient ingre = mkService.selectIngrdient(productNo);
				   
				    Product product = new Product();
				    product.setProductNo(productNo);
				   
				    if(food != null) {
				    	product.setProductName(food.getFoodName());
					    product.setProductPrice(Integer.parseInt(map.get("PRODUCT_PRICE").toString()));
					    product.setProductSale(Integer.parseInt(map.get("PRODUCT_SALE").toString()));
					    img = mkService.selectImg(productNo, 3);
				    } else if (tool != null) {
					    product.setProductName(tool.getToolName());
					    product.setProductPrice(Integer.parseInt(map.get("PRODUCT_PRICE").toString()));
					    product.setProductSale(Integer.parseInt(map.get("PRODUCT_SALE").toString()));
					    img = mkService.selectImg(productNo, 6);
				    } else if (ingre != null) {
					    product.setProductName(ingre.getIngredientName()); 
					    product.setProductPrice(Integer.parseInt(map.get("PRODUCT_PRICE").toString()));
					    product.setProductSale(Integer.parseInt(map.get("PRODUCT_SALE").toString()));
					    img = mkService.selectImg(ingre.getIngredientNo(), 5);
				    }
				    if(img != null) {
					    product.setProductImg(img);
				    }
				    lists.add(product);
			    }
			   
		    }
			model.addAttribute("likeOrderByOne", lists);
		
		
		//밀키트 조회 
		ArrayList<Product> mealKit = mkService.selectMealKit();
		model.addAttribute("mealKit", mealKit);
		
		if(loginUsers != null) {
			Users u = (Users)model.getAttribute("loginUser");
			Users loginUser = eService.login(u);
			model.addAttribute("loginUser", loginUser);
			
			int cart = eService.cartCount(u.getUsersNo());
			model.addAttribute("cart", cart);
			
			
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
