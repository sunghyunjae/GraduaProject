<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-12
  Time: 오후 5:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Logout </title>
</head>
<body>
<div align=center>
    <%
        // 로그아웃 버튼을 누르면 오게되는 곳인데
        // session을 재시작해서 저장된 정보를 날린다
        session.invalidate();
        // 그리고 다시 LOGIN.jsp로 돌아가게 한다
        response.sendRedirect("login.jsp");
    %>
</div>
</body>
</html>
