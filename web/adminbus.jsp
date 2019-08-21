<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-12
  Time: 오후 5:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"  errorPage="error.jsp" import=" java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>통학버스</title>
</head>
<body>
<div style="border:1px solid; padding:1px;">
    <img src="http://localhost:8080/wallet/metamaskwallet.PNG">
</div>
<div>
    위의 QR 코드를 읽혀주세요
    <br><button onclick="location.href='main.jsp'"> 메인화면으로 이동</button>
</div>

</body>
</html>
