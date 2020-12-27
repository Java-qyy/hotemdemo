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
		<title>旅客登记</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap-4.5.0-dist/css/bootstrap.min.css"/>
		<style type="text/css">
			#div1{
				width: 350px;
				margin: 0 auto;
			}
			#div2{
				width: 350px;
				margin: 0 auto;
			}
			button{
				margin-left: 75px;
			}
		</style>
	</head>
	<body>
	
	<table width="1000" border="0"  cellspacing="0" cellpadding="0" >
		
		<tr>
			<td>
			<%@ include file="/index.jsp"%>
			</td>
			<td>
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
		<div id="div1">
		<form name="form1" id="form" method="post" action="<%=request.getContextPath() %>/manage/lvkedengji.do?method=add" >
		  <div class="form-group">
		    <label>房间号</label>
		    	
		   <select name="roomname" class="form-control" id="fjh">
		   		<option name="roomname"  value="%">房间号</option>
		   <c:forEach var="map" varStatus="i"   items="${list}">
		   
		    	<option name="roomname" value="${map.room_name}">${map.room_name}</option>
			</c:forEach>
		    </select><div id="fjh-tishi"></div>
		  </div>
		 <div class="form-group">

			<div class="form-group">
			  <label>姓名</label>
			  <input type="text" class="form-control" id="name" name = "lkname"><div id="name-tishi"></div>
			</div>
			<div class="form-group">
			  <label>性别</label>
			  <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input  name="lksex" type="radio" id="sex" value="男"   />
						男
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input  name="lksex" type="radio" id="sex" value="女" />
						女
			</div>
			<div class="form-group">
			  <label>身份证号</label>
			   <input type="text" class="form-control" id="sfzh" name = "lkId" ><div id="sfz-tishi"></div>
			</div>
			<div class="form-group">
			  <label>邮箱:</label>
			  <input type="text" id="emil" class="form-control" name = "lkemail"><div id="emil-tishi"></div>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<!--<button type="button" id="submit" class="btn btn-primary">提交</button> -->
			<input type="submit" id="submit" class="btn btn-primary"  value="提交">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" value="返回" class="btn btn-primary"  onclick="window.location.href='<%=request.getContextPath()%>/manage/kfgl.do?method=query'">
				返回
			</button>
		  </div>
		  
		  	
		</form>
		</div>
			
			</div>
			
		</div>
			</td>
		</tr>
	</table>
	
	<script type="text/javascript">
		$(function(){
			
			$("#form").submit(function(){
				var pattern = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,
				str =$("#emil").val();
				 if(!pattern.test(str)){
					 alert("邮箱没有通过");
						$("#emil").css("border","red 1px solid");
						return false;
				 }else if($("#fjh").val()=="%"){
					alert("请选择您要的房间号");
					$("#fjh").css("border","red 1px solid");
					return false;
				}else if($("#name").val()==""){
					alert("请输入您的姓名");
					$("#name").css("border","red 1px solid");
					return false;
				}else if($("#sex").val()==""){
					alert("请输入您的性别");
					return false;
				}else if($("#sfzh").val()==""){
					alert("请输入身份号");
					$("#sfzh").css("border","red 1px solid");
					return false;
				}else if($("#emil").val()==""){
					alert("请输入邮箱");
					$("#emil").css("border","red 1px solid");
					return false;
				}else if($("#sfzh").val().length!=15&&$("#sfzh").val().length!=18){
					alert("身份号输入有误，请重新输入");
					$("#sfzh").css("border","red 1px solid");
					return false;
				}
				else{
					$("#form").submit();
				}
				
			})
			$("#fjh").focus(function(){
					$("#fjh").css("border","#ced4da 1px solid");
					
				})
				$("#name").focus(function(){
					$("#name").css("border","#ced4da 1px solid");
					
				})
				$("#sfzh").focus(function(){
					$("#sfzh").css("border","#ced4da 1px solid");
					
				})
				$("#emil").focus(function(){
					$("#emil").css("border","#ced4da 1px solid");
				})
				
		})
		
	</script>
	
	
	
	</body>
</html>
