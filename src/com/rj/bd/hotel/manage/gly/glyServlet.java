package com.rj.bd.hotel.manage.gly;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import com.rj.bd.hotel.utils.CodeUtils;
import com.rj.bd.hotel.utils.EmailUtils;





/**
 * @desc 管理员模块的C层
 * @author LGZ
 * @time 2020-12-23 
 */


@SuppressWarnings("serial")
public class glyServlet extends HttpServlet{

	
	
	glyService glyService=new glyServiceImpl();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		System.out.println("glyServlet--->service()");
		String method=request.getParameter("method");
		try {
			if ("query".equals(method)) {
				query(request,response);
			}
			else if("add".equals(method)) {
				add(request,response);
			}
			else if("download".equals(method)) {
				download(request,response);
			}
			else if("email".equals(method)) {
				email(request,response);
			}
			else if("editPage".equals(method)) {
				editPage(request,response);
			}
			else if("updateManager".equals(method)) {
				updateManager(request,response);
			}
			else if("pdid".equals(method)){
				this.pdid(request,response);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
			
	
	}
	
	
	

	/**
	 * @desc     判断id是否重复
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 */
	private void pdid(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		
		String id = request.getParameter("id");
		System.out.println(id);
		int idnum = glyService.pdid(id);
		String data = idnum+"";
		System.out.println("data : "+data);
		PrintWriter out = response.getWriter();
		out.write(data);
		out.flush();
		out.close();
		
	}




	/**
	 * @desc 保存修改信息
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 */
	private void updateManager(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		System.out.println("glyServlet--->editPage");
		//接值
		String newPassword=request.getParameter("newPassword");
		System.out.println("newPassword:"+newPassword);
		String mname=request.getParameter("mname");
		System.out.println("mname:"+mname);
		glyService.update(newPassword,mname);
		//重定向
		response.sendRedirect(request.getContextPath()+"/manage/gly.do?method=query");
	}




	/**
	 * @desc 进入管理员页面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	private void editPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		System.out.println("glyServlet--->editPage");
		String id=request.getParameter("id");
		System.out.println("id:"+id);
		Map<String, Object> map=glyService.queryById(id);
		request.setAttribute("map", map);
		//转向
		request.getRequestDispatcher("/xiugaimima.jsp").forward(request, response);
		
	}




	/**
	 * @desc 发送4位验证码
	 * @param request
	 * @param response
	 * @throws MessagingException 
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void email(HttpServletRequest request, HttpServletResponse response) throws MessagingException, ServletException, IOException {
		System.out.println("glyServlet--->email");
		//调用注册码工具类，产生注册码
		String ucode=CodeUtils.createdCode();
		//存值
		request.setAttribute("ucode", ucode);
		String data = ucode;
		PrintWriter out = response.getWriter();
		out.write(data);
		out.flush();
		out.close();	
		//接值
		String gEmail=request.getParameter("gEmail");
		System.out.println("gEmail:"+gEmail);
		//发邮件：带有注册码和激活链接的邮件
		EmailUtils.createMimeMessage(request,gEmail,ucode);
		
	}



	/**
	 * @desc  下载照片(利用外链)	
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void downloadOutsider(HttpServletRequest request,HttpServletResponse response) throws IOException{
		System.out.println("glyServlet--->downloadOutsider");
		//1.外链图片的网络资源地址
		//String imgUrl="https://www.baidu.com/img/bd_logo1.png";
		String imgUrl="https://hbimg.huabanimg.com/0cd238587a0984d24b8688ad35c187da3ace5314317c-KPcKiS_fw658/format/webp";
		//2.实例化‘
		URL url=new URL(imgUrl);
		//3.获取URLConnection对象
		URLConnection connection=url.openConnection();
		//4.利用urlConnection获取输入流对象
		InputStream inputStream=connection.getInputStream();
		//5.设定允许跨域访问
		response.setContentType("image/jpg"); //设置返回的文件类型   
		response.setHeader("Access-Control-Allow-Origin", "*");//设置该图片允许跨域访问
		//6.下载图片
		IOUtils.copy(inputStream, response.getOutputStream());
		
	}
	

	/**
	 * @desc 下载
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void download(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("glyServlet--->download");
		try {
			//接值
			String image_path=request.getParameter("image_path");
			//到本地项目中的路径
			String path=this.getServletContext().getRealPath("/")+"WEB-INF/image/";	
			//将服务器上的图片路径转换为文件
			File file=new File(path+image_path);
			//将文件转变为流
			FileInputStream fileInputStream=new FileInputStream(file);
			System.out.println("fileInputStream:"+fileInputStream);
			//设置返回的文件类型
			response.setContentType("image/jpg");
			//设置该图片允许跨域访问
			response.setHeader("Access-Control-Allow-Origin", "*");
			//利用commons-io.jar包中的方法实现根据文件输出流转换为图片
			IOUtils.copy(fileInputStream, response.getOutputStream());
		} catch (FileNotFoundException e) {
			downloadOutsider(request,response);
		}
	}



	/**
	 * @desc 保存添加的信息  和  图片的下载（把图片上传到服务器的文件夹内，然后数据库直接存储图片的地址）
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws FileNotFoundException 
	 * @throws ClassNotFoundException 
	 * @throws FileUploadException 
	 * 。
	 * @throws MessagingException 
	 * @throws ServletException 
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException, FileUploadException, MessagingException, ServletException {
		System.out.println("glyServlet--->add");
		
		
		//设定类型和编码
		response.setContentType("text/html;charset=utf-8");

		//声明变量
		String fileSavaName=null;//将来保存在服务器硬盘上的图片的名字
		List<FileItem> formItemList;//解析的上传页面的 表单元素的结果集合
		
		//设定图片保存在服务器上的路径
		String path = this.getServletContext().getRealPath("/") + "WEB-INF/image";
	    System.out.println("图片存储路径：" + path);
		
	    //根据路径名创建一个File实例，其目的是为了创建存储的路径目录
	    File file=new File(path);
	    if (!file.exists()) {
			file.mkdir();//创建image文件
		}
	    
	    //将请求消息实体中的每一个项目封装成单独的DiskFileItem (FileItem接口的实现) 对象的任务
        //直白的说就是将本次请求的request封装成DiskFileItemFactory对象
	    DiskFileItemFactory factory=new DiskFileItemFactory();
	    
	    //使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
	    ServletFileUpload upload=new ServletFileUpload(factory);
	    
	    //设定中文处理
	    upload.setHeaderEncoding("utf-8");
	    formItemList =upload.parseRequest(request);
	    if ((formItemList!=null)&&(formItemList.size()>0)) {
			for (FileItem Item : formItemList) {
				if (!Item.isFormField()) {
					System.out.println("--->"+Item);
					
					//获取上传图片的名字
					String fileName=Item.getName();
					System.out.println("上传文件的名字："+fileName);
					//获取后缀
					String prifix=fileName.substring(fileName.lastIndexOf(".")+1);
					System.out.println("上传文件的后缀："+prifix);
				
					//重新设定保存在服务器硬盘上的名字
					String id=UUID.randomUUID().toString();
					fileSavaName=id+"."+prifix;
					System.out.println("保存文件的名字:"+fileSavaName);
					
					//利用commons-io.jar包中的方法实现保存到硬盘上
					FileUtils.copyInputStreamToFile(Item.getInputStream(), new File(path+"/"+fileSavaName));
				
				}
			}
		}
	    //接值
  		String gId=formItemList.get(0).getString("utf-8");
  		String gName=formItemList.get(1).getString("utf-8");
  		String gUserName=formItemList.get(2).getString("utf-8");
  		String gPassword=formItemList.get(3).getString("utf-8");
  		String gEmail=formItemList.get(4).getString("utf-8");
		String virtualPath=fileSavaName;
		System.out.println("gId:"+gId+"\n"+"gName:"+gName+"\n"+"gUserName:"+gUserName+"\n"+"gPassword:"+gPassword+"\n"+"gEmail:"+gEmail);
		System.out.println("virtualPath:"+virtualPath);
		
		
		//调用M层的方法，添加数据
		glyService.add(gId,gName,gUserName,gPassword,gEmail,virtualPath);
		//重定向
		response.sendRedirect(request.getContextPath()+"/manage/gly.do?method=query");
		
		
		
	}

	
	/**
	 * @desc 查询管理员信息
	 * @param request
	 * @param response
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		System.out.println("glyServlet--->query");
		List<Map<String, Object>> list=glyService.queryAll();
		System.out.println("list:"+list);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/tgls/glymanage/glylist.jsp").forward(request, response);
	}




	

}






















