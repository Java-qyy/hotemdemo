package com.rj.bd.hotel.manage.kfgl;


import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.rj.bd.hotel.dao.Dao;
import com.rj.bd.hotel.dao.DaoImpl;



/**
 * @desc 客房管理模块的M层的实现类
 * @author LGZ
 * @time 2020-12-22-15:57
 */
public class kfglServiceImpl implements IkfglService{
	
	Dao dao=new DaoImpl();

	@Override
	public List<Map<String, Object>> query() throws ClassNotFoundException, SQLException {
		String sql="SELECT  t.roomtype_type,t.roomtype_bednumber,t.roomtype_price,t.roomtype_image,sum(r.room_state='空闲') c FROM roomtype t,room r WHERE t.roomtype_no=r.roomtype_no GROUP BY t.roomtype_type";
		return dao.executeQueryForList(sql);
	}

	@Override
	public List<Map<String, Object>> queryAll(String roomtype_no) throws ClassNotFoundException, SQLException {
		String sql="SELECT r.room_no,r.room_name,r.room_state,r.room_phone,t.roomtype_type,t.roomtype_bednumber,t.roomtype_price FROM roomtype t,room r WHERE t.roomtype_no=r.roomtype_no and r.room_name like ?";
		return dao.executeQueryForList(sql,new int[]{Types.VARCHAR},new Object[]{"%"+roomtype_no+"%"});
	}

	@Override
	public void save( String roomtype_no, String room_name, String room_phone)
			throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		dao.executeUpdate(" insert into room values(?,?,?,?,?) ", new int []{Types.VARCHAR,Types.VARCHAR,Types.VARCHAR,Types.VARCHAR,Types.VARCHAR}, new Object[]{UUID.randomUUID().toString(),roomtype_no,room_name,"空闲",room_phone});

	}

	@Override
	public List<Map<String, Object>> queryAll1(String roomtype) throws ClassNotFoundException, SQLException {
		String sql="SELECT r.room_no,r.room_name,r.room_state,r.room_phone,t.roomtype_type,t.roomtype_bednumber,t.roomtype_price FROM roomtype t,room r WHERE t.roomtype_no=r.roomtype_no and r.roomtype_no like ?";
		return dao.executeQueryForList(sql,new int[]{Types.VARCHAR},new Object[]{"%"+roomtype+"%"});
	}

	@Override
	public void deleteByIdArray(String[] delIdArray) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		
		for(int i =0;i<delIdArray.length;i++)
		{
			
			String sql1 = "delete from checkin where room_no =?";	
			String sql2 = "delete from room where room_no =?";
			
			
			
			//String sql3 = "delete from room where room_name =?";
			
			dao.executeUpdate(sql1, new int[]{Types.VARCHAR}, new Object[]{delIdArray[i]});

			dao.executeUpdate(sql2, new int[]{Types.VARCHAR}, new Object[]{delIdArray[i]});
		
		
		}



	
	}
	

		
	
	

}
