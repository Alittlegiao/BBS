<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8" import="java.util.*,entity.*,dao.*,dao.impl.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>注册</title>
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
	<form class="form-horizontal" name="postForm"  method="post"  action="manage/doReg.jsp">
		<div class="form-group">
			<label for="inputuName" class="col-sm-2 control-label">用户名</label>
			<div class="col-sm-10">
				<input type="uname" class="form-control" id="inputuName" placeholder="Username" id="uName" name="uName">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword1" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="inputPassword1" placeholder="Password" id="uPass" name="uPass">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword2" class="col-sm-2 control-label">重复密码</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="inputPassword2" placeholder="Password">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;别</label>
			<input id="man" type="radio" checked="checked" name="gender" value="2"/>&nbsp;&nbsp;男
			<input id="woman" type="radio"  name="gender" value="1"/>&nbsp;&nbsp;女
		</div>
		<div class="text-center">
			<tr>
				<br>选择头像：</br><img src="image/1.JPG" width="80" height="80" /><input type="radio" name="head" id="head1" checked="checked"/>
					<img src="image/2.JPG" width="80" height="80" /><input type="radio" name="head" id="head2" value="2.jpg"/>
					<img src="image/3.JPG" width="80" height="80" /><input type="radio" name="head" id="head3" value="3.jpg"/>
					<img src="image/4.JPG" width="80" height="80" /><input type="radio" name="head" id="head4" value="4.jpg"/>
					<img src="image/5.JPG" width="80" height="80" /><input type="radio" name="head" id="head5" value="5.jpg"/></br>
					<img src="image/6.JPG" width="80" height="80" /><input type="radio" name="head" id="head6" value="6.jpg"/>
					<img src="image/7.JPG" width="80" height="80" /><input type="radio" name="head" id="head7" value="7.jpg"/>
					<img src="image/8.JPG" width="80" height="80" /><input type="radio" name="head" id="head8" value="8.jpg"/>
					<img src="image/9.JPG" width="80" height="80" /><input type="radio" name="head" id="head9" value="9.jpg"/>
					<img src="image/10.JPG" width="80" height="80" /><input type="radio" name="head" id="head10" value="10.jpg"/></br>
				</td><br>
			</tr>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">注册</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>
