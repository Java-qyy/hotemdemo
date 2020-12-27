package com.rj.bd.hotel.manage.denglu;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

public interface IPDPosswordService {

	Map<String, Object> queryone(String user, String password) throws ClassNotFoundException, SQLException;

	void loginjilu(String adid) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException;

	

}
