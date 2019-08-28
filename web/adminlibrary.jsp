<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-20
  Time: 오후 12:11
  To change this template use File | Settings | File Templates.
--%>
<%-- 실질적으로 학생증 역활을 하는 부분으로서 학생들의 개인정보들을 출력해주는 페이지이다.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" import="student.*, java.sql.*" %>
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
    <jsp:useBean id="ab" class="student.StudentBean"/>
    <jsp:useBean id="student" class="student.Student"/>
    <jsp:setProperty name="student" property="*"/>
    <%-- 자바빈즈를 활용하기 위해서 빈즈를 설정해주는 과정 --%>
</head>
<body>
<div id="main">
    <form>
        <table border="1">
            <tr><th>학번</th><th>이 름</th><th>계좌번호</th><th>전 공</th><th>졸업 여부</th><th>통학버스신청여부</th><th>기숙사신청여부</th><th>이더리움주소</th></tr>
            <tr>
                <%
                    //앞서 여러번 등장한 코드로서 JDBC를 통해 MySQL에 접속하는 과정으로서 초기 자바빈즈로 구현을 해서 호출을 하는 방식이었으나
                    //파라미터 전달값 문제 등 다양한 문제가 발생해서 직접 호출하는 방식으로 바꿈
                    Connection conn = null;
                    PreparedStatement pstmt = null;

                    String jdbc_driver = "com.mysql.jdbc.Driver"; //JDBC 드라이버 주소
                    String server = "localhost"; // MySQL 서버 주소
                    String database = "student"; // MySQL DATABASE 이름
                    String user_name = "root"; //  MySQL 서버 아이디
                    String password = "1897121"; // MySQL 서버 비밀번호
                    Class.forName(jdbc_driver);
                    String input_id = (String)session.getAttribute("id");
                    try {
                        //JDBC를 통해 MySQL에 접속하는 과정
                        conn = DriverManager.getConnection("jdbc:mysql://" + server + "/" + database + "?serverTimezone=UTC&useSSL=false", user_name, password);
                        System.out.println("정상적으로 연결되었습니다.");
                    } catch(SQLException e) {
                        System.err.println("conn 오류:" + e.getMessage());
                        e.printStackTrace();
                    }
                    //SQL문으로서 student테이블에서 학생의 학번을 통해 검색하여 값들을 가져오는 과정
                    String sql = "select student_id, student_name, student_major from student where student_id=? AND student_graduate = '0'";

                    try {
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, input_id);
                        ResultSet rs = pstmt.executeQuery();
                        rs.next();
                        student.setStudent_id(rs.getString("student_id"));
                        student.setStudent_name(rs.getString("student_name"));
                        student.setStudent_major(rs.getString("student_major"));
                        System.out.println("정상적으로 다운로드했습니다");
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        conn.close();
                    }
                    String id = (String)session.getAttribute("id");
                %>
                <%-- DB에서 가져온 값을 출력하는 과정--%>
                <td><%=student.getStudent_id()%></td>
                <td><%=student.getStudent_name()%></td>
                <td><%=student.getStudent_major()%></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
