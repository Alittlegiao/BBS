<%--
  Created by IntelliJ IDEA.
  User: Agaio
  Date: 2021/12/3
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="GBK" %>
<%
    if(session.getAttribute("user")!=null){
        session.removeAttribute("user");
    }
    response.sendRedirect("../index.jsp");
%>