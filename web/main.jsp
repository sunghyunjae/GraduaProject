<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-12
  Time: 오후 :02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
        <%
    String contentPage=request.getParameter("contentPage");
    if(contentPage==null)
        contentPage="list.jsp";
%>
    <html>
    <head>
        <title>메인 화면</title>

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
                float: left;
                width: 800px;
                height: 500px;
                background-color: #FFCA6C;
                text-align:center;
                vertical-align: middle;
            }
        </style>

    </head>
<body>

<div id="wrap">
    <div id="header">
            <jsp:include page="menu.jsp" />
        </div>
    <div id="main">
            <jsp:include page="<%=contentPage%>" />
        </div>
</div>

</body>
</html>


