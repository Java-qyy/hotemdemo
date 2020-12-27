package com.rj.bd.hotel.manage.lvkedengji;


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
 * @desc 旅客登记模块的M层的实现类
 * @author LGZ
 * @time 2020-12-23
 */
public class lvkedengjiServiceImpl implements lvkedengjiService{
	
	Dao dao=new DaoImpl();

	@Override
	public List<Map<String, Object>> query(String roomtype_type) throws ClassNotFoundException, SQLException {
		String sql="SELECT r.room_name FROM room r,roomtype t WHERE r.roomtype_no=t.roomtype_no AND t.roomtype_type=? AND r.room_state='空闲'";

		//'"+roomtype_type+"'
		return dao.executeQueryForList(sql, new int[]{Types.VARCHAR}, new Object[]{roomtype_type});
	}

	@Override
	public void add(String lkname, String lksex, String lkId, String lkemail, String roomname) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		//在客户信息表添加客户信息
		String sql="INSERT  INTO member VALUES (?,?,?,?,?)";
		int[] types = new int[5];
		types[0] = Types.VARCHAR;
		types[1] = Types.VARCHAR;
		types[2] = Types.VARCHAR;
		types[3] = Types.VARCHAR;
		types[4] = Types.VARCHAR;
		Object[] values = new Object[5];
		values[0] = UUID.randomUUID().toString();
		values[1] = lkname;
		values[2] = lksex;
		values[3] = lkId;
		values[4] = lkemail;
		dao.executeUpdate(sql, types, values);
		
		//在入住信息表添加数据
		String sql1="INSERT  INTO checkin VALUES(?,(SELECT room.room_no FROM room WHERE room.room_name=?),(SELECT member.member_no FROM member WHERE member.member_name=?),?,(SELECT roomtype.roomtype_price FROM roomtype,room WHERE roomtype.roomtype_no=room.roomtype_no AND room.room_name=?))";
		int[] types1 = new int[5];
		types1[0] = Types.VARCHAR;
		types1[1] = Types.VARCHAR;
		types1[2] = Types.VARCHAR;
		types1[3] = Types.VARCHAR;
		types1[4] = Types.INTEGER;
		Object[] values1 = new Object[5];
		values1[0] = UUID.randomUUID().toString();
		values1[1] = roomname;
		values1[2] = lkname;
		values1[3] = Dates.CurrentYMDHSMTime();
		values1[4] = roomname;
		dao.executeUpdate(sql1, types1, values1);
		
		//修改被入住信息的客房的状态
		String sql2="UPDATE room SET room_state='已占用' WHERE room_name=?";
		dao.executeUpdate(sql2,new int[]{Types.VARCHAR},new Object[]{roomname});
		
		//入住的时候在退房信息表添加一条没有退房时间的数据
		String sql3="INSERT INTO checkout(checkout_no,checkin_no) VALUES (?,(SELECT checkin_no FROM checkin WHERE member_no= (SELECT member_no FROM member WHERE member_idnumber=?)))";
		dao.executeUpdate(sql3, new int[]{Types.VARCHAR,Types.VARCHAR},new Object[]{UUID.randomUUID().toString(),lkId});
	}

	



	

	

		
	
	

}
