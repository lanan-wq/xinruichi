package service.before;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import dao.before.UserMapper;
import javax.servlet.http.HttpSession;
import model.before.Buser;
import util.MD5Util;
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public String isUse(Buser buser) {
		if(userMapper.selectBuserByEmail(buser).size() > 0)
			return "no";
		return "ok";
	}

	@Override
	public String register(Buser buser) {
		//明文变密文
		buser.setBpwd(MD5Util.MD5(buser.getBpwd()));  
		if(userMapper.register(buser) > 0)
			return "before/login";
		return "before/register";
	}

	@Override
	public String login(Buser buser, Model model, HttpSession session) {
		//获得程序产生的验证码计算结果
		String rand = (String)session.getAttribute("rand");
		if(!rand.equals(buser.getCode())) {
			model.addAttribute("errorMessage", "验证码错误！");
			model.addAttribute("bemail", buser.getBemail());
			return "before/login";
		}
		//把明文密码变成MD5密文
		buser.setBpwd(MD5Util.MD5(buser.getBpwd())); 
		List<Buser>  listBuser = userMapper.login(buser);
		if(listBuser.size() == 0) {//登录失败
			model.addAttribute("errorMessage", "邮箱或密码错误！");
			model.addAttribute("bemail", buser.getBemail());
			return "before/login";
		}else {//登录成功
			session.setAttribute("buser", listBuser.get(0));
			//如果回到控制器的请求URL，使用转发forward或重定向redirect
			return "forward:/index?id=0";
		}
	}

}
