package dao.before;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import model.admin.Goods;

public interface IndexMapper {
	public List<Goods> selectAdviseGoods();
	public List<Goods> selectLastedGoods(int id);
	public List<Goods> search(String mykey);
	public List<Map<String, Object>>  isFocus(@Param("goodstable_id") int gid,
			@Param("busertable_id") int bid);
	public int focus(@Param("goodstable_id") int gid,
			@Param("busertable_id") int bid);
}
