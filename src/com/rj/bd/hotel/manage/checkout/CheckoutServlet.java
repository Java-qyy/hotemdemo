package com.rj.bd.hotel.manage.checkout;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @desc   退房的C层
 * @author 刘昊原
 * @time   2020-12-22 上午10:15:12
 * 
 */

@SuppressWarnings("serial")
public class CheckoutServlet extends HttpServlet {
	
	ICheckoutService checkoutService = new CheckoutServiceImpl();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		try {
			if (method.equals("query")) {
				this.query(request, response);
			} else if (method.equals("quit")) {
				this.quit(request, response);
			}
		} catch (ClassNotFoundException e) {
			System.out.println("异常的信息为:" + e.getMessage());
			System.out.println("异常发生的内存地址:" + e.getStackTrace());
		} catch (SQLException e) {
			System.out.println("异常的信息为:" + e.getMessage());
			System.out.println("异常发生的内存地址:" + e.getStackTrace());
		}
	}
	
	/**
	 * @desc 2.退房
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void quit(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException, ClassNotFoundException, SQLException {
		String checkout_no = request.getParameter("checkout_no");
		String room_no = request.getParameter("room_no");
		checkoutService.updateCheckoutById(checkout_no, room_no);
		response.sendRedirect(request.getContextPath() + "/manage/checkout.do?method=query");
	}
	
	/**
	 * @desc 1.查询
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		String key = request.getParameter("key");
		List<Map<String, Object>> list_checkout = checkoutService.queryCheckout(key);
		request.setAttribute("key", key);
		request.setAttribute("list_checkout", list_checkout);
		request.getRequestDispatcher("/tgls/tfserver/tuifang.jsp").forward(request, response);
	}
	
}
