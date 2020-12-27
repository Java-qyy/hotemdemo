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
		<link rel="stylesheet" type="<%=request.getContextPath()%>/text/css" href="layui/css/layui.css">
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
				margin-top:10px;
				margin-left: 10px;
			}
			#div1{
				height:46px;
			}
		</style>
		<script language="javascript">
			exportExcel = function () {
				var key = document.getElementById("key").value;
				var url = "<%=request.getContextPath()%>/manage/bill.do?method=doExportExcel&key=" + key + "";
				window.location.href = encodeURI(url);
			}
		</script>
	</head>
	<body>
		<table>
			<tr>
				<td>
					<%@ include file="/houtai.jsp"%>
				</td>
				<td valign="top" width="10000">
					<div class="main">
						<!-- 头部栏 - 开始 -->
						<div class="frameTop">
							<img class="jt" src="<%=request.getContextPath()%>/images/top_jt.png"/>
							<div class="topMenu">
								<ul>
									<li>
										<a href="<%=request.getContextPath()%>/manage/gly.do?method=query" >
											<i class="iconfont icon-yonghu1"></i>管理员
										</a>
									</li>
									<li>
										<a href="<%=request.getContextPath()%>/manage/kfgl.do?method=query">
											<i class="iconfont icon-084tuichu"></i>注销
										</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- 头部栏 - 结束 -->
						<!-- 核心区域 - 开始 -->
						<div class="frameMain">
							<div class="title" id="frameMainTitle">
							</div>
							<br>
							<form action="<%=request.getContextPath()%>/manage/bill.do?method=query" method="post">
								<div id="div1" class="form-row align-items">
									<div class="col-auto">
										<input type="text" id="key" name="key" class="form-control mb-6" value="${key}" placeholder="客户姓名">
									</div>
									<div class="col-auto">
										<button type="submit" class="btn btn-primary mb-3">
											查询
										</button>
									</div>
									<div class="col-auto">
										<button type="button" class="btn btn-primary mb-3" onclick="exportExcel();">
											导出
										</button>
									</div>
								</div>
							</form>
							<table class="table table-sm">
								<thead>
									<tr>
										<th scope="col">
											客房名字
										</th>
										<th scope="col">
											客户姓名
										</th>
										<th scope="col">
											消费金额
										</th>
										<th scope="col">
											账单生成时间
										</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="map" varStatus="i" items="${list_bill}">
										<tr>
											<td>
												${map.room_name}
											</td>
											<td>
												${map.member_name}
											</td>
											<td>
												${map.actualpayment}
											</td>
											<td>
												${map.bill_time}
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

