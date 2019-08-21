<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-20
  Time: 오전 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"  errorPage="error.jsp" import="student.*, java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title> 학생 정보 삭제 </title>
</head>
<body>
<div align=center>
    <h2> 학생 정보 삭제 </h2>
    <form name=form1 action="control.jsp" method="post">
        <input type=hidden name="action" value="delete">
        <table border="1">
            <h1>삭제를 하고자 하는 하는 학생의 학번을 입력해주세요</h1>
            <tr>
                <th> id </th> <td> <input id = "student_id" name="student_id"> </td>
            </tr>
            <tr>
                <td colspan=2 align=center><input type=submit value="삭제"></td>
            </tr>
        </table>
        [<a href=control.jsp?action=main>메인화면으로</a>] <P></P>
        [<a href=login.jsp>로그인 화면</a>] <P>

    </form>
</div>
</body>
</html>

