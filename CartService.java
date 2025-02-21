package service.before;


import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import model.before.Buser;
import model.before.Cart;
import model.before.Order;

public interface CartService {
	public String putCart(Cart cart, HttpSession session);
	public String selectCart(HttpSession session, Model model, String act);
	public String deleteCart(int cid);
	public String clearCart(HttpSession session);
	public String orderSubmit(Order order, HttpSession session, Model model);
	public String pay(int id);
	public String myOrder(HttpSession session, Model model);
	public String orderDetail(int id, Model model);
	public String myFocus(HttpSession session, Model model);
	public String updatePWD(HttpSession session, Buser buser);
	public String deleteCollect(int id);
}
