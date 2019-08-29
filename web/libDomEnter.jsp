<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-29
  Time: 오후 3:55
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*, student.*" %>
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
    <div id = "main">
        <p>
            <%
                // 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다.
                if(session.getAttribute("id")==null){
            %>
            <button id="loginBtn" class="btn btn-primary" onclick="changeView(4)">로그인</button>
            <%
            } else{   %>
            <button>[<a href=control.jsp?action=enterDomitory>기숙사 입실</a>]</button>
            <button>[<a href=control.jsp?action=quitDomitory>기숙사 퇴실</a>]</button>
            <button>[<a href=control.jsp?action=enterLibrary>도서관 입실</a>]</button>
            <button>[<a href=control.jsp?action=quitLibrary>도서관 퇴실</a>]</button>
            <% } %>
        </p>
    </div>
</div>
</body>
</html>
