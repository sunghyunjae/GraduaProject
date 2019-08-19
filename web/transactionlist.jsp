<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-12
  Time: 오후 5:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="student.StudentBean" %>
<html>
<head>
    <title>트랜잭션 조회</title>
</head>
<jsp:useBean id="ab" class="student.StudentBean"/>
<body>
<%
ab.showTransaction();
%>
</body>
</html>
