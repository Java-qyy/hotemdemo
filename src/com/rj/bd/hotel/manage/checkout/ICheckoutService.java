package com.rj.bd.hotel.manage.checkout;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * 
 * @desc   退房的M层接口
 * @author 刘昊原
 * @time   2020-12-22 下午7:26:42
 * 
 */

public interface ICheckoutService {

	List<Map<String, Object>> queryCheckout(String key) 
			throws ClassNotFoundException, SQLException;

	void updateCheckoutById(String checkout_no, String room_no) 
			throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;
	
}
