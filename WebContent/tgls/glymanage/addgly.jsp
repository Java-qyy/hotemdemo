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
		<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
		<!-- 公共样式 结束 -->
		
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/frameStyle.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/framework/frame.js" ></script>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap-4.5.0-dist/css/bootstrap.min.css"/>
		<title>添加管理员页面</title>
		
		
		<script type="text/javascript">
		function imgPreview(fileDemo) {
				//alert("实现预览");  
				if (window.FileReader) {
					var fileReader=new FileReader();
				}
				else{
					//alert("您当前使用的设备不支持，请升级")
					return false;
				}
				//alert("继续");
				//通过js的组合选择器获取到文件域
				var file=fileDemo.files[0];
				//alert("file:"+file);
				//设定一个教验的正则表达式
				var imageType=/^image\//;
				if(!imageType.test(file.type))
				{
					alert("请选择图片");
					document.getElementById("spid").innerHTML="<input type=\"file\" name=\"image\"  onchange=\"imgPreview(this)\"   id=\"imgFile\"/>";
					//alert("文件选择已清空");
					return false;
				}
				fileReader.onload = function() //当文件域中读取完成之后才触发图片标签
			    {
			        //获取图片dom
			        var img = document.getElementById("image");
			        //图片路径设置为读取的图片
			        //alert("this--->"+this);//从弹框可以看出是FileReader对象
			        //alert("this.result--->"+this.result);//this.result可以看出是一个data开头的字符串，这段字符串的实质就是 Data URL
			        img.src = this.result;//相当于是为图片标签设置了src的url值
			    };
			    fileReader.readAsDataURL(file);//将文件域标签中的内容显示在图片标签的位置
				
			}
			
			</script>
			
			<style type="text/css">
			#img{
				float: left;
				height: 255px;
				width: 255px;
				
			}
			img{
				width: 100%;
				height: 100%;
			}
			#text{
				margin-left: 20px;
				float: left;
				
				height: 320px;
				width: 300px;
			}
			#button1{
				text-align: center;
				
			}
			#form{
				margin-top:100px;
				margin-left:150px;
				width: 580px;
				height: 350px;
			}
			#but{
				margin-right: 80px;
			}
			#yzm{
				width: 300px;
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
						<li><a href="<%=request.getContextPath()%>/manage/kfgl.do?method=query"><i class="iconfont icon-084tuichu"></i>注销</a></li>
					</ul>
				</div>
			</div>
			<!-- 头部栏 - 结束 -->
			<div class="frameMain">
				<div class="title" id="frameMainTitle">
					
				</div>
		<form  action="<%=request.getContextPath() %>/manage/gly.do?method=add" method="post"  id="form" enctype="multipart/form-data">
			<div id="img">
				<img id="image" style="width:255px;height:255px" src="<%=request.getContextPath()%>/images/login_bg1.jpg" class="rounded float-left">
			</div>
			
			<div id="text">
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default">ID</span>
				  </div>
				  <input name="gId" type="text" class="form-control" value=""  id="id" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default">姓名</span>
				  </div>
				  <input name="gName" type="text" id="name" class="form-control" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default">用户名</span>
				  </div>
				  <input type="text" name="gUserName"  id="user" class="form-control" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default">密码</span>
				  </div>
				  <input type="text" name="gPassword" id="password" class="form-control" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default">邮箱</span>
				  </div>
				  <input type="text" name="gEmail" id="gEmail" class="form-control" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				<div id="yzm" class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default">验证码</span>
				  </div>
				  <input name="gyzm" type="text" class="form-control" id="ucodes" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				  <button type="button"  id="submitemil" class="btn btn-primary" >
			  				发送验证码
			  	</button>
				</div>
			</div>
			<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroup-sizing-default">头像(请选择图片)</span>
				  </div>
				  <input type="file" name="gimage" onchange="imgPreview(this)" accept="image/*" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				
				
			<div id="anniu">
			</div>
			<div id="button1">
				<input type="button" id="but" class="btn btn-primary" value="添加"/>
				<input type="button" class="btn btn-primary" value="退出"/>
			</div>
			
		</form>
		</div>
		</div>
			</td>
		</tr>
	</table>
		
		
		<script type="text/javascript">
			
			$(function(){
				
				$("#submitemil").click(function(){
					var pattern = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,
					str =$("#gEmail").val();
					 if(!pattern.test(str)){
						alert("邮箱验证没通过")
						$("#gEmil").css("border","red 1px solid");
					}else{
						var email = $("#gEmail").val();
						
						var url = "<%=request.getContextPath()%>/manage/gly.do?method=email&gEmail="+email;
						$.post(url,{},function(data){
							var ucode = data;
						})
					}
					
				})
				
				$("#but").click(function(){
					
					var ids = $("#id").val()
					var url = "<%=request.getContextPath()%>/manage/gly.do?method=pdid";
					$.post(url,{id:ids},function(data){
						if(data>0){
							alert("id已存在");
							$("#id").attr("value"," ");
							$("#id").css("border","red 1px solid");
						}else if($("#id").val()==""){
							alert("请输入id");
							$("#id").css("border","red 1px solid");
						}else if($("#name").val()==""){
							alert("请输入您的姓名");
							$("#name").css("border","red 1px solid");
						}else if($("#user").val()==""){
							alert("请输入用户名");
							$("#user").css("border","red 1px solid");
						}else if($("#password").val()==""){
							alert("请输入密码");
							$("#password").css("border","red 1px solid");
						}else if($("#gEmil").val()==""){
							alert("请输入邮箱");
							$("#gEmil").css("border","red 1px solid");
						}else if($("#ucodes").val()==""){
							alert("请输入验证码");
							$("#ucodes").css("border","red 1px solid");
						}else{
							$("#form").submit();
						}
					})
					
				})
				
				$("#id").focus(function(){
					$("#id").css("border","#ced4da 1px solid");
				})
				$("#name").focus(function(){
					$("#name").css("border","#ced4da 1px solid");
				})
				$("#user").focus(function(){
					$("#user").css("border","#ced4da 1px solid");
				})
				$("#password").focus(function(){
					$("#password").css("border","#ced4da 1px solid");
				})
				$("#gEmail").focus(function(){
					$("#gEmail").css("border","#ced4da 1px solid");
				})
				$("#ucodes").focus(function(){
					$("#ucodes").css("border","#ced4da 1px solid");
				})
				
			})
		</script>
		
	</body>
</html>