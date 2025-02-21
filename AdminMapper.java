package dao.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import model.admin.AdminUser;

public interface AdminMapper {
	public List<AdminUser> login(AdminUser adminUser);
	public List<Map<String, Object>> selectOrderByPage(@Param("startIndex") int startIndex,
			@Param("pageSize") int pageSize);
	public int selectAllOrder();
	public List<Map<String, Object>> selectOrderByMonth();
	public List<Map<String, Object>> selectOrderByType();
}
