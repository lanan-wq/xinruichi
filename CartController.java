package controller.before;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import model.before.Buser;
import model.before.Cart;
import model.before.Order;
import service.before.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@GetMapping("/putCart")
	public String putCart(Cart cart, HttpSession session) {
		return cartService.putCart(cart, session);
	}
	
	@GetMapping("/selectCart")
	public String selectCart(HttpSession session, Model model, String act) {
		return cartService.selectCart(session, model, act);
	}
	
	@RequestMapping("/deleteCart")
	public String deleteCart(int cid) {
		return cartService.deleteCart(cid);
	}
	
	@RequestMapping("/clearCart")
	public String clearCart(HttpSession session) {
		return cartService.clearCart(session);
	}
	
	@RequestMapping("/orderSubmit")
	public String orderSubmit(Order order, HttpSession session, Model model) {
		return cartService.orderSubmit(order, session, model);
	}
	
	@RequestMapping("/pay")
	public String pay(int id) {
		return cartService.pay(id);
	}
	
	@GetMapping("/myOrder")
	public String myOrder(HttpSession session, Model model) {
		return cartService.myOrder(session, model);
	}
	
	@GetMapping("/orderDetail")
	public String orderDetail(int id, Model model) {
		return cartService.orderDetail(id, model);
	}
	
	@GetMapping("/myFocus")
	public String myFocus(HttpSession session, Model model) {
		return cartService.myFocus(session, model);
	}
	@GetMapping("/userInfo")
	public String userInfo() {
		return "before/userInfo";
	}
	@GetMapping("/user")
	public String user() {
		return "before/user";
	}
	@PostMapping("/updatePWD")
	public String updatePWD(HttpSession session, Buser buser) {
		return cartService.updatePWD(session, buser);
	}
	@RequestMapping("/deleteCollect")
	public String deleteCollect(int id) {
		return cartService.deleteCollect(id);
	}
}
