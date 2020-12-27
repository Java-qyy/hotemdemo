package com.rj.bd.hotel.manage.lvkedengji;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @desc 旅客登记模块的M层接口
 * @author LGZ
 * @time 2020-12-23 
 */
public interface lvkedengjiService {

	List<Map<String, Object>> query(String roomtype_type) throws ClassNotFoundException, SQLException;

	void add(String lkname, String lksex, String lkId, String lkemail, String roomname) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;


	


}
