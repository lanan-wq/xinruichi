package service.admin;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import dao.admin.GoodsMapper;
import dao.admin.TypeMapper;
import javax.servlet.http.HttpServletRequest;
import model.admin.Goods;
import util.MyUtil;
@Service
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private TypeMapper typeMapper;
	
	@Autowired
	private GoodsMapper goodsMapper;
	
	@Override
	public String toAdd(Model model) {
		model.addAttribute("allTypes", typeMapper.selectAllGoodsType());
		model.addAttribute("goods", new Goods());
		return "admin/addGoods";
	}
	@Override
	public String add(Goods goods, HttpServletRequest request, Model model) {
		//文件上传
		MultipartFile mtf = goods.getGpictureForm();
		String fileName = mtf.getOriginalFilename();
		if(fileName.length() > 0) {
			//上传后的文件名
			String fileNewName = MyUtil.getRandomStr(10) +
					fileName.substring(fileName.lastIndexOf("."));
			//上传哪里，即文件目录
			//(1)生产环境，服务器上
			//String realpath = request.getServletContext().getRealPath("static/images");
			//(2)开发环境，工作空间
			String realpath = "D:\\idea-workspace\\eBusiness\\src\\main\\webapp\\static\\images";
			File dirUp = new File(realpath, fileNewName);
			try {
				mtf.transferTo(dirUp);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//将上传后的文件名封装到商品对象
			goods.setGpicture(fileNewName);
		}
		//将商品信息保存到数据库
		if(goodsMapper.add(goods) > 0) {
			return select(model, 1);//查询商品
		}
		return toAdd(model);
	}

	@Override
	public String select(Model model, int currentPage) {
		//共多少条
		int totalCount = goodsMapper.select().size(); 
		int pageSize = 10;
		//共多少页
		int totalPage = (int)Math.ceil(totalCount*1.0/pageSize);
		int startIndex =  (currentPage-1)*pageSize;
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("allGoods", goodsMapper.selectByPage(startIndex, pageSize));
		return "admin/selectGoods";
	}

	@Override
	public Map<String, Object> delete(int id) {
		Map<String, Object> hashmap = new HashMap<String, Object>();
		// 判断删除条件
		if (goodsMapper.selectCart(id).size() > 0 ||
				goodsMapper.selectFocus(id).size() > 0 ||
				goodsMapper.selectOrder(id).size() > 0)
			hashmap.put("msg", "id为" + id + "的商品有关联数据，不允许删除！");
		else {
			if (goodsMapper.delete(id) > 0) 
				hashmap.put("msg", "成功删除id为" + id + "的商品");
			else
				hashmap.put("msg", "删除失败");
		}
		return hashmap;
	}

	@Override
	public String detail(int id, Model model) {
		model.addAttribute("goods", goodsMapper.selectAgoods(id));
		return "admin/goodsDetail";
	}

	@Override
	public String updateSelect(int id, Model model) {
		model.addAttribute("goods", goodsMapper.selectAgoods(id));
		model.addAttribute("allTypes", typeMapper.selectAllGoodsType());
		return "admin/goodsUpdate";
	}
	@Override
	public String update(Goods goods, HttpServletRequest request, Model model) {
		//文件上传
		MultipartFile mtf = goods.getGpictureForm();
		String fileName = mtf.getOriginalFilename();
		if(fileName.length() > 0) {
			//上传后的文件名
			String fileNewName = MyUtil.getRandomStr(10) +
					fileName.substring(fileName.lastIndexOf("."));
			//上传哪里，即文件目录
			//(1)生产环境，服务器上
			//String realpath = request.getServletContext().getRealPath("static/images");
			//(2)开发环境，工作空间
			String realpath = "D:\\idea-workspace\\eBusiness\\src\\main\\webapp\\static\\images";
			File dirUp = new File(realpath, fileNewName);
			try {
				mtf.transferTo(dirUp);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//将上传后的文件名封装到商品对象
			goods.setGpicture(fileNewName);
		}
		//将商品信息更新到数据库
		if(goodsMapper.update(goods) > 0) {
			return select(model, 1);//查询商品
		}
		return updateSelect(goods.getId(), model);//还回到修改页面
	}
}
