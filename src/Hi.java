import java.sql.*;

public class Hi{
        public static void main(String[] args) {
            Connection con = null;

            String server = "localhost"; // MySQL 서버 주소
            String database = "student"; // MySQL DATABASE 이름
            String user_name = "root"; //  MySQL 서버 아이디
            String password = "1897121"; // MySQL 서버 비밀번호

            // 1.드라이버 로딩
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                System.err.println(" !! <JDBC 오류> Driver load 오류: " + e.getMessage());
                e.printStackTrace();
            }

            // 2.연결
            try {
                con = DriverManager.getConnection("jdbc:mysql://" + server + "/" + database + "?serverTimezone=UTC&useSSL=false", user_name, password);
                System.out.println("정상적으로 연결되었습니다.");
            } catch(SQLException e) {
                System.err.println("con 오류:" + e.getMessage());
                e.printStackTrace();
            }

            // 3.해제
            try {
                if(con != null)
                    con.close();
            } catch (SQLException e) {}
        }
}
