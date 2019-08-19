<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-12
  Time: 오후 5:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import ="java.sql.*, student.* "%>
<html>
<head>
    <title> 개인정보변경 </title>
</head>
<body>
<center>

    <h1> 비밀 번호 확인 </h1>
    <br /> <form action="change.jsp" method="post">
    <br />
    <br /> 지금 비밀번호 : <input id="now_pw" name="now_pw">
    <br />
    <br /> <button> 변경 </button> </form>
    <br /> <button onClick="location.href='login.jsp'"> 취소 </button>


</center>
</body>
</html>
