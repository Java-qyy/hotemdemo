package com.rj.bd.hotel.manage.lkcx;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class LKServlet extends HttpServlet {
	ILKService lkservice = new LKServiceImpl();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		
		try {
			if("query".equals(method)){
				this.query(request, response);
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		
	}

	


	/**
	 * @desc    查询全部
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		String key = request.getParameter("key");
		List<Map<String, Object>> list_lk = lkservice.queryAll(key);
		request.setAttribute("key", key);
		request.setAttribute("list_lk", list_lk);
		request.getRequestDispatcher("/tgls/rzmanage/rzcx.jsp").forward(request, response);
	}

	
	
}
