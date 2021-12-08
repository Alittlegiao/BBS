<%--
  Created by IntelliJ IDEA.
  User: Agaio
  Date: 2021/12/3
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="GBK" import="entity.*,dao.*,dao.impl.*" %>
<%
    request.setCharacterEncoding("GBK");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    TopicDao topicDao = new TopicDaoImpl();
    User user = (User)session.getAttribute("user");
    int boardId = Integer.parseInt(request.getParameter("boardId"));

    if(user!=null){

        Topic topic = new Topic();
        topic.setTitle(title);
        topic.setContent(content);
        topic.setBoardId(boardId);
        topic.setUserId(user.getUserId());

        topicDao.addTopic(topic);
        response.sendRedirect("../list.jsp?page=1&boardId="+boardId);

    }else{
        response.sendRedirect("../login.jsp");
    }
%>