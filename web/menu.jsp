<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-20
  Time: 오전 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>메뉴 바</title>
    <script type="text/javascript">

        function changeView(value){

            if(value == "0") // 메인화면으로 이동
            {
                location.href="main.jsp";
            }
            else if(value == "1") // pay 버튼 클릭시 pay 화면으로 이동
            {
                location.href="pay.jsp";
            }
            else if(value == "2") // eth주소 버튼 클릭시 이더주소 화면으로 이동
            {
                location.href="libDomEnter.jsp";
            }
            else if(value == "3") // adminbus 버튼 클릭시 adminbus 화면으로 이동
            {
                location.href="adminbus.jsp";
            }
            else if(value == "4") // admindomitory 버튼 클릭시 admindomitory 화면으로 이동
            {
                location.href="admindomitory.jsp";
            }
            else if(value == "5") // adminlibrary 버튼 클릭시 adminlibrary 화면으로 이동
            {
                location.href="adminlibrary.jsp";
            }
            else if(value == "6") // adminpay 버튼 클릭시 adminpay 화면으로 이동
            {
                location.href="adminpay.jsp";
            }
            else if(value == "7") // login 버튼 클릭시 login 화면으로 이동
            {
                location.href="login.jsp";
            }
        }
    </script>

</head>
<body>
<div id = "wrap">
    <p>
        <button class="btn btn-success" onclick="changeView(0)">HOME</button>
        <%
            // 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다.
            if(session.getAttribute("id")==null){
        %>
        <button id="loginBtn" class="btn btn-primary" onclick="changeView(7)">로그인</button>
        <%
            //관리자 계정일 경우 트랜잭션 생성을 위한 페이지 버튼을 보여준다.
        }else if(session.getAttribute("id").equals("admin")){
        %>
        <button id="loginBtn" class="btn btn-primary" onclick="changeView(7)">마이페이지</button>
        <button class="btn btn-primary" onclick="changeView(3)">통학버스</button>
        <button>[<a href=control.jsp?action=domitoryList>기숙사출입목록</a>]</button>
        <button>[<a href=control.jsp?action=libraryList>도서관출입목록</a>]</button>
        <button class="btn btn-primary" onclick="changeView(6)">대금결제</button>
        <%   // 로그인 되었을 경우 - 로그아웃, 내정보 버튼을 보여준다.
            } else{   %>
        <button id="loginBtn" class="btn btn-primary" onclick="changeView(7)">마이페이지</button>
        <button class="btn btn-primary" onclick="changeView(1)">결제</button>
        <button class="btn btn-primary" onclick="changeView(2)">기숙사,도서관 출입</button>
        <% } %>
    </p>
</div>
</body>
</html>

