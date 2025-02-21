package service.admin;

import java.util.Map;

import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import model.admin.Goods;

public interface GoodsService {
	public String toAdd(Model model);
	public String add(Goods goods, HttpServletRequest request, Model model);
	public String select(Model model, int currentPage);
	public Map<String, Object> delete(int id);
	public String detail(int id, Model model);
	public String updateSelect(int id, Model model);
	public String update(Goods goods, HttpServletRequest request, Model model);
}
