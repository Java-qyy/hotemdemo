package com.rj.bd.hotel.manage.Filter;

import java.io.IOException;
import java.nio.file.Path;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter(filterName = "ServletFilter", urlPatterns = { "/manage/*" })  
public class ServletFilter implements Filter{

	@Override
	public void destroy() {
		System.out.println("已销毁");
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("ServletFilter--->开始运行...");
		
		//获取request和response对象
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		//针对特权页面进行放行
		String path = request.getServletPath();
		System.out.println("path:"+path);
		if(("/manage/lvkedengji.do".equals(path)) ||("/manage/kfgl.do".equals(path)) ||("/login.jsp".equals(path)) ||("/error.jsp".equals(path)) ||("/login.jsp".equals(path)) || ("/index.jsp".equals(path)) || ("/tgls/kfmanage/qiantaikefang.jsp".equals(path)) || ("/manage/pdpossword.do".equals(path))){
				
			chain.doFilter(request, response);
			return ; 
		}
		
		//过滤session 
		HttpSession session = request.getSession();
		
		System.out.println("过滤器:"+session.getAttribute("user"));
		if(session.getAttribute("user")==null){
			System.out.println("没登陆");
			String error = "您没有登陆，请登陆";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/error.jsp").forward(request, response);
			return ;  
		}else{
			System.out.println("放行");
			chain.doFilter(request, response);
			return ;
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("ServletFilter--->初始化成功");
		
	}

}
