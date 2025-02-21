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
import model.admin.Goods;
import service.before.IndexService;

@Controller
public class IndexController {
	@Autowired
	private IndexService indexService;

	@RequestMapping("/index")
	public String index(Model model, int id) {
		return indexService.index(model, id);
	}
	
	@GetMapping("/index/goodsDetail")
	public String goodsDetail(Model model, int id) {
		return indexService.goodsDetail(model, id);
	}
	@GetMapping("/index/testdrive")
	public String testdrive(Model model, int id) {
		return indexService.testdrive(model, id);
	}
	@RequestMapping("/index/search")
	public String search(String mykey, Model model) {
		return indexService.search(mykey, model);
	}
	
	@PostMapping("/index/focus")
	@ResponseBody
	public String focus(@RequestBody Goods goods, HttpSession session) {
		return indexService.focus(goods, session);
	}
}
