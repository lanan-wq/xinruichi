package service.before;

import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import model.before.Buser;

public interface UserService {
	public String isUse(Buser buser);
	public String register(Buser buser);
	public String login(Buser buser, Model model, HttpSession session);
}
