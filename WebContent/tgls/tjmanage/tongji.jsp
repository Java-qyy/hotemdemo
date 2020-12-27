<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
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
		
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts/echarts.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap-4.5.0-dist/css/bootstrap.min.css"/>
		<style type="text/css">
		
			#year{
				display: none;
				margin-top:20px;
				margin-left:20px;
				width: 700px
			}
			#mothod{
				margin-top:20px;
				margin-left:20px;
				display: none;
				width: 700px
			}
			#form1{
				margin-left:20px;
			}
			#zhutu{
				display: none;
		 	}
		 	#bingtu{
				display: none;
		 	}
		 	#zhexian{
				display: none;
		 	}
		</style>
	</head>
	<body>
	  <table border="0"  cellspacing="0" cellpadding="0">
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
			
			<%
			
			String tx = (String)request.getAttribute("tx");
			String lx = (String)request.getAttribute("lx");
			String startyear = (String)request.getAttribute("startyear");
			String endyear = (String)request.getAttribute("endyear");
			String startmothod = (String)request.getAttribute("startmothod");
			String endmothod = (String)request.getAttribute("endmothod");
			
			%>
		<form action="" id="form1">
			
			<div id="top">
				<samp style="font-family: 黑体" >统计类型:</samp>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="tx" id="tx" class="btn btn-dark">
					<option value="%"  <%=tx.equals("%")?"selected":"" %>>选择图形</option>
					<option value="zhu" <%=tx.equals("zhu")?"selected":"" %>>柱形图</option>
					<option value="zhe" <%=tx.equals("zhe")?"selected":"" %>>折线图</option>
				</select>
				&nbsp;&nbsp;
				<select name="lx"  id="lx" class="btn btn-dark">
					<option value="%" <%=lx.equals("%")?"selected":"" %>>统计类型</option>
					<option value="year" <%=lx.equals("year")?"selected":"" %>>按年份</option>
					
					
				</select>
			</div>
			
			
			<div id="year">
				  <div class="row"> 请输入开始和结束的年份：
				    <div class="col">
				      <input type="text" class="form-control" id="startyear"   name="startyear" placeholder="开始年份" value="<%=startyear%>">
				    </div>至
				    <div class="col">
				      <input type="text" class="form-control"  id="endyear"  name="endyear" placeholder="结束年份" value="<%=endyear%>">
				    </div>
				    <button type="button"  id="tjyear" class="btn btn-success">统计</button>
				  </div>
				
			</div>
			
			
			
			<div id="zhutu" style="width: 600px;height:400px;"></div>
			<div id="zhexian" style="width: 600px;height:400px;"></div>
		</form>
		</div>
		
		
		
		
		
		
		
		
		
	
				
				
				
				</div>
					</td>
				</tr>
			</table>
			
			<script type="text/javascript">
				$(function(){
					
					
					
					$("#lx").change(function(){
						if($("#lx").val()=="year"){
							$("#year").css("display","block");
						
						}
						
						if($("#lx").val()=="%"){
							$("#year").css("display","none");
						}
					})
						
				
					
					$("#tjyear").click(function(){
						var startyears = $("#startyear").val();
						var endyears = $("#endyear").val();
						if($("#tx").val()=="zhu"){
							$("#zhutu").css("display","block");
							$("#bingtu").css("display","none");
							$("#zhexian").css("display","none");
							
								$.ajax({
				                    type: "POST",
				                    url:"http://localhost:8089/hoteldemo/manage/tjmanage.do?method=ceshi&startyear="+startyears+"&endyear="+endyears,
				                    dataType: "json",
				                    jsonp: "callback",
				                    success: function(data){
				                    	var bill_time = new Array(data.length);
				                    	var actualpayment = new Array(data.length);
				                    	for (var i = 0 ; i <data.length ; i++){
											bill_time[i] =data[i].bill_time;
											actualpayment[i] = data[i].actualpayment;
											
										}
				                    	
				                    	 var myChart = echarts.init(document.getElementById('zhutu'));

				                         // 4.指定图表的配置项和数据
				                         var option = {
				                            title: {  
				                                     //主标题文本，'\n'指定换行  
				                                     text: '旅馆管理系统收入统计',  
				                                     //主标题文本超链接  
				                                     link: 'http://www.baidu.com',  
				                                     //副标题文本，'\n'指定换行  
				                                     //subtext: 'www.stepday.com',  
				                                     //副标题文本超链接  
				                                     // sublink: 'http://www.stepday.com/myblog/?Echarts',  
				                                     //水平安放位置，默认为左侧，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）  
				                                     x: '180px',  
				                                     //垂直安放位置，默认为全图顶端，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）  
				                                     y: '20px'  
				                                 },	
				                         		
				                             tooltip: {
				                             	//触发类型，默认（'item'）数据触发，可选为：'item'(数据触发，其实就是提示窗显示数据) | 'axis'(轴线触发，其实就是提示窗显示轴线)
				                             	trigger: 'item' 
				                             },
				                             legend: {
				                             	//显示策略，可选为：true（显示） | false（隐藏），默认值为true  
				                                 show: true, 
				                                 //水平安放位置，默认为全图居中，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）  
				                                 x: 'center',  
				                                 //垂直安放位置，默认为全图顶端，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）  
				                                 y: 'top',  
				                                 data:['收入']
				                             },
				                             
				                             xAxis: {
				                             	type: 'category', 
				                                 data: bill_time,
				                                 name:'年份'
				                             },
				                             yAxis: {
				                             	  show: true,   //是否显示 y 轴,默认显示，但是设置为false就不显示了
				                             	  type: 'value',////坐标轴类型。'value' 数值轴，适用于连续数据。'category' 类目轴，适用于离散的类目数据，为该类型时必须通过 data 设置类目数据
				                             	  name:'金额（元）'
				                             },
				                             series: [
				                 	            {
				                 	                name: '收入',
				                 	                type: 'bar',
				                 	                markPoint: {  
				                                         data: [  
				                                             {type: 'max', name: '最大值'},  
				                                             {type: 'min', name: '最小值'}  
				                                         ]  
				                                     }, 
				                                     markLine: {  
				                                         data: [  
				                                             {type: 'average', name: '平均值'}  
				                                         ]  
				                                     },
				                 	                
				                 	                data: actualpayment
				                 	            }
				                             ]
				                         };

				                         // 5.使用刚指定的配置项和数据显示图表。
				                         myChart.setOption(option);
				                    },
				                    
				                    
				                    error: function(){
				                        alert("fail");
				                    }
				               
							});
							
						}
					
						if($("#tx").val()=="zhe"){
							$("#zhutu").css("display","none");
							$("#bingtu").css("display","none");
							$("#zhexian").css("display","block");
								
								$.ajax({
				                    type: "POST",
				                    url:"http://localhost:8089/hoteldemo/manage/tjmanage.do?method=ceshi&startyear="+startyears+"&endyear="+endyears,
				                    dataType: "json",
				                    jsonp: "callback",
				                    success: function(data){
				                    	var bill_time = new Array(data.length);
				                    	var actualpayment = new Array(data.length);
				                    	for (var i = 0 ; i <data.length ; i++){
											bill_time[i] =data[i].bill_time;
											actualpayment[i] = data[i].actualpayment;

				                    	var myChart = echarts.init(document.getElementById('zhexian'));
				                		option = {
				                			    title : {
				                			        text: '旅馆近几年营业额趋势',
				                			        subtext: '二级标题'
				                			    },
				                			    tooltip : {
				                			        trigger: 'axis'
				                			    },
				                			    legend: {
				                			        data:['已完成','未完成']
				                			    },
				                			    toolbox: {
				                			        show : true,
				                			        x:'520',
				                			        y:'top',
				                			        feature : {
				                			            mark : {show: true},
				                			            dataView : {show: true, readOnly: true,title:"数据视图",lang: ['数据视图', '关闭', '刷新'],},
				                			            magicType : {show: true, type: ['bar','line','stack'],title: {
				                			                line: '切换为折线图',
				                			                bar: '切换为柱状图',
				                			                stack: '切换为堆叠',
				                			                tiled: '切换为平铺'
				                			            }},
				                			            restore : {show: true,title:"还原",},
				                			            saveAsImage : {show: true,title:"保存为图片",}
				                			        
				                			        
				                			        
				                			        }
				                			    },
				                			    calculable : true,
				                			    xAxis : [
				                			        {
				                			            type : 'category',
				                			            boundaryGap : true,
				                			            data : bill_time
				                			        }
				                			    ],
				                			    yAxis : [
				                			        {
				                			            type : 'value',
				                			            axisLabel : {
				                			             formatter: '{value}元 '
				                			            }
				                			        }
				                			    ],
				                			    series : [
				                			        {
				                			            name:'已完成',
				                			            type:'line',
				                			            data:actualpayment,
				                			            markPoint : {
				                			                data : [
				                			                    {type : 'max', name: '最大值'},
				                			                    {type : 'min', name: '最小值'}
				                			                ]
				                			            },
				                			            markLine : {
				                			                data : [
				                			                    {type : 'average', name: '平均值'}
				                			                ]
				                			            }
				                			        },
				                			       
				                			    ]
				                			};
				                			                    
				                		 myChart.setOption(option);
				                    }
				                    },
				                    
				                    
				                    error: function(){
				                        alert("fail");
				                    }
				                });
						
							
						}
						
						
					})
					
					
					
				})
			</script>
	
	</body>
</html>
