package com.rj.bd.hotel.manage.lvkedengji;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * @desc 旅客登记模块的C层
 * @author LGZ
 * @time 2020-12-23 
 */


@SuppressWarnings("serial")
public class lvkedengjiServlet extends HttpServlet{

	
	
	lvkedengjiService lvkedengjiService=new lvkedengjiServiceImpl();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		System.out.println("lvkedengjiServlet--->service()");
		String method=request.getParameter("method");
		
		try {
			if ("addPage".equals(method)) {
				addPage(request,response);
			}
			else if ("add".equals(method)) {
				add(request,response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		
			
	
	}

	/**
	 * @desc 2.保存添加的信息
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		System.out.println("lvkedengjiServlet--->add");
		//接值
		String lkname=request.getParameter("lkname");
		String lksex=request.getParameter("lksex");
		String lkId=request.getParameter("lkId");
		String lkemail=request.getParameter("lkemail");
		String roomname=request.getParameter("roomname");
		System.out.println("lkname:"+lkname);
		System.out.println("lksex:"+lksex);
		System.out.println("lkId:"+lkId);
		System.out.println("lkemail:"+lkemail);
		System.out.println("roomname:"+roomname);
		lvkedengjiService.add(lkname,lksex,lkId,lkemail,roomname);
		//重定向
		response.sendRedirect(request.getContextPath()+"/manage/kfgl.do?method=query");
	}

	/**
	 * @desc 1.转向到添加页面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void addPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		System.out.println("lvkedengjiServlet--->addPage");
		//接值
		String roomtype_type=request.getParameter("id");
		System.out.println("roomtype_type:"+roomtype_type);
		//调用m层
		List<Map<String, Object>> list=lvkedengjiService.query(roomtype_type);
		System.out.println("list:"+list);
		//存值
		request.setAttribute("list", list);
		request.getRequestDispatcher("/tgls/rzmanage/xinxidenglu.jsp").forward(request, response);
	}
	










	

}






















