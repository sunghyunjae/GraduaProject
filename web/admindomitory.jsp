<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-12
  Time: 오후 5:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" errorPage="error.jsp" language="java" import="java.util.*, student.*" %>
<html>
<head>
    <title>기숙사 출입</title>
    <style>
        /*
        레이아웃 전체 가운데 정렬 태그
        - margin:0 auto 0 auto;(시계방향으로 위, 오른쪽, 아래, 왼쪽)
        왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬이 된다.

        전체를 감싸주는 태그 #wrap
        */
        #wrap {
            width: 800px;
            margin: 0 auto 0 auto;
        }

        #header {
            text-align: center;
            width: 800px;
            height: 150px;
            background-color: #45FFFF;
            padding: 60px 0px;
        }

        #main {
            text-align: center;
            width: 800px;
            height: 500px;
            background-color: #FFCA6C;
            vertical-align: middle;
        }
    </style>
</head>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<body>
<div id="wrap">
<div id="header">
            <jsp:include page="menu.jsp" />
        </div>
    <div id="main">

<form>
    <META HTTP-EQUIV="refresh" CONTENT="5">
    <table border="1">
        <tr><th>학번</th><th>이 름</th><th>학과</th><th>기숙사 들어간 시간</th><th>기숙사 나온 시간</th></tr>
        <%
            for(Student ab : (ArrayList<Student>)datas) {
        %>
        <tr>
            <td><%=ab.getStudent_id() %></td>
            <td><%=ab.getStudent_name() %></td>
            <td><%=ab.getStudent_major() %></td>
            <td><%=ab.getDomitoryInputTime() %></td>
            <td><%=ab.getDomitoryOutputTime() %></td>
        </tr>
        <%
            }
        %>
    </table>
</form>
</div>
</div>
</body>
</html>
