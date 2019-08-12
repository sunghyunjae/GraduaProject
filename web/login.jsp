<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-12
  Time: 오후 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"  errorPage="addrbook_error.jsp" import="jspbook.addrbook.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />
    <title> 로그인 </title>
</head>
<body bgcolor="#ffffff">
<div align=center>
    <%
        // 현재 로그인된 아이디가 없다면 (= session에 저장된 id가 없다면)
        if(session.getAttribute("id") == null) {
    %>
    <h2> IT응용공학과 주소록 로그인 </h2>
    <br /> <form action="logincheck.jsp" method="post">
    <br />
    <br />
    <td> 아이디 </td>
    <input name="input_id" type="text" placeholder="아이디"/>
    <br />
    <br />
    <td> 비밀번호 </td>
    <input name="input_pw" type="password" placeholder="비밀번호"/>
    <br>
    <button> 로그인 </button>
    <br /> </form>
    <br /> <button onClick="location.href='register.jsp'"> 회원가입 </button>
    <%
    }
    // 현재 로그인된 아이디가 있다면 (= session에 저장된 id가 있다면)
    else {
        out.print(session.getAttribute("id") + " 님 환영합니다");
    %>
    <h1> 로그인 페이지 </h1>
    <br /> <form action="logout.jsp" method="post">
    <br />
    <br /> <button> 로그아웃 </button>
    <br />
    <br /> </form>
    <br /> <button onClick="location.href='changeinfo.jsp'"> 비밀번호 변경</button>
    <br>
    <br /> <button onClick="location.href='addrbook_list.jsp'"> 글 목록 보기</button>
    <%
        }
    %>
</div>
</body>
</html>
