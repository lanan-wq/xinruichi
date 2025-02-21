package util;

import java.util.Random;

import javax.servlet.http.HttpSession;
import model.before.Buser;

public class MyUtil {
	public static Buser getBuserFromSession(HttpSession session) {
		Buser buser = (Buser)session.getAttribute("buser");
		return buser;
	}
	public static String getRandomStr(int n) {
		// 生成 Random 对象
		Random random = new Random();
		StringBuffer str = new StringBuffer();
		for (int i = 0; i < n; i++) {
			// 生成 0-9 随机整数 
			str = str.append(random.nextInt(10)); 
		} 
		return str.toString();
	}
}
