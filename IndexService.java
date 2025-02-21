package service.before;


import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import model.admin.Goods;

public interface IndexService {
	public void head(Model model);
	public String index(Model model, int id);
	public String goodsDetail(Model model, int id);
	public String testdrive(Model model, int id);
	public String search(String mykey, Model model);
	public String focus(Goods goods, HttpSession session);
}
