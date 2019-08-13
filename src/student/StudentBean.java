package student;

import java.sql.*;
import java.util.*;

public class StudentBean {
        Connection conn = null;
        PreparedStatement pstmt = null;

        String jdbc_driver = "com.mysql.jdbc.Driver";
        String jdbc_url = "jdbc:mysql://localhost:3306/student";
        String user_name = "root"; //  MySQL 서버 아이디
        String password = "1897121"; // MySQL 서버 비밀번호

       void connect(){
           try {
               Class.forName(jdbc_driver);
               conn = DriverManager.getConnection(jdbc_url, user_name, password);
               System.out.println("정상적으로 연결되었습니다.");
           } catch(Exception e){
               e.printStackTrace();
           }
        }
        void disconnect(){
           if(pstmt !=null){
               try{
                   pstmt.close();
               } catch(SQLException e){
                   e.printStackTrace();
               }
           }
           if(conn !=null){
               try{
                   conn.close();
               } catch (SQLException e){
                   e.printStackTrace();
               }

           }
        }

        // 데이터 업데이트를 위한 메소드
        public boolean updateDB(Student student){
            connect();
            String sql = "update student set student_id=?, student_name=?, student_account=?, student_major=?, student_graduate=?, student_bus=?, student_domitory=?, student_pw=?";

            try {
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
                return false;
            }
            finally {
                disconnect();
            }
            return true;
        }
        // 데이터 삭제를 위한 메소드
        public boolean deleteDB(String input_id){
            connect();
            String sql = "delete from student where student_id=?";

            try{
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, input_id);
                pstmt.executeUpdate();
            } catch(SQLException e){
                e.printStackTrace();
                return false;
            }
            finally {
                disconnect();
            }
            return true;
        }
        //새로운 학생의 정보를 입력하는 메소드
        public boolean insertDB(Student student){
            connect();

            String sql = "insert into student(student_id, student_name, student_account, student_major, student_graduate, student_bus, student_domitory, student_pw) values(?,?,?,?,?,?,?,?)";
            try{
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, student.getStudent_id);
                pstmt.setString(2, student.getStudent_name);
                pstmt.setString(3, student.getStudent_account);
                pstmt.setString(4, student.getStudent_major);
                pstmt.setString(5, student.getStudent_graduate);
                pstmt.setString(6, student.getStudent_bus);
                pstmt.setString(7, student.getStudent_domitory);
                pstmt.setString(8, student.getStudent_pw);
                pstmt.executeUpdate();
            } catch(SQLException e){
                e.printStackTrace();
                return false;
            }
            finally {
                disconnect();
            }
            return true;
        }

        public Student getDB(String input_id){
            connect();

            String sql = "select * from student where student_id=?";
            Student student = new Student();

            try{
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
                student.setStudent_pw(rs.getString("student_pw"));
                rs.close();
            } catch(SQLException e){
                e.printStackTrace();
            }
            finally {
                disconnect();
            }
            return student;
        }
    }
