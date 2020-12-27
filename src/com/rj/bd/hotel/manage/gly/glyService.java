package com.rj.bd.hotel.manage.gly;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @desc 管理员模块的M层接口
 * @author LGZ
 * @time 2020-12-23 
 */
public interface glyService {

	void add(String gId, String gName, String gUserName, String gPassword, String gEmail,String virtualPath) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;

	List<Map<String, Object>> queryAll() throws ClassNotFoundException, SQLException;

	Map<String, Object> queryCode(String ucode) throws ClassNotFoundException, SQLException;

	Map<String, Object> queryById(String id) throws ClassNotFoundException, SQLException;

	void update(String newPassword,String mname) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;

	int pdid(String id) throws ClassNotFoundException, SQLException;



	


}
