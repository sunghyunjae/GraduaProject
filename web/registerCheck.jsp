<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-16
  Time: 오후 5:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"  errorPage="error.jsp" import="student.Student.*, java.util.*, java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title> 회원가입확인 </title>
</head>
<body>
<div align=center>
    <%
        // login.jsp input 에서 입력한 회원가입에 필요한 값들을 변수에 담아준다
        String userid  = request.getParameter("student_id");
        String password  = request.getParameter("student_pw");
        String name = request.getParameter("student_name");
        String major = request.getParameter("student_major");

        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
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

            String sql = "INSERT INTO student(student_id, student_pw. student_name, student_major) VALUES('" + userid + "','" + password + "','" + name + "','" + major + "')";
            try{
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, student.getStudent_id());
                pstmt.setString(2, student.getStudent_name());
                pstmt.setString(3, student.getStudent_account());
                pstmt.setString(4, student.getStudent_major());
                pstmt.setString(5, student.getStudent_graduate());
                pstmt.setString(6, student.getStudent_bus());
                pstmt.setString(7, student.getStudent_domitory());
                pstmt.setString(8, student.getStudent_pw());
                pstmt.executeUpdate();
            } catch(SQLException e){
                e.printStackTrace();

            // 회원가입에 성공하였으면 첫 페이지로 보낸다
            response.sendRedirect("login.jsp");

        } catch (Exception e) {
            out.println("DB 연동 실패");
        }
    %>
</div>
</body>
</html>

