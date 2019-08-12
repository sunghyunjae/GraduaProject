
import java.sql.*;
import java.util.*;

public class StudentBean {
    public static void main(String[] args) {
        Connection conn = null;
        PreparedStatement pstmt = null;

	/* Oracle 연결정보
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@220.68.14.7:1521";
	*/

        /* MySQL 연결정보 */
        String jdbc_driver = "com.mysql.jdbc.Driver";
        String jdbc_url = "jdbc:mysql://localhost/student";
        String user = "root";
        String password = "1897121";

        // DB연결 메서드
        void connect () {
            try {
                Class.forName(jdbc_driver);

                conn = DriverManager.getConnection(jdbc_url, user, password);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        void disconnect () {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
