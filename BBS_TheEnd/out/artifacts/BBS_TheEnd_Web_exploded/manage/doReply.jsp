<%--
  Created by IntelliJ IDEA.
  User: Agaio
  Date: 2021/12/3
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="GBK" import="entity.*,dao.*,dao.impl.*" %>
<%
    request.setCharacterEncoding("GBK");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    int boardId = Integer.parseInt(request.getParameter("boardId"));
    int topicId = Integer.parseInt(request.getParameter("topicId"));
    User user = (User)session.getAttribute("user");
    ReplyDao replyDao = new ReplyDaoImpl();

    if(user!=null){
        Reply reply = new Reply();
        reply.setTitle(title);
        reply.setContent(content);
        reply.setTopicId(topicId);
        reply.setUserId(user.getUserId());
        replyDao.addReply(reply);
        response.sendRedirect("../detail.jsp?page=1&boardId=" + boardId + "&topicId=" + topicId);
        return;
    }else{
        response.sendRedirect("../login.jsp");
    }
%>
