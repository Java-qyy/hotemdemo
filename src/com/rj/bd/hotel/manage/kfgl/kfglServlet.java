package com.rj.bd.hotel.manage.kfgl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * @desc 客房管理模块的C层
 * @author LGZ
 * @time 2020-12-22 15:59
 */


@SuppressWarnings("serial")
public class kfglServlet extends HttpServlet{

	
	
	IkfglService ikfgService=new kfglServiceImpl();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		System.out.println("kfglServlet--->service()");
		String method=request.getParameter("method");
		try {
			if ("query".equals(method)) {
				this.query(request,response);
			}
			else if ("queryAll".equals(method)) {  
				this.queryAll(request,response);
			}
			else if ("add".equals(method)) {
				this.add(request,response);
			}
			else if ("delete".equals(method)) {
				this.delete(request,response);
			}
		} catch (ClassNotFoundException e) {
			System.out.println("类没有找到异常...");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("sql异常...");
			e.printStackTrace();
		}
			
	
	}
	





	/**
	 * @desc 批量删除&级联删除
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		System.out.println("kfglServlet------>delete");
		
		//接值
		String[] delIdArray = request.getParameterValues("delIdArray");
		
		if(delIdArray!=null){
			for (String string : delIdArray) {
				System.out.println(string);
			}
			
			//2。调用方法删除
			ikfgService.deleteByIdArray(delIdArray);
		}
		
		
		
		//3重定向
		response.sendRedirect(request.getContextPath()+"/manage/kfgl.do?method=queryAll");
				
	}






	/**
	 * @desc 3.添加客房
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		
		System.out.println("kfglServlet------>add");   

		String roomtype_no  = request.getParameter("roomtype_no");  
		System.out.println("roomtype_no"+roomtype_no);
		
		String room_name  = request.getParameter("room_name");  
		System.out.println("room_name:"+room_name);
		

		String room_phone  = request.getParameter("room_phone");  
		System.out.println("room_phone"+room_phone);
		
//		String checkin_time  = request.getParameter("checkin_time");  
//		System.out.println("时间"+checkin_time);
		
		//保存
		ikfgService.save(roomtype_no,room_name,room_phone);
		
		response.sendRedirect(request.getContextPath()+"/manage/kfgl.do?method=queryAll");
	}





	/**
	 * @desc 2.后台查询所有  / 后台客房查询客房编号所对应的数据
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void queryAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		String roomtype_no = request.getParameter("roomtype_no");
		String roomtype = request.getParameter("roomtypes");
		if(roomtype_no==null){
			roomtype_no="";
		}
		if(roomtype==null){
			roomtype="";
		}
		System.out.println("roomtype:"+roomtype);
		System.out.println("roomtype_no:"+roomtype_no);
		System.out.println("kfglServlet--->queryAll");
		List<Map<String, Object>> listAll=ikfgService.queryAll(roomtype_no);
		System.out.println("listAll:"+listAll);
		List<Map<String, Object>> listAll1=ikfgService.queryAll1(roomtype);
		System.out.println("listAll1:"+listAll1);
		//存值
		request.setAttribute("listAll", listAll);
		request.setAttribute("listAll1", listAll1);
		request.setAttribute("roomtype_from", roomtype);
		request.setAttribute("roomtype_no_from", roomtype_no);
		request.getRequestDispatcher("/tgls/kfmanage/kefangselect.jsp").forward(request, response);
		
	}

	/**
	 * @desc 1.前台查看客房
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		//1.调用M层查询
		System.out.println("kfglServlet--->query");
    	List<Map<String, Object>> list=ikfgService.query();
    	System.out.println("list:"+list);
		//2.存值
		request.setAttribute("list", list);
		//3.转向
		request.getRequestDispatcher("/tgls/kfmanage/qiantaikefang.jsp").forward(request, response);
		
		
	}

}






















