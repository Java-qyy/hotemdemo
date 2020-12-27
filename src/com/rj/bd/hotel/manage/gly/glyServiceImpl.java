package com.rj.bd.hotel.manage.gly;


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
 * @desc 管理员模块的M层的实现类
 * @author LGZ
 * @time 2020-12-23
 */
public class glyServiceImpl implements glyService{
	
	Dao dao=new DaoImpl();


	@Override
	public void add(String gId, String gName, String gUserName, String gPassword, String gEmail,String virtualPath) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {

		String sql="INSERT INTO administrator VALUES(?,?,?,?,?,?)";
		int[] types=new int[6]; 
		types[0]=Types.VARCHAR;
		types[1]=Types.VARCHAR;
		types[2]=Types.VARCHAR;
		types[3]=Types.VARCHAR;
		types[4]=Types.VARCHAR;
		types[5]=Types.VARCHAR;
		Object[] values=new Object[6];
		values[0]=gId;
		values[1]=gName;
		values[2]=gUserName;
		values[3]=gPassword;
		values[4]=gEmail;
		values[5]=virtualPath;
		dao.executeUpdate(sql, types, values);
	}


	@Override
	public List<Map<String, Object>> queryAll() throws ClassNotFoundException, SQLException {
		String sql="select * from administrator";
		return dao.executeQueryForList(sql);
	}


	@Override
	public Map<String, Object> queryCode(String ucode) throws ClassNotFoundException, SQLException {
		String sql=" select * from administrator ";
		return dao.executeQueryForMap(sql);
	}


	@Override
	public Map<String, Object> queryById(String id) throws ClassNotFoundException, SQLException {
		String sql=" select * from administrator where administrator_no=?";
		return dao.executeQueryForMap(sql, new int[]{Types.VARCHAR}, new Object[]{id});
	}


	@Override
	public void update(String newPassword,String mname) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		String sql="UPDATE administrator SET administrator_password=? WHERE administrator_name=?";
		dao.executeUpdate(sql,new int[]{Types.VARCHAR,Types.VARCHAR}, new Object[]{newPassword,mname});
	}


	
	
	@Override
	public int pdid(String id) throws ClassNotFoundException, SQLException {
		
		return dao.executeQueryForInt("select COUNT(*) from administrator where administrator_no=?", new int[]{Types.VARCHAR}, new Object[]{id});
	}


	



	

	

		
	
	

}
