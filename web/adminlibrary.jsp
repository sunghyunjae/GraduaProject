<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-20
  Time: 오후 12:11
  To change this template use File | Settings | File Templates.
--%>
<%-- 실질적으로 학생증 역활을 하는 부분으로서 학생들의 개인정보들을 출력해주는 페이지이다.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" import="java.util.*, student.*" %>
<html>
<head>
    <title>도서관 출입</title>
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
                <tr><th>학번</th><th>이 름</th><th>학과</th><th>도서관 들어간 시간</th><th>도서관 나온 시간</th></tr>
                <%
                    for(Student ab : (ArrayList<Student>)datas) {
                %>
                <tr>
                    <td><%=ab.getStudent_id() %></td>
                    <td><%=ab.getStudent_name() %></td>
                    <td><%=ab.getStudent_major() %></td>
                    <td><%=ab.getLibraryInputTime() %></td>
                    <td><%=ab.getLibraryOutputTime() %></td>
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
