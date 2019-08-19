<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-19
  Time: 오후 5:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*, student.*" %>
<html>
<head>
    <title> 개인 정보 변경 </title>
</head>
<jsp:useBean id="ab" scope="request" class="student.Student" />
<body>

<h1> 개인 정보 변경 </h1>
<%
    // input_pw 는 바로 전 페이지인 ChangePw.jsp 에서 입력한 첫번째 input(현재 비밀번호) 이다
    String input_pw = request.getParameter("now_pw");

    // session_pw 는 logincheck.jsp 에서 로그인 성공과 동시에 session에 pw라는 이름으로 저장된 문자이다
    String session_pw = session.getAttribute("pw").toString();

    // 앞전에 입력한 input_pw와 내 계정이 가지고 있는 session_pw가 다르면 다시 돌려보낸다
    if(!input_pw.equals(session_pw)) {
        // 변경에 실패하면 실패사유를 경고창으로 띄워주고 현재 비밀번호 입력, 새로운 비밀번호 입력, 확인 페이지로 보낸다
%> <script> alert("현재 비밀번호가 안맞네요"); history.go(-1); </script> <%
}
// input_pw와 session_pw가 같다면 (비밀번호 변경에 요구된 모든조건을 충족했다면)
else {
    // new_pw를 만드는데 이는 전 페이지인 ChangePw.jsp 2번째 input에서 입력한 새로운 비밀번호 이다
%>


<form name=form1 action="control.jsp" method="post" onsubmit="return input_check_func()">
    <input type=hidden name="student_id" value="<%=session.getAttribute("id")%>">
    <input type=hidden name="action" value="update">
    <table border="1">
        <tr>
            <th> 이름 </th> <td> <input type="text" name="student_name"> </td>
        </tr>
        <tr>
            <th> 계좌 </th> <td> <input type="text" name="student_account"> </td>
        </tr>
        <tr>
            <th> 비밀번호 </th> <td> <input type="text" name="student_pw"> </td>
        </tr>
        <tr>
            <td colspan=2 align=center><input type=submit value="저장"></td>
        </tr>
    </table>

</form>
<%
    }
%>
</body>
</html>
