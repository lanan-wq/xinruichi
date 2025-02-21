package controller.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import model.admin.Goods;
import service.admin.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	@GetMapping("/toAdd")
	public String toAdd(Model model) {
		return goodsService.toAdd(model);
	}
	@PostMapping("/add")
	public String add(@ModelAttribute Goods goods,  HttpServletRequest request, Model model) {
		return goodsService.add(goods, request, model);
	}
	
	@GetMapping("/select")
	public String select(Model model, Integer currentPage) {
		if (currentPage == null) {
	        currentPage = 1; // 设置默认页码为 1
	    }
		return goodsService.select(model, currentPage);
	}
	
	@DeleteMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(@RequestBody Goods goods) {
		return goodsService.delete(goods.getId());
	}
	
	@GetMapping("/detail")
	public String detail(int id, Model model) {
		return goodsService.detail(id, model);
	}
	
	@GetMapping("/updateSelect")
	public String updateSelect(int id, Model model) {
		return goodsService.updateSelect(id, model);
	}
	@PostMapping("/update")
	public String update(Goods goods, HttpServletRequest request, Model model) {
		return goodsService.update(goods, request, model);
	}
	
}
