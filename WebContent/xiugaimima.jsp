<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<title>管理员修改密码界面</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap-4.5.0-dist/css/bootstrap.min.css"/>
		<style type="text/css">
			#div1{
				width: 350px;
				margin: 0 auto;
			}
			button{
				margin-left: 75px;
			}
		</style>
	</head>
	<body>
	<table  border="0"  cellspacing="0" cellpadding="0" >
		<tr>
			<td>
			<%@ include file="/houtai.jsp"%>
			</td>
			<td valign="top">
			<div class="main">
			<!-- 头部栏 - 开始 -->
			<div class="frameTop">
				<img class="jt" src="<%=request.getContextPath()%>/images/top_jt.png"/>
				<div class="topMenu">
					<ul>
						<li><a href="<%=request.getContextPath()%>/manage/gly.do?method=query" ><i class="iconfont icon-yonghu1"></i>管理员</a></li>
						<li><a href="<%=request.getContextPath()%>/manage/kfgl.do?method=query"><i class="iconfont icon-084tuichu"></i>注销</a></li>
					</ul>
				</div>
			</div>
			<!-- 头部栏 - 结束 -->
			
			<!-- 核心区域 - 开始 -->
			<div class="frameMain">
				<div class="title" id="frameMainTitle">
					
				</div>
			
			<br>
			
		<div id="div1">
		<form method="post" action="<%=request.getContextPath() %>/manage/gly.do?method=updateManager">
		   <div class="form-group">
		    <label for="password">管理员姓名</label>
		    <input type="text" name="mname" class="form-control" id="oldpassword" value="${map.administrator_name}">
		   
		  </div>
		  <div class="form-group">
		    <label for="password">原密码</label>
		    <input type="text" class="form-control" id="oldpassword" value="${map.administrator_password}">
		   
		  </div>
		  <div class="form-group">
		    <label for="password1">新密码</label>
		    <input type="password" name="newPassword" class="form-control" id="newpassword">
		  </div>
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  <button type="submit" class="btn btn-primary">提交</button>
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  <button type="button" class="btn btn-primary">返回</button>
		</form>
		</div>
			
			</div>
			
		</div>
			</td>
		</tr>
	</table>
	</body>
</html>
