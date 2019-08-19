<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-12
  Time: 오후 5:48
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
    <title> Register </title>
</head>
<body>
<div align=center>
    <h1> 학생 등록 </h1>
    [<a href=control.jsp?action=main>메인화면으로</a>] <P></P>
    [<a href=login.jsp>로그인 화면</a>] <P>
    <form name=form1 action="control.jsp" method="post" onsubmit="return input_check_func()">
        <input type=hidden name="action" value="insert">
        <table border="1">
            <tr>
                <th> id </th> <td> <input type="text" name="student_id"> </td>
            </tr>
            <tr>
                <th> 이름 </th> <td> <input type="text" name="student_name"> </td>
            </tr>
            <tr>
                <th> 계좌 </th> <td> <input type="text" name="student_account"> </td>
            </tr>
            <tr>
                <th> 전공 </th> <td> <input type="text" name="student_major"> </td>
            </tr>
            <tr>
                <th> 졸업여부 </th> <td> <input type="text" name="student_graduate"> </td>
            </tr>
            <tr>
                <th> 통학버스신청여부 </th> <td> <input type="text" name="student_bus"> </td>
            </tr>
            <tr>
                <th> 기숙사신청여부 </th> <td> <input type="text" name="student_domitory"> </td>
            </tr>
            <tr>
                <th> 이더리움주소 </th> <td> <input type="text" name="student_ethaddr"> </td>
            </tr>
            <tr>
                <th> 비밀번호 </th> <td> <input type="text" name="student_pw"> </td>
            </tr>
        <tr>
        <td colspan=2 align=center><input type=submit value="저장"></td>
        </tr>
        </table>

    </form>

    <script>
        // input_check_func는 회원가입에 필요한 4가지 문항을 전부다 채워 넣었는지 check 해준다
        // 이는 form onsubmit에 의해 발동되며 return 값이 false 일 경우 페이지의 데이터가 action= 좌표로 넘어가지 않게된다
        function input_check_func() {
            var id = document.getElementById('student_id').value;
            var pw = document.getElementById('student_pw').value;
            var name = document.getElementById('student_name').value;
            var major = document.getElementById('student_major').value;
            var account = document.getElementById('student_account').value;
            var graduate = document.getElementById('student_graduate').value;
            var bus = document.getElementById('student_bus').value;
            var domitory = document.getElementById('student_domitory').value;
            var ethaddr = document.getElementById('student_ethaddr').value;

            if(id == null || pw == null || name == null || major == null || account == null || graduate == null || bus == null || domitory == null || ethaddr == null ||
                id == ""   || pw == ""   || name == "" || major == "" || account =="" || graduate == "" || bus =="" || domitory =="" || ethaddr == "") {

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

