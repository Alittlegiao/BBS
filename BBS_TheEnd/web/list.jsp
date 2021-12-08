<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" import="java.util.*,entity.*,dao.*" %>
<%@ page import="dao.impl.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    TopicDao topicDao = new TopicDaoImpl();
    ReplyDao replyDao = new ReplyDaoImpl();
    UserDao userDao = new UserDaoImpl();
    BoardDao boardDao = new BoardDaoImpl();

    int boardId = Integer.parseInt(request.getParameter("boardId"));
    int p = Integer.parseInt(request.getParameter("page"));
    List listTopic = topicDao.findListTopic(p, boardId);
    Board board = boardDao.findBoard(boardId);
    int prep = p;
    int nextp = p;
    if (listTopic.size() == 10) {
        nextp = p + 1;
    }
    if (p > 1) {
        prep = p - 1;
    }
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>板块帖子</title>
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
<div class="container">
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
                        <c:when test="${sessionScope.user == null}">
                            <li><a href="login.jsp">登录</a></li>
                            <li><a href="reg.jsp">注册</a></li>

                        </c:when>

                        <c:otherwise>
                            <li><p>你好: ${sessionScope.user.userName }&nbsp;<a href="manage/doLogout.jsp">退出登录</a></p>
                            </li>

                        </c:otherwise>
                    </c:choose>

                    <li></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

    <div>
        <button class="btn" type="button"><a href="post.jsp?boardId=<%=boardId%>">发表话题</a></button>
    </div>


    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading">帖子列表</div>
        <!-- Table -->
        <table class="table">
            <tr>
                <td>&nbsp;</td>
                <td>文章</td>
                <td>作者</td>
                <td>回复</td>
            </tr>
            <!-- 主题列表 -->
            <%
                for (int i = 0; i < listTopic.size(); i++) {
                    Topic topic = (Topic) listTopic.get(i);
                    User user = userDao.findUser(topic.getUserId());

            %>
            <tr>
                <td>
                </td>
                <td>
                    <a href="detail.jsp?page=1&boardId=<%=boardId%>&topicId=<%= topic.getTopicId()%>">
                        <%= topic.getTitle() %>
                    </a>
                </td>
                <td>
                    <%= user.getUserName()%>
                </td>
                <td>
                    <%= replyDao.findCountReply(topic.getTopicId())%>s
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
    <div>
        <a href="list.jsp?list.jsp?page=<%= prep%>&boardId=<%= boardId%>">上一页</a>
        <a href="list.jsp?page=<%= nextp%>&boardId=<%= boardId%>">下一页&rarr;</a>
    </div>
</div>
</body>
</html>
