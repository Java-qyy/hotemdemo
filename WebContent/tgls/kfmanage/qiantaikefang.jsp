<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
		<!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
		<meta name="renderer" content="webkit">
		<!--国产浏览器高速模式-->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- 网站简介 -->
		<meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
		<title>旅馆管理系统</title>

		<!-- 公共样式 开始 -->
		
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico"/>
		<link rel="bookmark" href="<%=request.getContextPath()%>/images/favicon.ico"/>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/base.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/iconfont.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/framework/jquery-1.11.3.min.js" ></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/layui/css/layui.css">
	    <!--[if lt IE 9]>
	      	<script src="framework/html5shiv.min.js"></script>
	      	<script src="framework/respond.min.js"></script>
	    <![endif]-->
		<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
		<!-- 滚动条插件 -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.mCustomScrollbar.css">
		<script src="<%=request.getContextPath()%>/framework/jquery-ui-1.10.4.min.js"></script>
		<script src="<%=request.getContextPath()%>/framework/jquery.mousewheel.min.js"></script>
		<script src="<%=request.getContextPath()%>/framework/jquery.mCustomScrollbar.min.js"></script>
		<script src="<%=request.getContextPath()%>/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
		<!-- 公共样式 结束 -->
		
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/frameStyle.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/framework/frame.js" ></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap-4.5.0-dist/css/bootstrap.min.css"/>
		<style type="text/css">
			body{
				margin-top:10px;
				margin-left: 10px ;
			}
			#table1{
				font-family:Microsoft YaHei;
				font-size:20px;
				
			}
		</style>
	</head>
	<body>
	<table >
		<tr>
			<td valign="top">
			<%@ include file="/index.jsp"%>
			</td>
			<td valign="top" width="10000">
			
			<div class="main">
			<!-- 头部栏 - 开始 -->
			<div class="frameTop">
				<img class="jt" src="<%=request.getContextPath()%>/images/top_jt.png"/>
				<div class="topMenu">
					<ul>
						<li><a href="<%=request.getContextPath() %>/login.jsp" onclick="menuCAClick('denglu.html',this)"><i class="iconfont icon-yonghu1"></i>进入后台</a></li>
					</ul>
				</div>
			</div>
			<!-- 头部栏 - 结束 -->
			
			<!-- 核心区域 - 开始 -->
			<div class="frameMain">
				<div class="title" id="frameMainTitle">
					
				</div>
		<br>
		<!-- 
		<form>
		  <div class="form-row align-items-center">
		    <div class="col-auto">
		      <label class="sr-only" for="inlineFormInput">Name</label>
		      <input type="text" class="form-control mb-2"  placeholder="客房编号">
		    </div>
		    <div class="col-auto">
		      <button type="submit" class="btn btn-primary mb-2">查询</button>
		    </div>
		  </div>
		</form>
		 -->
		<table id="table1" class="table table-sm" align="center">
		  <thead>
		    <tr>
		      <td scope="col">客房类型</td>
		      <td scope="col">可住人数</td>
		      <td scope="col">价格</td>
		      <td scope="col">房间图片</td>
	          <td scope="col">剩余数量</td>
	          <td scope="col">操作</td>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach var="map" varStatus="i"   items="${list}">
		    <tr>
		      <td scope="row">${map.roomtype_type}</td>
		      <td>${map.roomtype_bednumber}</td>
		      <td>${map.roomtype_price}</td>
		      <td>
		     	 <img style="width:60px;height:60px" src="${map.roomtype_image}" />
		      </td>
			  <td>${map.c}</td>
			  <td>
			  	<button type="button" class="btn btn-primary" onclick="window.location.href='<%=request.getContextPath()%>/manage/lvkedengji.do?method=addPage&id=${map.roomtype_type}'">入住</button>
			  </td>
		    </tr>
		   </c:forEach>
	</table>
	</div>
			<!-- 核心区域 - 结束 -->
			
	</div>
			</td>
		</tr>
	</table>
	</body>
</html>
