package com.rj.bd.hotel.manage.lkcx;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ILKService {

	List<Map<String, Object>> queryAll(String key) 
			throws ClassNotFoundException, SQLException;

}
