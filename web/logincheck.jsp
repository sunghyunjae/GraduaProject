<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-13
  Time: 오후 6:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"  errorPage="error.jsp" import= "student.Student.*, java.sql.* , java.util.*" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title> 로그인 체크 </title>
</head>
<body>
<div align=center>
    <h1> 로그인 체크 페이지 </h1>

    <%
        try {
            Connection conn = null;
            // 드라이버 로딩
            String server = "localhost"; // MySQL 서버 주소
            String database = "student"; // MySQL DATABASE 이름
            String user_name = "root"; //  MySQL 서버 아이디
            String pw = "1897121"; // MySQL 서버 비밀번호
            try{
                Class.forName("com.mysql.jdbc.Driver");
            }
            catch (ClassNotFoundException e) {
                System.err.println(" !! <JDBC 오류> Driver load 오류: " + e.getMessage());
                e.printStackTrace();
            }

            // 연결
            // INSERT 해달라 student에
            // id, pw, name, major 라는 필드를 가진
            try {
                conn = DriverManager.getConnection("jdbc:mysql://" + server + "/" + database + "?serverTimezone=UTC&useSSL=false", user_name, pw);
                System.out.println("정상적으로 연결되었습니다.");
            } catch(SQLException e) {
                System.err.println("conn 오류:" + e.getMessage());
                e.printStackTrace();
            }

            //관리자 계정
            String super_id = "admin";
            String super_pw = "admin";

            // sql 구사
            // 전 페이지인 login.jsp input에 입력한 값들을 변수에 담는다
            String user_id= request.getParameter("input_id");
            String user_pw= request.getParameter("input_pw");
            if(user_id.equals("admin") && user_pw.equals("admin"))
            {
                session.setAttribute("id", user_id);
                session.setAttribute("pw", user_pw);
                // 첫 페이지로 돌려보낸다
                response.sendRedirect("main.jsp");
            }
            // 내가 입력한 id와 pw 값이 DB안에 있는지 확인한다
            String sql = "SELECT * FROM student WHERE student_id=? AND student_pw=?";
            PreparedStatement pmst = conn.prepareStatement(sql);
            pmst.setString(1, user_id);
            pmst.setString(2, user_pw);
            ResultSet rs = pmst.executeQuery();
            // isLogin 은 로그인 확인 유무를 위한 변수
            Boolean isLogin = false;
            while(rs.next()) {
                // rs.next가 true 라면 = 정보가 있다
                isLogin = true;
            }

            // DB에 내가 적은 정보가 있다면
            if(isLogin) {
                // 지금 로그인할 id와 pw를 session에 저장하고
                session.setAttribute("id", user_id);
                session.setAttribute("pw", user_pw);
                // 첫 페이지로 돌려보낸다
                response.sendRedirect("main.jsp");
            } else {
                // DB에 내가적은 정보가 없다면 경고창을 띄워준다
    %> <script> alert("로그인 실패"); history.go(-1); </script> <%
        }


    } catch (Exception e) {
        out.println("DB 연동 실패");
        response.sendRedirect("login.jsp");
    }
%>
</div>
</body>
</html>


