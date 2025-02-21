package dao.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import model.admin.Goods;

public interface GoodsMapper {
	public int add(Goods goods);
	public List<Goods> select();
	public List<Goods> selectByPage(@Param("startIndex") int startIndex,
			@Param("pageSize") int pageSize);
	public List<Map<String, Object>> selectCart(int id);
	public List<Map<String, Object>> selectFocus(int id);
	public List<Map<String, Object>> selectOrder(int id);
	public int delete(int id);
	public Goods selectAgoods(int id);
	public int update(Goods goods);
}
