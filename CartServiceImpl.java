package service.before;

import java.util.List;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import dao.before.CartMapper;
import javax.servlet.http.HttpSession;
import model.before.Buser;
import model.before.Cart;
import model.before.Order;
import util.MD5Util;
import util.MyUtil;
@Service
public class CartServiceImpl implements CartService{
 
	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private IndexService indexService;
	
	@Override
	public String putCart(Cart cart, HttpSession session) {
		cart.setBusertable_id(MyUtil.getBuserFromSession(session).getId());
		//是否在购物车中
		List<Cart> listcart = cartMapper.isCart(cart);
		//在，更新
		if(listcart.size() > 0)
			cartMapper.updateCart(cart);
		else
			//不在，添加
			cartMapper.insertCart(cart);
		return "forward:/cart/selectCart";
	}

	@Override
	public String selectCart(HttpSession session, Model model, String act) {
		int busertable_id = MyUtil.getBuserFromSession(session).getId();
		List<Map<String, Object>> listmap = cartMapper.selectCart(busertable_id);
		double total = 0;
		for (Map<String, Object> map : listmap) {
			total = total + ((Double)map.get("smallsum")).doubleValue();
		}
		model.addAttribute("total", total);
		model.addAttribute("cartlist", listmap);
		
		indexService.head(model);
		
		if("toCount".equals(act))
			return "before/count";
		return "before/cart";
	}

	@Override
	public String deleteCart(int cid) {
		cartMapper.deleteCart(cid);
		return "forward:/cart/selectCart";
	}
	@Override
	public String deleteCollect(int id) {
		cartMapper.deleteCollect(id);
		return "forward:/cart/myFocus";
	}

	@Override
	public String clearCart(HttpSession session) {
		int busertable_id = MyUtil.getBuserFromSession(session).getId();
		cartMapper.clearCart(busertable_id);
		return "forward:/cart/selectCart";
	}

	@Override
	@Transactional //事务管理
	public String orderSubmit(Order order, HttpSession session, Model model) {
		int busertable_id = MyUtil.getBuserFromSession(session).getId();
		order.setBusertable_id(busertable_id);
		order.setStatus(0);
		//1.生成订单，并产生订单编号，存储在order对象中
		cartMapper.insertOrder(order);
		//2.生成订单详情
		cartMapper.insertOrderDetail(order);
		//3.减少商品库存
		cartMapper.updateStore(busertable_id);
		//4.清空购物车
		cartMapper.clearCart(busertable_id);
		model.addAttribute("order", order);
		indexService.head(model);
		return "before/pay";
	}

	@Override
	public String pay(int id) {
		cartMapper.pay(id);
		return "forward:/index?id=0";
	}

	@Override
	public String myOrder(HttpSession session, Model model) {
		int busertable_id = MyUtil.getBuserFromSession(session).getId();
		model.addAttribute("myOrder", cartMapper.myOrder(busertable_id));
		indexService.head(model);
		return "before/myOrder";
	}

	@Override
	public String orderDetail(int id, Model model) {
		indexService.head(model);
		model.addAttribute("orderDetail", cartMapper.orderDetail(id));
		return "before/orderDetail";
	}

	@Override
	public String myFocus(HttpSession session, Model model) {
		int busertable_id = MyUtil.getBuserFromSession(session).getId();
		indexService.head(model);
		model.addAttribute("myFocus", cartMapper.myFocus(busertable_id));
		return "before/myFocus";
	}

	@Override
	public String updatePWD(HttpSession session, Buser buser) {
		//明文变密文
		buser.setBpwd(MD5Util.MD5(buser.getBpwd()));  
		if(cartMapper.updatePWD(buser) > 0) {
			session.invalidate();
			return "before/login";
		}
		return "before/userInfo";
	}

}
