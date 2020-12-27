package com.rj.bd.hotel.manage.kfgl;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @desc 客房管理模块的M层接口
 * @author LGZ
 * @time 2020-12-22 15:57
 */
public interface IkfglService {

	List<Map<String, Object>> query() throws ClassNotFoundException, SQLException;

	List<Map<String, Object>> queryAll(String roomtype_no) throws ClassNotFoundException, SQLException;

	void save(String roomtype_no,String room_name, String room_phone) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;

	List<Map<String, Object>> queryAll1(String roomtype) throws ClassNotFoundException, SQLException;

	void deleteByIdArray(String[] delIdArray) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;


	


}
