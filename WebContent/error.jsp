<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	alert("提示 : 请登录");
	var url = "<%=request.getContextPath()%>/login.jsp";
	
	window.location.href=encodeURI(url);
})
</script>

</head>
<body>
			
</body>
</html>