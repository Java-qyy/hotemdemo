package com.rj.bd.hotel.manage.bill;

import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import com.rj.bd.hotel.dao.Dao;
import com.rj.bd.hotel.dao.DaoImpl;

/**
 * @desc 账单模块的M层的实现类
 * @author LGZ
 * @time 2020-12-23 19:41
 */
public class billServiceImpl implements billService{
	
	Dao dao=new DaoImpl();

	@Override
	public List<Map<String, Object>> queryBill(String key) 
			throws ClassNotFoundException, SQLException {
		if (key == null) {
			key = "";
		}
		System.out.println(key);
		String sql=" SELECT b.bill_no,b.bill_time,c.* FROM bill b LEFT JOIN(SELECT co.checkout_no,co.checkout_time,a.* FROM checkout co LEFT JOIN (SELECT ci.checkin_no,ci.checkin_time,ci.actualpayment,m.member_name,r.room_name FROM checkin ci LEFT JOIN member m ON ci.member_no=m.member_no LEFT JOIN room r ON ci.room_no=r.room_no) a ON co.checkin_no=a.checkin_no) c ON b.checkout_no=c.checkout_no WHERE member_name LIKE ? ";
		return dao.executeQueryForList(sql, new int[] {Types.VARCHAR}, new Object[] {"%" + key.toString().trim() + "%"});
	}
	
}
