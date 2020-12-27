package com.rj.bd.hotel.manage.bill;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import com.rj.bd.hotel.utils.ExcelUtils;

/**
 * @desc 账单模块的C层
 * @author LGZ
 * @time 2020-12-23 19:41
 */


@SuppressWarnings("serial")
public class billServlet extends HttpServlet{

	billService billService=new billServiceImpl();
	ExcelUtils excelUtils = new ExcelUtils();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method=request.getParameter("method");
		
		try {
			if ("query".equals(method)) {
				query(request,response);
			} else if (method.equals("doExportExcel")) {
				this.doExportExcel(request, response);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}	
	
	}
	
	/**
	 * @desc 2.导出
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	@SuppressWarnings("resource")
	private void doExportExcel(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ClassNotFoundException, SQLException {
		//0.接值：接list.jsp传递过来的查询条件的值
		String key = request.getParameter("key");
		String filename = "账单.xls";
	    excelUtils.settings(request, response, filename);
	    //1.获取数据
	    List<Map<String, Object>> list_bill = billService.queryBill(key);
	    //2.写入excel中
	    //2.1初始化poi的核心类，产生一个工作簿，并创建一个sheet，且命名
	    HSSFWorkbook workbook = new HSSFWorkbook();
	    String sheetname = "账单的详细信息";
		HSSFSheet sheet = workbook.createSheet(sheetname);
		//2.2设定表头
		String[] tableTop = {"账单编号", "账单时间", "退房编号", "退房时间", "入住编号", "入住时间", "消费金额", "会员名字", "房间名字"};
		String[] columnName = {"bill_no", "bill_time", "checkout_no", "checkout_time", "checkin_no", "checkin_time", "actualpayment", "member_name", "room_name"};
		//创建表头
		//创建第一行
		HSSFRow row = sheet.createRow(0);
		for (int i = 0; i < tableTop.length; i++) {
			row.createCell(i).setCellValue(tableTop[i]);
		}
		//2.3从第二行开始向表格中添加数据
		for (int i = 0; i < list_bill.size(); i++) {
			HSSFRow row02 = sheet.createRow(i + 1);
			//poi自带的解决表格中的数据自动适配宽度（对中文不太好使）
			sheet.autoSizeColumn(i, true);
			//取出list_bill中的map,其实就是数据库表中的一行数据
			Map<String, Object> map = list_bill.get(i);
			for (int k = 0; k < columnName.length; k++) {
				row02.createCell(k).setCellValue((String)map.get(columnName[k]));
			}
		}
		excelUtils.setColumnAutoAdapter(sheet, list_bill.size());
		//通过流写入到工作簿中
		OutputStream outputStream = response.getOutputStream();
		workbook.write(outputStream);
		outputStream.close();
	}

	/**
	 * @desc 1.查询账单
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) 
			throws ClassNotFoundException, SQLException, ServletException, IOException {
		String key = request.getParameter("key");
		List<Map<String,Object>> list_bill = billService.queryBill(key);
		//存值
		request.setAttribute("key", key);
		request.setAttribute("list_bill", list_bill);
		//转向
		request.getRequestDispatcher("/tgls/zdmanage/zhangdan.jsp").forward(request, response);
		
	}











	

}






















