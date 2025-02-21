package controller.admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;
import model.admin.AdminUser;
import service.admin.AdminService;
@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@PostMapping("/login")
	public String login(AdminUser adminUser, HttpSession session) {
		return adminService.login(adminUser, session);
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "admin/login";
	}
	@GetMapping("/toLogin")
	public String toLogin() {
		return "admin/login";
	}
	@GetMapping("/selectOrder")
	public String selectOrder(Model model, int currentPage) {
		return adminService.selectOrder(model, currentPage);
	}
	@GetMapping("/selectOrderByMonth")
	public String selectOrderByMonth(Model model) {
		return adminService.selectOrderByMonth(model);
	}
	@GetMapping("/selectOrderByType")
	public String selectOrderByType(Model model) {
		return adminService.selectOrderByType(model);
	}
}
