package com.rj.bd.hotel.manage.denglu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

public class PDPosswordServlet extends HttpServlet{

	IPDPosswordService pdpassword = new PDPosswordServiceImpl();
	HttpSession session ;
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		
		
		
		try {
			if("pd".equals(method)){
				this.pd(request,response);
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	/**
	 * @desc     判断输入的密码或者用户名正确
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void pd(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		
		String user = request.getParameter("userName");
		String password = request.getParameter("passWord");
		
		Map<String, Object> map = pdpassword.queryone(user,password);
		
		System.out.println("用户名id : "+map);
		request.setAttribute("urse",user);
		//设置session
		session = request.getSession();
		session.setAttribute("user", map);
	
		
		
		if(map!=null){
			String adid = (String) map.get("administrator_no");
			pdpassword.loginjilu(adid);
			String abc="1";
			PrintWriter out = response.getWriter();
			out.write(abc);
			out.flush();
			out.close();	
			response.sendRedirect(request.getContextPath()+"/tgls/kfgl.do?method=queryAll");
		}else{
			String abc="0";
			PrintWriter out = response.getWriter();
		
			out.write(abc);
	
			out.flush();
			out.close();	
		}
		
	}

	
	
}
