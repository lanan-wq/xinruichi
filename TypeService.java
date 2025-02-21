package service.admin;

import java.util.Map;

import org.springframework.ui.Model;

import model.admin.GoodsType;

public interface TypeService {
	public String add(GoodsType goodsType, Model model);
	public String select(Model model, int currentPage);
	public Map<String, Object> delete(GoodsType goodsType);
	public String updateSelect(GoodsType goodsType, Model model);
	public String update(GoodsType goodsType, Model model);
}
