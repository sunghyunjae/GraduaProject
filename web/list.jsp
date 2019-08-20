<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-20
  Time: 오후 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="student.*, java.sql.*" %>
<html>
<head>
    <title>학생증</title>
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
</head>
<body>
    <div id="main">
    <form>
        <table border="1">
        <tr><th>학번</th><th>이 름</th><th>계좌번호</th><th>전 공</th><th>졸업 여부</th><th>통학버스신청여부</th><th>기숙사신청여부</th><th>이더리움주소</th></tr>
            <tr>
                <%
                    Connection conn = null;
                    PreparedStatement pstmt = null;

                    String jdbc_driver = "com.mysql.jdbc.Driver";
                    String server = "localhost"; // MySQL 서버 주소
                    String database = "student"; // MySQL DATABASE 이름
                    String user_name = "root"; //  MySQL 서버 아이디
                    String password = "1897121"; // MySQL 서버 비밀번호
                    Class.forName(jdbc_driver);
                    String input_id = (String)session.getAttribute("id");
                    try {
                        conn = DriverManager.getConnection("jdbc:mysql://" + server + "/" + database + "?serverTimezone=UTC&useSSL=false", user_name, password);
                        System.out.println("정상적으로 연결되었습니다.");
                    } catch(SQLException e) {
                        System.err.println("conn 오류:" + e.getMessage());
                        e.printStackTrace();
                    }

                    String sql = "select student_id, student_name, student_account, student_major, student_graduate, student_bus, student_domitory, student_ethaddr from student where student_id=?";

                    try {
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, input_id);
                        ResultSet rs = pstmt.executeQuery();
                        rs.next();
                        student.setStudent_id(rs.getString("student_id"));
                        student.setStudent_name(rs.getString("student_name"));
                        student.setStudent_account(rs.getString("student_account"));
                        student.setStudent_major(rs.getString("student_major"));
                        student.setStudent_graduate(rs.getString("student_graduate"));
                        student.setStudent_bus(rs.getString("student_bus"));
                        student.setStudent_domitory(rs.getString("student_domitory"));
                        student.setStudent_ethaddr(rs.getString("student_ethaddr"));
                        System.out.println("정상적으로 다운로드했습니다");
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                       conn.close();
                    }
                    String id = (String)session.getAttribute("id");
                %>
                <td><%=student.getStudent_id()%></td>
                <td><%=student.getStudent_name()%></td>
                <td><%=student.getStudent_account()%></td>
                <td><%=student.getStudent_major()%></td>
                <td><%=student.getStudent_graduate()%></td>
                <td><%=student.getStudent_bus()%></td>
                <td><%=student.getStudent_domitory()%></td>
                <td><%=student.getStudent_ethaddr()%></td>
            </tr>
        </table>
        </form>
        </div>
</body>
</html>
