<%--
  Created by IntelliJ IDEA.
  User: Agaio
  Date: 2021/12/3
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="GBK" import="entity.*,dao.*,dao.impl.*" %>
<%
    request.setCharacterEncoding("GBK");
    String userName = request.getParameter("uName");
    String userPass = request.getParameter("uPass");
    String head = request.getParameter("head");
    int gender = Integer.parseInt(request.getParameter("gender"));

    UserDao userDao = new UserDaoImpl();
    User user = new User();
    user.setUserName(userName);
    user.setUserPass(userPass);
    user.setHead(head);
    user.setGender(gender);
    int num = userDao.addUser(user);


    if(num==1){
        response.sendRedirect("../index.jsp");
    }else{
        response.sendRedirect("../reg.jsp");
    }
%>