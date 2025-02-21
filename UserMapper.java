package dao.before;

import java.util.List;

import model.before.Buser;

public interface UserMapper {
	public List<Buser> selectBuserByEmail(Buser buser);
	public int register(Buser buser);
	public List<Buser> login(Buser buser);
}
