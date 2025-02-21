package dao.before;

import java.util.List;
import java.util.Map;

import model.before.Buser;
import model.before.Cart;
import model.before.Order;

public interface CartMapper {
	public List<Cart>  isCart(Cart cart);
	public int updateCart(Cart cart);
	public int insertCart(Cart cart);
	public List<Map<String, Object>> selectCart(int busertable_id);
	public int deleteCart(int id);
	public int deleteCollect(int id);
	public int clearCart(int busertable_id);
	public int insertOrder(Order order);
	public int insertOrderDetail(Order order);
	public int updateStore(int busertable_id);
	public int pay(int id);
	public List<Order> myOrder(int busertable_id);
	public List<Map<String, Object>> orderDetail(int orderbasetable_id);
	public List<Map<String, Object>> myFocus(int busertable_id);
	public int updatePWD(Buser buser);
}
