package controller.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.admin.GoodsType;
import service.admin.TypeService;

@Controller
@RequestMapping("/type")
public class TypeController {
	@Autowired
	private TypeService typeService;
	@GetMapping("/toAdd")
	public String toAdd() {
		return "admin/addType";
	}
	@PostMapping("/add")
	public String add(GoodsType goodsType, Model model) {
		return typeService.add(goodsType, model);
	}
	@GetMapping("/select")
	public String select(Model model, Integer currentPage) {
		if (currentPage == null) {
	        currentPage = 1; 
	    }
		return typeService.select(model, currentPage);
	}
	@GetMapping("/updateSelect")
	public String updateSelect(GoodsType goodsType, Model model) {
		return typeService.updateSelect(goodsType, model);
	}
	@DeleteMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(@RequestBody GoodsType goodsType) {
		return typeService.delete(goodsType);
	}
	@PostMapping("/update")
	public String update(GoodsType goodsType, Model model) {
		return typeService.update(goodsType, model);
	}
}
