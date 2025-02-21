package dao.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.admin.Goods;
import model.admin.GoodsType;

public interface TypeMapper {
	public  int  addType(GoodsType goodsType);
	public List<GoodsType> selectAllGoodsType(); 
	public List<Goods> selectGoodsByTypeID(GoodsType goodsType);
	public int delete(GoodsType goodsType);
	public GoodsType selectGoodsTypeByID(GoodsType goodsType);
	public int updateType(GoodsType goodsType);
	public List<GoodsType> selectByPage(@Param("startIndex") int startIndex,
			@Param("pageSize") int pageSize); 
}
