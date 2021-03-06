<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">   <%-- 在IE运行最新的渲染模式 --%>
		<meta name="viewport" content="width=device-width, initial-scale=1">   <%-- 初始化移动浏览显示 --%>
		<meta name="Author" content="Dreamer-1.">
		
		<!-- 引入各种CSS样式表 -->
		<link rel="stylesheet" href="css/bootstrap.css">
		<!-- 		<link rel="stylesheet" href="css/bootstraps.min.css"> -->
		<link rel="stylesheet" href="css/font-awesome.css">
		<link rel="stylesheet" href="css/index.css">	<!-- 修改自Bootstrap官方Demon，你可以按自己的喜好制定CSS样式 -->
		<link rel="stylesheet" href="css/font-change.css">	<!-- 将默认字体从宋体换成微软雅黑（个人比较喜欢微软雅黑，移动端和桌面端显示效果比较接近） -->		
		
		<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript">
		var contextPath = "${pageContext.request.contextPath}";
		var session_email = '<%=session.getAttribute("email")%>';
		if(session_email == "null"){
				window.location.href="${pageContext.request.contextPath}/login";
		}
		/*
		 * 对选中的标签激活active状态，对先前处于active状态但之后未被选中的标签取消active
		 * （实现左侧菜单中的标签点击后变色的效果）
		 */
		$(document).ready(function () {
			$('ul.nav > li').click(function (e) {
				//e.preventDefault();	加上这句则导航的<a>标签会失效
				$('ul.nav > li').removeClass('active');
				$(this).addClass('active');
			});
		});
		function changeSrc(url){
			document.getElementById("content").src=url;
		}
		</script>
		<title>- 后台管理系统 -</title>
	</head>
	
	<body>
	<!-- 顶部菜单（来自bootstrap官方Demon）==================================== -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
      		<div class="container">
        		<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" >
		            	<span class="sr-only">Toggle navigation</span>
		            	<span class="icon-bar"></span>
		            	<span class="icon-bar"></span>
		            	<span class="icon-bar"></span>
					</button>
	          		<a class="navbar-brand" href="indexFirst.jsp">yangxiaodong.com</a>
        		</div>
        		
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">			            
						<li><a href="javascript:void(0)" onclick="changeSrc('/loginAction/userListJump')"><i class="fa fa-user"></i> 用户列表</a></li>	
						<li><a href="javascript:void(0)" onclick="changeSrc('loginAction/productListJump')"><i class="fa fa-list-alt"></i> 产品列表</a></li>
						<li><a href="javascript:void(0)" onclick="changeSrc('orderListJump')" ><i class="fa fa-list"></i> 订单列表</a></li>	
					</ul>
          			
        		</div>
      		</div>
    	</nav>

	<!-- 左侧菜单选项========================================= -->
		<div class="container-fluid">
			<div class="row-fluie">
				<div class="col-sm-3 col-md-2 sidebar">		
					<ul class="nav nav-sidebar">
						<!-- 一级菜单 -->
						<li class="active"><a href="#userMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
							<i class="fa fa-user"></i>&nbsp; 用户管理 <span class="sr-only">(current)</span></a>
						</li> 
						<!-- 二级菜单 -->
						<!-- 注意一级菜单中<a>标签内的href="#……"里面的内容要与二级菜单中<ul>标签内的id="……"里面的内容一致 -->
						<ul id="userMeun" class="nav nav-list collapse menu-second">
							<li><a href="javascript:void(0)" onclick="changeSrc('/loginAction/userListJump')"><i class="fa fa-user"></i> 用户列表</a></li>
						</ul>
						<li><a href="#productMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
							<i class="fa fa-globe"></i>&nbsp; 产品管理 <span class="sr-only">(current)</span></a>
						</li> 
						<ul id="productMeun" class="nav nav-list collapse menu-second">
							<li><a href="javascript:void(0)" onclick="changeSrc('loginAction/productListJump')"><i class="fa fa-list-alt"></i> 产品列表</a></li>
						</ul>
						<li><a href="#recordMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
							<i class="fa fa-file-text"></i>&nbsp; 订单管理 <span class="sr-only">(current)</span></a>
						</li> 
						<ul id="recordMeun" class="nav nav-list collapse menu-second">
							<li><a href="javascript:void(0)" onclick="changeSrc('orderListJump')" ><i class="fa fa-list"></i> 订单列表</a></li>
							<li><a href="javascript:void(0)" onclick="changeSrc('loginAction/calculator')" ><i class="fa fa-list"></i> 计算器&nbsp;&nbsp;&nbsp;</a></li>
						</ul>
						<li><a href="#luckDrawMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
							<i class="fa fa-users"></i>&nbsp; 抽奖活动<span class="sr-only">(current)</span></a>
						</li> 
						<ul id="luckDrawMeun" class="nav nav-list collapse menu-second">
							<li><a href="javascript:void(0)" onclick="changeSrc('loginAction/calculator')" ><i class="fa fa-users"></i> 抽奖&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
						</ul>
						<li><a href="#CounsumptionMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
							<i class="fa fa-users"></i>&nbsp; 消费记录<span class="sr-only">(current)</span></a>
						</li> 
						<ul id="CounsumptionMeun" class="nav nav-list collapse menu-second">
							<li><a href="javascript:void(0)" onclick="changeSrc('salaryJump')" ><i class="fa fa-users"></i> 薪资记录</a></li>
							<li><a href="javascript:void(0)" onclick="changeSrc('consumptionJump')" ><i class="fa fa-users"></i> 消费记录</a></li>
						</ul>
						<li><a href="#xinyongMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
							<i class="fa fa-users"></i>信用卡账单<span class="sr-only">(current)</span></a>
						</li> 
						<ul id="xinyongMeun" class="nav nav-list collapse menu-second">
							<li><a href="javascript:void(0)" onclick="changeSrc('getLoginMailJump')" ><i class="fa fa-users"></i>行用卡账单</a></li>
						</ul>
					</ul>
				</div>
			</div>
		</div>

<!-- 右侧内容展示==================================================   -->   		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<!-- <h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;控制台<small>&nbsp;&nbsp;&nbsp;欢迎使用yxd后台管理系统</small></h1> -->
				<iframe id="content" scrolling="auto" frameborder="0" width="100%" height="700px" src="http://www.w3school.com.cn/tags/att_iframe_scrolling.asp"/>
		</div> 
	</body>
</html>