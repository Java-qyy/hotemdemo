package com.rj.bd.hotel.manage.bill;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @desc 账单模块的M层接口
 * @author LGZ
 * @time 2020-12-23 19:41
 */
public interface billService {

	List<Map<String, Object>> queryBill(String key) 
			throws ClassNotFoundException, SQLException;

}
