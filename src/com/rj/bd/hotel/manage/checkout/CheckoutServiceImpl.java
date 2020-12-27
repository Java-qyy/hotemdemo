package com.rj.bd.hotel.manage.checkout;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.rj.bd.hotel.dao.Dao;
import com.rj.bd.hotel.dao.DaoImpl;
import com.rj.bd.hotel.utils.Dates;

/**
 * 
 * @desc   退房的M层实现类
 * @author 刘昊原
 * @time   2020-12-22 上午10:15:12
 * 
 */

public class CheckoutServiceImpl implements ICheckoutService {
	
	Dao dao = new DaoImpl();

	@Override
	public List<Map<String, Object>> queryCheckout(String key) 
			throws ClassNotFoundException, SQLException {
		if (key == null) {
			key = "";
		}
		String sql = " SELECT co.checkout_no,co.checkout_time,a.* FROM checkout co LEFT JOIN (SELECT ci.checkin_no,ci.checkin_time,m.member_name,r.room_no,r.room_name FROM checkin ci LEFT JOIN member m ON ci.member_no=m.member_no LEFT JOIN room r ON ci.room_no=r.room_no) a ON co.checkin_no=a.checkin_no WHERE co.checkout_time IS NULL AND member_name LIKE ? ";
		return dao.executeQueryForList(sql, new int[] {Types.VARCHAR}, new Object[] {"%" + key.toString().trim() + "%"});
	}

	@Override
	public void updateCheckoutById(String checkout_no, String room_no) 
			throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		//添加信息到bill表
		String sql03 = " insert into bill values(?,?,?) ";
		int[] types03 = new int [3];
		types03[0] = Types.VARCHAR;
		types03[1] = Types.VARCHAR;
		types03[2] = Types.VARCHAR;
		Object[] values03 = new Object[3];
		values03[0] = UUID.randomUUID().toString();
		values03[1] = checkout_no;
		values03[2] = Dates.CurrentYMDHSMTime();
		dao.executeUpdate(sql03, types03, values03);
		//修改checkout表中checkout_time为当前时间
		String sql01 = " update checkout set checkout_time=? where checkout_no=? ";
		int[] types01 = new int [2];
		types01[0] = Types.VARCHAR;
		types01[1] = Types.VARCHAR;
		Object[] values01 = new Object[2];
		values01[0] = Dates.CurrentYMDHSMTime();
		values01[1] = checkout_no;
		dao.executeUpdate(sql01, types01, values01);
		//修改room表中room_state为空闲
		String sql02 = " update room set room_state=? where room_no=? ";
		int[] types02 = new int [2];
		types02[0] = Types.VARCHAR;
		types02[1] = Types.VARCHAR;
		Object[] values02 = new Object[2];
		values02[0] = "空闲";
		values02[1] = room_no;
		dao.executeUpdate(sql02, types02, values02);
	}

}
