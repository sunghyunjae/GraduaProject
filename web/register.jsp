<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-12
  Time: 오후 5:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"  errorPage="error.jsp" import="student.Student.*, java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title> Register </title>
</head>
<body>
<div align=center>
    <h1> 회원가입 </h1>
    <form action="registerCheck.jsp" method="post" onsubmit="return input_check_func()">
        <table border="1">
            <tr>
                <th> id </th> <td> <input id="student_id" name="student_id"> </td>
            </tr>
            <tr>
                <th> pw </th> <td> <input id="student_pw" name="student_pw"> </td>
            </tr>
            <tr>
                <th> 이름 </th> <td> <input id="student_name" name="student_name"> </td>
            </tr>
            <tr>
                <th> 전공 </th> <td> <input id="student_major" name="student_major"> </td>
            </tr>
        </table>
        <button> 가입하기 </button>
    </form>

    <script>
        // input_check_func는 회원가입에 필요한 4가지 문항을 전부다 채워 넣었는지 check 해준다
        // 이는 form onsubmit에 의해 발동되며 return 값이 false 일 경우 페이지의 데이터가 action= 좌표로 넘어가지 않게된다
        function input_check_func() {
            var id = document.getElementById('student_id').value;
            var pw = document.getElementById('student_pw').value;
            var name = document.getElementById('student_name').value;
            var birth = document.getElementById('student_major').value;

            if(id == null || pw == null || name == null || birth == null ||
                id == ""   || pw == ""   || name == "" || birth == "") {
                alert("공백은 허용치 않는다");
                return false;
            } else {
                // 모든조건이 충족되면 true를 반환한다 이는 현재 페이지의 정보를 action= 좌표로 넘긴다는것을 의미
                return true;
            }
        }
    </script>
</div>
</body>
</html>

