package com.rj.bd.hotel.manage.tjmanage;

import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import com.rj.bd.hotel.dao.Dao;
import com.rj.bd.hotel.dao.DaoImpl;

public class TongJiServiceImpl implements ITongJiService{

	
	Dao dao= new DaoImpl();

	@Override
	public List<Map<String, Object>> queryZhi(String startyear,String endyear) throws ClassNotFoundException, SQLException {
		String sql=" SELECT b.bill_no,(left(b.bill_time,4)) bill_time ,(sum(c.actualpayment)) actualpayment FROM bill b LEFT JOIN(SELECT co.checkout_no,co.checkout_time,a.* FROM checkout co LEFT JOIN (SELECT ci.checkin_no,ci.checkin_time,ci.actualpayment,m.member_name,r.room_name FROM checkin ci LEFT JOIN member m ON ci.member_no=m.member_no LEFT JOIN room r ON ci.room_no=r.room_no) a ON co.checkin_no=a.checkin_no) c ON b.checkout_no=c.checkout_no where (left(bill_time,4)+0>=?) and (left(bill_time,4)+0<=?) GROUP BY left(bill_time,4)";
		return dao.executeQueryForList(sql,new int[]{Types.INTEGER , Types.INTEGER},new Object[]{startyear,endyear});
	}
}
