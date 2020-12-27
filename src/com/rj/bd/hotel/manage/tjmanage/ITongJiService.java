package com.rj.bd.hotel.manage.tjmanage;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ITongJiService {

	List<Map<String, Object>> queryZhi(String startyear,String endyear) throws ClassNotFoundException, SQLException;

}
