<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8" import="java.util.*,entity.*,dao.*,dao.impl.*"%>
<%
	int boardId = Integer.parseInt(request.getParameter("boardId"));
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>发帖</title>
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
		  integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"
		  integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
			integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous">
	</script>
</head>
<body>
<div class="container" >
	<div class="page-header" style="color: darkturquoise;">
		<h1 class="text-center">校园BBS系统 <small>2021</small></h1>
	</div>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">BBS</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.jsp">首页 <span class="sr-only">(current)</span></a></li>
					<li><a href="login.jsp"></a></li>
					<li><a href="reg.jsp"></a></li>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>
		<form class="form-horizontal" id="form4" name="postForm"  method="post"  action="manage/doPost.jsp">
			<input type="hidden" value="<%=boardId%>" id="boardId" name="boardId">
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">发布帖子</div>

			<!-- Table -->
			<table class="table">
				<tr>
					<td>标题</td>
					<td><textarea class="form-control" rows="1" id="title" name="title"></textarea></td>
				</tr>
				<tr>
					<td>内容</td>
					<td><textarea class="form-control" rows="10" id="content" name="content"></textarea></td>
				</tr>
				<tr>
					<td><h2>警告：字数不能超过1000字！</h2></td>
				</tr>
			</table>
		</div>
		<div>
			<button type="submit">提交</button>
			<button type="reset">重置</button>
		</div>
	</form>
</div>
</body>
</html>
