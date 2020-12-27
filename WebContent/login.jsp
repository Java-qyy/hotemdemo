<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
		<!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
		<meta name="renderer" content="webkit">
		<!--国产浏览器高速模式-->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>管理员登陆</title>

		<!-- 公共样式 开始 -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/bootstrap-4.5.0-dist/css/bootstrap.min.css"/>
		<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/favicon.ico"/>
		<link rel="bookmark" href="<%=request.getContextPath() %>/images/favicon.ico"/>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/base.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/iconfont.css">
		<script type="text/javascript" src="<%=request.getContextPath() %>/framework/jquery-1.11.3.min.js" ></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/layui/css/layui.css">
	    <!--[if lt IE 9]>
	      	<script src="framework/html5shiv.min.js"></script>
	      	<script src="framework/respond.min.js"></script>
	    <![endif]-->
		<script type="text/javascript" src="<%=request.getContextPath() %>/layui/layui.js"></script>
		<!-- 滚动条插件 -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.mCustomScrollbar.css">
		<script src="<%=request.getContextPath() %>/framework/jquery-ui-1.10.4.min.js"></script>
		<script src="<%=request.getContextPath() %>/framework/jquery.mousewheel.min.js"></script>
		<script src="<%=request.getContextPath() %>/framework/jquery.mCustomScrollbar.min.js"></script>
		<script src="<%=request.getContextPath() %>/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
		<!-- 公共样式 结束 -->
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/AjaxRequest.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/function.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/onclock.JS"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/login.css">
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/login.js"></script>
	</head>

	<body>
		
		<!--主体 开始-->
		<div class="login_main">
			<!--轮播图 开始-->
			<div class="layui-carousel lbt" id="loginLbt">
				<div carousel-item>
					<div class="item" style="background: url(<%=request.getContextPath() %>/images/hotel/jiudian02.jpg) no-repeat; background-size: cover;"></div>
					<div class="item" style="background: url(<%=request.getContextPath() %>/images/hotel/jiudianwaiguan.jpg) no-repeat; background-size: cover;"></div>
				</div>
			</div>
			<!--轮播图 结束-->
			<div class="logo">
				<div>
					<h1>管理员登陆</h1>
				</div>
			</div>
			<div class="form_tzgg">
				<div class="form">
					
					<form id="from1" action="<%=request.getContextPath()%>/manage/kfgl.do?method=queryAll" method="post" class="layui-form" >
						<div class="title">用户登录</div>
						<div class="con" onclick="getFocus(this)">
							<input type="text" id="user" name="userName" lay-verify="userName" placeholder="请输入您的用户名" autocomplete="off" class="layui-input" value="jingli">
						</div>
						<div class="con" onclick="getFocus(this)">
							<input type="password"  id="password" name="passWord" required  lay-verify="passWord" placeholder="请输入您的账户密码" autocomplete="off" class="layui-input" value="123456">
						</div>
						<div class="but">
							<input type="button" id="sub" class=" btn-primary btn-lg btn-block"  value="登陆" />
							<input type="button" class="btn btn-primary btn-lg btn-block" value="返回" onclick="window.location.href='<%=request.getContextPath() %>/manage/kfgl.do?method=query'">
						</div>
						
					</form>
				</div>
				<script>
					
				$("#sub").click(function bdjg() {
					if($("#user").val()==""){
						alert("请输入用户名")
					}else if($("#password").val()==""){
						alert("请输入密码")
					}else{
						var user = $("#user").val();
						var password = $("#password").val();
						var url = "<%=request.getContextPath()%>/manage/pdpossword.do?method=pd"
							$.post(url,{userName:user,passWord: password},function(data){
								
								
								if(data=="0"){
									alert("提示 : 用户名或密码错误.")	
									$("#password").attr("value","");
								}else{
									$("#from1").submit();
								}
							})
						}
					})
					
					
				
				
					layui.use('form', function() {
						var form = layui.form;
						form.verify({
				            userName: function(value, item){ //value：表单的值、item：表单的DOM对象
				                if(value == null || value == ""){
				                    return '请输入您的用户名！';
				                }
				            },
				            passWord: function(value, item){ 
				                if(value == null || value == ""){
				                    return '请输入您的账户密码！';
				                }
				            }
				        });
						//监听提交
						form.on('submit(formDemo)', function(data) {
							
							return false;
						});
					});
				</script>
				
			</div>
		</div>
		<!--主体 结束-->
	</body>

</html>