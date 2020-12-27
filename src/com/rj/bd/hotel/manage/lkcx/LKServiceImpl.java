package com.rj.bd.hotel.manage.lkcx;

import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import com.rj.bd.hotel.dao.Dao;
import com.rj.bd.hotel.dao.DaoImpl;

public class LKServiceImpl implements ILKService {
	Dao dao = new DaoImpl();
	@Override
	public List<Map<String, Object>> queryAll(String key) 
			throws ClassNotFoundException, SQLException {
		if (key == null) {
			key = "";
		}
		String sql = " SELECT * FROM member WHERE member_name LIKE ? ";
		return dao.executeQueryForList(sql, new int[] {Types.VARCHAR}, new Object[] {"%" + key.toString().trim() + "%"});
	}
}
