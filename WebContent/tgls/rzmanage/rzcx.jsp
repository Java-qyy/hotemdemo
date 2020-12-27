<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
		<meta name="renderer" content="webkit">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
		<title>旅馆管理系统</title>
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico"/>
		<link rel="bookmark" href="<%=request.getContextPath()%>/images/favicon.ico"/>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/base.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/iconfont.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/framework/jquery-1.11.3.min.js" ></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/layui/css/layui.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.mCustomScrollbar.css">
		<script src="<%=request.getContextPath()%>/framework/jquery-ui-1.10.4.min.js"></script>
		<script src="<%=request.getContextPath()%>/framework/jquery.mousewheel.min.js"></script>
		<script src="<%=request.getContextPath()%>/framework/jquery.mCustomScrollbar.min.js"></script>
		<script src="<%=request.getContextPath()%>/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/frameStyle.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/framework/frame.js" ></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap-4.5.0-dist/css/bootstrap.min.css"/>
		<style type="text/css">
			body{
				margin-top: 10px;
				margin-left: 10px;
			}
		</style>
	</head>
	<body>
		<table>
			<tr>
				<td>
					<%@ include file="/houtai.jsp"%>
				</td>
				<td valign="top"  width="10000" >
					<div class="main">
						<div class="frameTop">
							<img class="jt" src="<%=request.getContextPath()%>/images/top_jt.png"/>
							<div class="topMenu">
								<ul>
									<li>
										<a href="<%=request.getContextPath()%>/xiugaimima.jsp">
											<i class="iconfont icon-xiugaimima"></i>
											修改密码
										</a>
									</li>
									<li>
										<a href="<%=request.getContextPath()%>/tgls/glymanage/addgly.jsp" >
											<i class="iconfont icon-yonghu1"></i>
											添加管理员
										</a>
									</li>
									<li>
										<a href="<%=request.getContextPath()%>/manage/kfgl.do?method=query">
											<i class="iconfont icon-084tuichu"></i>
											注销
										</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="frameMain">
							<div class="title" id="frameMainTitle">
							</div>
							<br>
							<form action="<%=request.getContextPath()%>/manage/lkcx.do?method=query" method="post">
								<div class="form-row align-items-center">
									<div class="col-auto">
										<input type="text" name="key" value="${key}" class="form-control mb-2" placeholder="客户姓名">
									</div>
									<div class="col-auto">
										<button type="submit" class="btn btn-primary mb-2">
											查询
										</button>
									</div>
								</div>
							</form>
							<table class="table table-sm">
								<thead>
									<tr>
										<th>
											姓名
										</th>
										<th>
											性别
										</th>
										<th>
											身份证号
										</th>
										<th>
											邮箱
										</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="map" varStatus="i" items="${list_lk}">
										<tr>
											<td width="1000" height="30">
												${map.member_name}
											</td>
											<td width="1000" height="30">
												${map.member_sex}
											</td>
											<td width="1000" height="30">
												${map.member_idnumber}
											</td>
											<td width="1000" height="30">
												${map.member_email}
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>