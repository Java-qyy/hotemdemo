<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
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
			<td valign="top" width="10000">
			<!-- 左侧菜单 - 结束 -->
		
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
	
		<form method="post" action="<%=request.getContextPath() %>/manage/kfgl.do?method=queryAll">
			<div class="form-row align-items-center">
				<div class="col-auto" style="margin-bottom: 8px">
		      <label class="sr-only" for="inlineFormInput">Name</label>
		      
		      <select id="roomtype"  name="roomtypes" class="form-control" >
		      <% 
		      
		      String roomtype_from = (String)request.getAttribute("roomtype_from");
		    	System.out.println(roomtype_from);
		      %>
					<option value="%"  <%=("%".equals(roomtype_from)?"selected":"") %>> 
						客房类型
					</option>
					<option value="rt001" <%=("rt001".equals(roomtype_from)?"selected":"") %>>
						标准房
					</option>
					<option value="rt002"  <%=("rt002".equals(roomtype_from)?"selected":"") %>>
						大床房
					</option>
					<option value="rt003" <%=("rt003".equals(roomtype_from)?"selected":"") %>>
						商务标准房
					</option>
					<option value="rt004" <%=("rt004".equals(roomtype_from)?"selected":"") %>>
						商务大床房
					</option>
					<option value="rt005" <%=("rt005".equals(roomtype_from)?"selected":"") %>>
						家庭三人房
					</option>
		    </select>
		    
		    
		      
		    </div>
		    <div class="col-auto" style="margin-bottom: 8px">
			    <select name="roomtype_no" class="form-control"  >
						<option value="%">客房编号</option>
						<%
												 String room_no=(String)request.getAttribute("roomtype_no_from");
												 List listAll=(List)request.getAttribute("listAll1");
												  for(int i =0;i<listAll.size();i++){
													
													  Map map=(Map)listAll.get(i);
													  String room_name=(String)map.get("room_name");
													  
												%>
												
												<option value="<%=room_name%>"   <%=(room_name.equals(room_no)?"selected":"")%> > <%=room_name%></option>
												
												<%}%>
			    </select>
		    </div>
		    
		    <div class="col-auto">
		      <button type="submit" class="btn btn-primary mb-2">查询</button>
		    </div>
		  </div>
		</form>
		<form name="kefangForm" action="<%=request.getContextPath() %>/manage/kfgl.do?method=delete" method="post">
		<table class="table table-sm">
		  <thead>
		    <tr>
		      <th scope="col">客房名字</th>
		      <th scope="col">客房类型</th>
		      <th scope="col">客房可住人数</th>
		      <th scope="col">客房价格</th>
		      <th scope="col">客房状态</th>
	          <th scope="col">客房电话</th>
	          <td scope ="col">选项</td>
		    </tr>
		  </thead>
		  <tbody>
		   <c:forEach var="map" varStatus="i"   items="${listAll}">
		    <tr>
		      <td>${map.room_name}</td>
		      <td>${map.roomtype_type}</td>
		      <td>${map.roomtype_bednumber}</td>
			  <td>${map.roomtype_price}</td>
			  <td>${map.room_state}</td>
			  <td>${map.room_phone}</td>
			  <c:choose>
			  <c:when test="${map.room_state eq '已占用'}">
			  <td ><input type="checkbox" name="delIdArray" value="${map.room_no}" class="noborder" disabled="disabled"></td>
			  </c:when>
			  <c:otherwise>
			  <td ><input type="checkbox" name="delIdArray" value="${map.room_no}" class="noborder"></td>
			  </c:otherwise>
			  </c:choose>
		    </tr>
		   </c:forEach>
	</table>

	
	<table width="94%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="60%" height="24">&nbsp;</td>
			<td width="40%" align="right">
				<input name="checkbox" type="checkbox" class="noborder" onClick="CheckAll(kefangForm.delIdArray,kefangForm.checkbox)" />
			
			
			
			
			
				
				[全选/反选] 
				[<a style="color: red; cursor: hand;" onClick="checkdel(kefangForm.delIdArray,kefangForm)">删除</a>]
				<!--层ch用于放置隐藏的checkbox控件，因为当表单中只是一个checkbox控件时，应用javascript获得其length属性值为undefine-->	
				<div id="ch" style="display:none">
					<input name="delid" type="checkbox" class="noborder" value="0" />
				</div>
			</td>
		</tr>
	</table>
	
	
	</form>
	
	
	</div>
				

	</div>
				

	
	</div>		

			</div>
			</td>
		</tr>
	</table>
	
	<script type="text/javascript">
	window.onload = function () {
		
        document.getElementById("roomtype").addEventListener('change',function(){
        	var roomtype1 = $("#roomtype").val();
			//alert(roomtype1);
        	var url = "<%=request.getContextPath()%>/manage/kfgl.do?method=queryAll&roomtypes="+roomtype1;
        	//alert(url);
        	window.location.href=encodeURI(url);
        },false);
    }
	
	
	
	
	function CheckAll(elementsA, elementsB) {
		for (i = 0; i < elementsA.length; i++) {
			elementsA[i].checked = true;
		}
		if (elementsB.checked == false) {
			for (j = 0; j < elementsA.length; j++) {
				elementsA[j].checked = false;
			}
		}
	}
	
	
	//判断用户是否选择了要删除的记录，如果是，则提示“是否删除”；否则提示“请选择要删除的记录”
			function checkdel(delid, formname) {
				var flag = false;
				for (var i = 0; i < delid.length; i++) {
					if (delid[i].checked) {
						flag = true;
						break;
					}
				}
				if (!flag) {
					alert("请选择要删除的记录！");
					return false;
				} else {
					if (confirm("确定要删除吗？")) {
						formname.submit();
					}
				}
			}
	
	</script>
	
	
	
	</body>
</html>
