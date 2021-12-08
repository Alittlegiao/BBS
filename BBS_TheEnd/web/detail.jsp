<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8" import="java.util.*,entity.*,dao.*,dao.impl.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	TopicDao topicDao = new TopicDaoImpl();
	ReplyDao replyDao = new ReplyDaoImpl();
	UserDao userDao = new UserDaoImpl();
	BoardDao boardDao = new BoardDaoImpl();

	int boardId = Integer.parseInt(request.getParameter("boardId"));
	int topicId = Integer.parseInt(request.getParameter("topicId"));
	int p = Integer.parseInt(request.getParameter("page"));
	Board board = boardDao.findBoard(boardId);
	Topic topic = topicDao.findTopic(topicId);
	User topicUser = userDao.findUser(topic.getUserId());

	List listReply = replyDao.findListReply(p,topicId);

	int prep = p;
	int nextp = p;
	if(listReply.size() == 10){
		nextp = p + 1;
	}
	if(p>1){
		prep = p - 1;
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>详情</title>
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
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.jsp">首页 <span class="sr-only">(current)</span></a></li>
				</ul>
				</br>
					<c:choose>
						<c:when test= "${sessionScope.user == null}">
							<a href="login.jsp">登录</a>
							<a href="reg.jsp">注册</a>

						</c:when>

						<c:otherwise>
							<p>你好: ${sessionScope.user.userName }&nbsp;<a href="manage/doLogout.jsp">退出登录</a></p>

						</c:otherwise>
					</c:choose>



			</div>
		</div><!-- /.container-fluid -->
	</nav>
	<div>
		<button class="btn" type="button"><a href="reply.jsp?boardId=<%=boardId%>&topicId=<%=topicId%>">回复帖子</a></button>
		<button class="btn" type="button"><a href="post.jsp?boardId=<%=boardId%>&topicId=<%=topicId%>">发表话题</a></button>
	</div>
	<div>
		<div class="row clearfix">
			<div class="col-md-12 column">
				<span class="label label-default">本页主题:<%= topic.getTitle()%></span>
			</div>
		</div>
	</div>

	<!-- 主题 -->
	<%
		if(p == 1){
	%>
	<table>
		<tr>
			<td>
				<%= topicUser.getUserName()%><br />
				<img src="image/1.JPG" width="100" height="100"><br />
				注册:<%= topicUser.getRegTime()%>
			</td>
			<td>
				标题:****<%= topic.getTitle()%>****<br />
				<br/>
				内容:****<%= topic.getContent()%>****<br />
			</td>
		</tr>
		<tr>
			<td>
				发表[<%= topic.getPublishTime()%>]&nbsp;&nbsp;最后修改[<%= topic.getModifyTime()%>]
			</td>
		</tr>
	</table>
	</br>

	<!-- 回复 -->
	<%
		}
		for(int i=0;i<listReply.size();i++){
			Reply reply = (Reply)listReply.get(i);
			User replyUser = (User)userDao.findUser(reply.getUserId());

	%>

	<table>
		<tr>
			<%
				if(replyUser != null){
			%>
			<td>
				<%=replyUser.getUserName()%><br />
				<img src="image/2.JPG" width="100" height="100"><br/>
				注册:<%= topicUser.getRegTime()%>
			</td>
			<%}%>
			<td>
				标题:<%= reply.getTitle()%><br />
				<br />
				内容:<%= reply.getContent()%><br />
			</td>
		</tr>
		<tr>
			<td>
				发表[<%= reply.getPublishTime()%>]&nbsp;&nbsp;最后修改[<%= reply.getModifyTime()%>]
			</td>
		</tr>
	</table>
	</br>
	<%
		}
	%>
	<ul class="pager">
		<li class="previous"><a href="detail.jsp?page=<%= prep%>&boardId=<%= boardId%>&topicId=<%= topicId%>">&larr;上一页</a></li>
		<li class="next"><a href="detail.jsp?page=<%= nextp%>&boardId=<%= boardId%>&topicId=<%= topicId%>">下一页&rarr;</a></li>
	</ul>

</div>
</body>
</html>

