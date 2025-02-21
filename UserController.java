package controller.before;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import model.before.Buser;
import service.before.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@PostMapping("/isUse")
	@ResponseBody
	public String isUse(@RequestBody Buser buser) {
		return userService.isUse(buser);
	}
	
	@PostMapping("/register")
	public String register(Buser buser) {
		return userService.register(buser);
	}
	
	@PostMapping("/login")
	public String login(Buser buser, Model model, HttpSession session) {
		return userService.login(buser, model, session);
	}
	
	@GetMapping("/toRegister")
	public String toRegister() {
		return "before/register";
	}
	
	@GetMapping("/toLogin")
	public String toLogin() {
		return "before/login";
	}
}
