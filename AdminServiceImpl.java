package service.admin;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import dao.admin.AdminMapper;
import javax.servlet.http.HttpSession;
import model.admin.AdminUser;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public String login(AdminUser adminUser, HttpSession session) {
		if(adminMapper.login(adminUser).size() > 0) {
			session.setAttribute("aname", adminUser.getAname());
			return "redirect:/goods/select?currentPage=1";
		}
		return "admin/login";
	}
	
	@Override
	public String selectOrder(Model model, int currentPage) {
		//共多少条
		int totalCount = adminMapper.selectAllOrder(); 
		int pageSize = 10;
		//共多少页
		int totalPage = (int)Math.ceil(totalCount*1.0/pageSize);
		int startIndex =  (currentPage-1)*pageSize;
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("allOders", adminMapper.selectOrderByPage(startIndex, pageSize));
		return "admin/orderManage";
	}

	@Override
	public String selectOrderByMonth(Model model) {
		List<Map<String, Object>>  myList = adminMapper.selectOrderByMonth();
		List<String> months = new ArrayList<String>();
		List<Double> totalAmount = new ArrayList<Double>();
		for (Map<String, Object> map : myList) {
			months.add("'" + map.get("months") + "'");
			totalAmount.add((Double)map.get("totalamount"));
		}
		model.addAttribute("months", months);
		model.addAttribute("totalAmount", totalAmount);
		return "admin/selectOrderByMonth";
	}

	@Override
	public String selectOrderByType(Model model) {
		List<Map<String, Object>>  myList = adminMapper.selectOrderByType();
		List<String> typenames = new ArrayList<String>();
		List<Double> totalAmount = new ArrayList<Double>();
		for (Map<String, Object> map : myList) {
			typenames.add("'" + (String)map.get("name") + "'");
			totalAmount.add((Double)map.get("value"));
		}
		model.addAttribute("typenames", typenames);
		model.addAttribute("totalAmount", totalAmount);
		return "admin/selectOrderByType";
	}
}
