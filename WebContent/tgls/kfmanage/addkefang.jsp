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
		<title>添加客房信息界面</title>
	</head>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap-4.5.0-dist/css/bootstrap.min.css"/>
	<style type="text/css">
			#div1{
				width: 350px;
				height:100%;
				margin: 0 auto;
			}
			button{
				margin-left: 75px;
			}
			#kfjg{
				width: 150px;
				height: 70px;
			}
			#kfjg1
			{
				
				width: 100px;
			}
			#yuan{
				position: relative;
				top: -30px;
				left: 110px;
			}
			<script>
				function jump(){
				 window.location.href="http://www.baidu.com/";
				}
</script>
		</style>
	</head>
	<body>
		<table width="700" border="0"  cellspacing="0" cellpadding="0" >
			<tr>
				<td valign="top">
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
						<form method="post" action="<%=request.getContextPath() %>/manage/kfgl.do?method=add" id="form1">
							<div class="form-group">
		   						<label>
		   							客房类型
		   						</label>
		    					<select name="roomtype_no" class="form-control" id="kftype">
		     						<option value="%">
		     							客房类型
		     						</option>
		    						<option value="rt001">
		    							标准房
		    						</option>
		    						<option value="rt002">
		    							大床房
		    						</option>
		    						<option value="rt003">
		    							商务标准房
		    						</option>
		    						<option value="rt004">
		    							商务大床房
		    						</option>
		    						<option value="rt005">
		    							家庭三人房
		    						</option>
		    					</select>
		    				</div>
		  					<div class="form-group" >
		  						<label>
		  							客房名字
		  						</label>
		    					<div>
		    						<input type="text" class="form-control" id="room_name" name="room_name">
		    					</div>
		    				</div>
		  					<div class="form-group">
		  						<label>
		  							客房电话
		  						</label>
		    					<input type="text" class="form-control" id="room_phone" name="room_phone">
		    				</div>
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  					<button type="submit" id="submit" class="btn btn-primary">
		  						提交
		  					</button>
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  				<button type="button" value="返回" class="btn btn-primary"  onclick="window.location.href='<%=request.getContextPath()%>/manage/kfgl.do?method=queryAll'">
			  					返回
			  				</button>
		  						
		  				</form>
					</div>
					</div>
			
		</div>
				</td>
			</tr>
		</table>
	</body>
	
	<script type="text/javascript">
	$(function(){
		$("#form1").submit(function(){
			
			if($("#kftype").val()=="%"){
				alert("请选择您要的客房类型");
				$("#kftype").css("border","red 1px solid");
				return false;
			}else if($("#room_name").val()==""){
				alert("请输入房间号");
				$("#room_name").css("border","red 1px solid");
				return false;
			}else if($("#room_phone").val()==""){
				alert("请输入房间电话");
				$("#room_phone").css("border","red 1px solid");
				return false;
			}else{
				$("#form1").submit();
			}
		})
				$("#kftype").focus(function(){
					$("#kftype").css("border","#ced4da 1px solid");
					
				})
				$("#room_name").focus(function(){
					$("#room_name").css("border","#ced4da 1px solid");
					
				})
				$("#room_phone").focus(function(){
					$("#room_phone").css("border","#ced4da 1px solid");
					
				})
	})
	</script>
	
	
</html>

