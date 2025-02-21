package service.before;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import dao.admin.GoodsMapper;
import dao.admin.TypeMapper;
import dao.before.IndexMapper;
import javax.servlet.http.HttpSession;
import model.admin.Goods;
import model.before.Buser;
import util.MyUtil;
@Service
public class IndexServiceImpl implements IndexService{
	@Autowired
	private TypeMapper typeMapper;
	@Autowired
	private IndexMapper indexMapper;
	@Autowired
	private GoodsMapper goodsMapper;
	@Override
	public void head(Model model) {
		//广告商品
		model.addAttribute("adviseGoods", indexMapper.selectAdviseGoods());
		//类型
		model.addAttribute("allTypes", typeMapper.selectAllGoodsType());
	}
	@Override
	public String index(Model model, int id) {
		head(model);
		model.addAttribute("lastedGoods", indexMapper.selectLastedGoods(id));
		return "before/index";
	}
	@Override
	public String goodsDetail(Model model, int id) {
		head(model);
		model.addAttribute("goods", goodsMapper.selectAgoods(id));
		return "before/goodsDetail";
	}
	@Override
	public String search(String mykey, Model model) {
		head(model);
		model.addAttribute("lastedGoods", indexMapper.search(mykey));
		return "before/index";
	}
	
	@Override
	public String focus(Goods goods, HttpSession session) {
		Buser buser = MyUtil.getBuserFromSession(session);
		//判断是否登录
		if(buser == null)
			return "noLogin";
		//判断是否已收藏
		List<Map<String, Object>> listmap =
				indexMapper.isFocus(goods.getId(), buser.getId());
		if(listmap.size() > 0)
			return "no";
		//收藏商品
		if(indexMapper.focus(goods.getId(), buser.getId()) > 0)
			return "ok";
		return null;
	}

}
