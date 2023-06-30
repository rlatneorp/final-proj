package kh.finalproj.hollosekki;

import java.text.DateFormat;
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

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.enroll.model.service.EnrollService;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
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
		if(loginUsers != null) {
			Users u = (Users)model.getAttribute("loginUser");
			Users loginUser = eService.login(u);
			System.out.println(loginUser);
			model.addAttribute("loginUser", loginUser);
			Image image = uService.selectImage(loginUser.getUsersNo());
			model.addAttribute("image", image);
			
			return "home";
		} else {
			model.addAttribute("serverTime", formattedDate );
			return "home";
		}
	}
	
}
