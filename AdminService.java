package service.admin;


import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import model.admin.AdminUser;

public interface AdminService {
	public String login(AdminUser adminUser, HttpSession session);
	public String selectOrder(Model model, int currentPage);
	public String selectOrderByMonth(Model model);
	public String selectOrderByType(Model model);
}
