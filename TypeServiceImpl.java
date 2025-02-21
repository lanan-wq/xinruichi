package service.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import dao.admin.TypeMapper;
import model.admin.GoodsType;

@Service
public class TypeServiceImpl implements TypeService {
	@Autowired
	private TypeMapper typeMapper;

	@Override
	public String add(GoodsType goodsType, Model model) {
		if (typeMapper.addType(goodsType) > 0) {
			return select(model, 1);//查询商品类型
		}
		return "admin/addType";
	}

	@Override
	public String select(Model model, int currentPage) {
		//共多少条
		int totalCount = typeMapper.selectAllGoodsType().size(); 
		int pageSize = 10;
		//共多少页
		int totalPage = (int)Math.ceil(totalCount*1.0/pageSize);
		int startIndex =  (currentPage-1)*pageSize;
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		// TODO Auto-generated method stub
		model.addAttribute("allTypes", typeMapper.selectByPage(startIndex, pageSize));
		return "admin/selectType";
	}

	@Override
	public Map<String, Object> delete(GoodsType goodsType) {
		Map<String, Object> hashmap = new HashMap<String, Object>();
		// 判断删除条件
		if (typeMapper.selectGoodsByTypeID(goodsType).size() > 0)
			hashmap.put("msg", "id为" + goodsType.getId() + "的类型下有关联商品，不允许删除！");
		else {
			if (typeMapper.delete(goodsType) > 0) 
				hashmap.put("msg", "成功删除id为" + goodsType.getId() + "的类型");
			else
				hashmap.put("msg", "删除失败");
		}
		return hashmap;
	}

	@Override
	public String updateSelect(GoodsType goodsType, Model model) {
		model.addAttribute("goodsType", typeMapper.selectGoodsTypeByID(goodsType));
		return "admin/updateType";
	}

	@Override
	public String update(GoodsType goodsType, Model model) {
		typeMapper.updateType(goodsType);
		return select(model, 1);
	}

}
