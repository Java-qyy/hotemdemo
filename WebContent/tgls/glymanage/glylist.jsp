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
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap-4.5.0-dist/css/bootstrap.min.css"/>
		<title>管理员页面</title>
		
		<style type="text/css">
				body{
					margin-top:10px;
					margin-left: 10px ;
				}
			</style>
			
	</head>
	<body>
	<table>
		<tr>
			<td>
				<%@ include file="/houtai.jsp"%>
			</td>
			<td>
			
			<div class="main">
			<!-- 头部栏 - 开始 -->
			<div class="frameTop">
				<div class="topMenu">
					<ul>
						<li><a href="<%=request.getContextPath()%>/tgls/glymanage/addgly.jsp" ><i class="iconfont icon-yonghu1"></i>添加管理员</a></li>
						<li><a href="<%=request.getContextPath()%>/manage/kfgl.do?method=query"><i class="iconfont icon-084tuichu"></i>注销</a></li>
					</ul>
				</div>
			</div>
			<!-- 头部栏 - 结束 -->
			<div class="frameMain">
				<div class="title" id="frameMainTitle">
					
				</div>
				<br>
			<table class="table table-sm" >
			  <thead>
			    <tr>
			      <td scope="col" style="text-align:center;vertical-align:middle;">姓名</td>
			      <td scope="col" style="text-align:center;vertical-align:middle;">照片</td>
			      <td scope="col" style="text-align:center;vertical-align:middle;">操作</td>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach var="map" varStatus="i"   items="${list}">
			    <tr>
			      <td style="text-align:center;vertical-align:middle;">${map.administrator_name}</td>
			      <td style="text-align:center;vertical-align:middle;"><img  style="width:100px;height:120px"src="<%=request.getContextPath()%>/manage/gly.do?method=download&image_path=${map.image_path}"/></td>
			      <td style="text-align:center;vertical-align:middle;">
			      	<button type="button" class="btn btn-info btn-sm" onclick="window.location.href='<%=request.getContextPath()%>/manage/gly.do?method=editPage&id=${map.administrator_no}'">
			      		修改
			      	</button>
			      </td>
			    </tr>
			   </c:forEach>
			  </tbody>
			</table><hr >
		</div>
		</div>
			</td>
		</tr>
	</table>
		
		
	</body>
</html>