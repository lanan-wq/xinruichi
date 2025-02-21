package model.admin;

import org.springframework.web.multipart.MultipartFile;
import lombok.Data;
@Data
public class Goods {
	private int id;
	private String gname;
	private double goprice;
	private double grprice;
	private int gstore;
	private MultipartFile gpictureForm;//与表单相同，封装文件信息
	private String gpicture;//与数据表字段相同，对应上传后的文件名
	private int goodstype_id;
	private String typename;
	private int isshow;
}
