<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8" import="java.util.*,entity.*,dao.*,dao.impl.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>首页</title>
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
					<c:choose>
						<c:when test=  "${sessionScope.user == null}">
								<li><a href="login.jsp">登录</a></li>
								<li><a href="reg.jsp">注册</a></li>

						</c:when>

						<c:otherwise>
							<li><p>你好: ${sessionScope.user.userName }&nbsp;<a href="manage/doLogout.jsp">退出登录</a></p></li>

						</c:otherwise>
					</c:choose>

					<li></li>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">Welcome~</div>

		<!-- Table -->
		<table class="table">
			<tr>
				<td>论坛</td>
				<td>主题</td>
				<td>最后发表</td>
			</tr>
			<!-- 主版块 -->
			<%
				BoardDao boardDao = new BoardDaoImpl();  //得到板块DAO的实例
				TopicDao topicDao = new TopicDaoImpl();  //得到主题DAO的实例
				UserDao userDao = new UserDaoImpl();     //得到用户DAO的实例
				Map mapBoard = boardDao.findBoard();     //取得Map形式的板块信息

				List listMainBoard = (List)mapBoard.get(0);
				if(listMainBoard!=null){
					for(int i=0;i<listMainBoard.size();i++){
						Board mainBoard = ((Board) listMainBoard.get(i));     //循环取得主版块


			%>
			<tbody>
			<tr>
				<td>
					<%= mainBoard.getBoardName()%>
				</td>
			</tr>
			<!--子版块  -->
			<%
				List listSonBoard = (List)mapBoard.get(mainBoard.getBoardId());
				for(int j=0;j<listSonBoard.size();j++) {
					Board sonBoard = (Board) listSonBoard.get(j);  //循环取得子版块
					//out.println(sonBoard.getBoardName());
					Topic topic = new Topic();                    //最后发表的主题

					User user = new User();                       //最后发表的主题的作者
					int boardId = sonBoard.getBoardId();
					List listTopic = topicDao.findListTopic(1, boardId);  //取得该板块主题列表

					if (listTopic != null && listTopic.size() > 0 && user !=null) {
						topic = (Topic) listTopic.get(0);         //取得最后发表的帖子
						user = userDao.findUser(topic.getUserId());
						//out.println(topic.getTitle());
					}

			%>
			<tr>
				<td>
					<a href="list.jsp?page=1&boardId=<%=boardId%>"><%= sonBoard.getBoardName()%></a>
				</td>
				<td>
					<%= topicDao.findCountTopic(boardId)%>
				</td>
				<td>
                        <span>
                            <a href="detail.jsp?page=1&boardId=<%=boardId%>&topicId=<%= topic.getTopicId()%>">
                                <%= topic.getTitle()%></a>
                            <br>
                        </span>
					<span>
                            <%= user.getUserName()%>
                        </span>
					<span class = "gray">[<%= topic.getPublishTime()%> ]</span>
				</td>
			</tr>
			</tbody>
			<%
						}
					}
				}
			%>
		</table>
	</div>
</div>
</body>
</html>





























