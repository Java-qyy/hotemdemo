package com.rj.bd.hotel.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @desc     项目接口	
 */
public interface DemoInterfaceUtils{
	
	//查询一条
	void queryone(HttpServletRequest request, HttpServletResponse response);

	
	//添加数据
	void edited(HttpServletRequest request, HttpServletResponse response);

	
	//打开添加页面
	void edit(HttpServletRequest request, HttpServletResponse response);
	
	
	//删除数据
	void delete(HttpServletRequest request, HttpServletResponse response);
	
	
	//下载
	void download(HttpServletRequest request, HttpServletResponse response);

	
	//上传
	void upload(HttpServletRequest request, HttpServletResponse response);
	
	
	//打开添加页面
	void add(HttpServletRequest request, HttpServletResponse response);
	
	
	//添加数据
	void added(HttpServletRequest request, HttpServletResponse response);
	
	
	//查询全部
	void query(HttpServletRequest request, HttpServletResponse response);
	
	
	//导入
	void doImportExcel(HttpServletRequest request, HttpServletResponse response);


	//导出
	void doExportExcel(HttpServletRequest request, HttpServletResponse response);

}
