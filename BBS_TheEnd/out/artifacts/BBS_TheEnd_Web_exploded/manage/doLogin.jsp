<%--
  Created by IntelliJ IDEA.
  User: Agaio
  Date: 2021/12/3
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="GBK" import="entity.*,dao.*,dao.impl.*" %>
<%
    request.setCharacterEncoding("GBK");

    String userName = request.getParameter("uName");
    String userPass = request.getParameter("uPass");
    UserDao userDao = new UserDaoImpl();
    User user = userDao.findUser(userName);
    if(user!=null && user.getUserPass().equals(userPass)){
        session.setAttribute("user",user);
        response.sendRedirect("../index.jsp");
    }else{
        out.println("�û����������벻��ȷ");
    }
%>
