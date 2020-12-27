package com.rj.bd.hotel.manage.tjmanage;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class TongJiServlet extends HttpServlet{

	ITongJiService tongJiService = new TongJiServiceImpl();
	
	@Override
	protected void service(HttpServletRequest request , HttpServletResponse response ) throws ServletException, IOException {
		
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String method = request.getParameter("method");
		
		try {
			if("queryyear".equals(method)){
				
			}else if("query".equals(method)){
				this.query(request,response);
			}else if("ceshi".equals(method)){
				this.ceshi(request,response);
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
	}

	
	private void ceshi(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, JsonGenerationException, JsonMappingException, IOException, ServletException {
		String startyear = request.getParameter("startyear");
		String endyear = request.getParameter("endyear");
		System.out.println(startyear);
		System.out.println(endyear );
		 List<Map<String, Object>> list = tongJiService.queryZhi(startyear, endyear);
		
	    ObjectMapper mapper = new ObjectMapper();
	    String json = mapper.writeValueAsString(list);
		System.out.println(json);
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().write(json);
		

	}


	/**
	 * @desc    定义初值
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		List<Map<String , Object>> list = tongJiService.queryZhi("2019","2021");
		request.setAttribute("list",list);
		request.setAttribute("tx", "%");
		request.setAttribute("lx", "%");
		request.setAttribute("startyear", "");
		request.setAttribute("endyear", "");
		System.out.println(list);
		request.getRequestDispatcher("/tgls/tjmanage/tongji.jsp").forward(request, response);
	}



	
	
}
