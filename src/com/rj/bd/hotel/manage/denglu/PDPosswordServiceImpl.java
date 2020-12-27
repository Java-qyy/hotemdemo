package com.rj.bd.hotel.manage.denglu;


import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import com.rj.bd.hotel.dao.Dao;
import com.rj.bd.hotel.dao.DaoImpl;
import com.rj.bd.hotel.utils.Dates;

public class PDPosswordServiceImpl implements IPDPosswordService{
Dao dao= new DaoImpl();

@Override
public Map<String, Object> queryone(String user, String password) throws ClassNotFoundException, SQLException {
	
	return dao.executeQueryForMap("select administrator_no from administrator where administrator_username=? and administrator_password=?", new int[]{Types.VARCHAR,Types.VARCHAR}, new Object[]{user,password});
}



@Override
public void loginjilu(String adid) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
	String date = Dates.CurrentYMDHSMTime();
	dao.executeUpdate("insert into loginlog values(?,?,?)", new int[]{Types.VARCHAR,Types.VARCHAR,Types.VARCHAR}, new Object[]{UUID.randomUUID().toString(),adid,date});
}
	

}
