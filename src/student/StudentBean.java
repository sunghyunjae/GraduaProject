package student;

import java.sql.*;
import java.util.*;
import java.io.*;
import java.util.Date;

//자바빈즈
//Student 클래스의 데이터 입력, 수정 삭제, JDBC 연동과 관련된 소스코드가 작성되어 있음
public class StudentBean {
    //JDBC 연동과 관련해서 필요한 인스턴시 초기화
    Connection conn = null;
    PreparedStatement pstmt = null;

    String jdbc_driver = "com.mysql.jdbc.Driver"; // JDBC 드라이버 주소
    String server = "localhost"; // MySQL 서버 주소
    String database = "student"; // MySQL DATABASE 이름
    String user_name = "root"; //  MySQL 서버 아이디
    String password = "1897121"; // MySQL 서버 비밀번호

    //JDBC를 통해 MySQL을 연결하는 함수
    void connect() {
        try {
            Class.forName(jdbc_driver);
            try {
                conn = DriverManager.getConnection("jdbc:mysql://" + server + "/" + database + "?serverTimezone=UTC&useSSL=false", user_name, password);
                System.out.println("정상적으로 연결되었습니다.");
            } catch(SQLException e) {
                System.err.println("conn 오류:" + e.getMessage());
                e.printStackTrace();
            }
            System.out.println("정상적으로 연결되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //MySql과의 연결을 끊는 함수
    void disconnect() {
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

    // 데이터 업데이트를 위한 메소드
    public boolean updateDB(Student student) {
        connect();
        String sql = "update student set student_name=?, student_account=?, student_pw=? WHERE student_id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, student.getStudent_name());
            pstmt.setString(2, student.getStudent_account());
            pstmt.setString(3, student.getStudent_pw());
            pstmt.setString(4, student.getStudent_id());
            pstmt.executeUpdate();
            System.out.println("DB수정 완료.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("DB수정 실패.");
            return false;
        } finally {
            disconnect();
        }
        return true;
    }

    // 데이터 삭제를 위한 메소드
    public boolean deleteDB(String input_id) {
        connect();
        String sql = "delete from student where student_id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, input_id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            disconnect();
        }
        return true;
    }

    //새로운 학생의 정보를 입력하는 메소드
    public boolean insertDB(Student student) {
        connect();

        String sql = "insert into student(student_id, student_name, student_account, student_major, student_graduate, student_bus, student_domitory, student_ethaddr, student_pw) values(?,?,?,?,?,?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, student.getStudent_id());
            pstmt.setString(2, student.getStudent_name());
            pstmt.setString(3, student.getStudent_account());
            pstmt.setString(4, student.getStudent_major());
            pstmt.setString(5, student.getStudent_graduate());
            pstmt.setString(6, student.getStudent_bus());
            pstmt.setString(7, student.getStudent_domitory());
            pstmt.setString(8, student.getStudent_ethaddr());
            pstmt.setString(9, student.getStudent_pw());
            pstmt.executeUpdate();
            System.out.println("DB업로드 완료.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("DB업로드 실패.");
            return false;
        } finally {
            disconnect();
        }
        return true;
    }
    public ArrayList<Student> getLibraryList() {
        connect();
        ArrayList<Student> datas = new ArrayList<Student>();
        String sql = "select student_id, student_name, student_major, libraryInputTime, libraryOutputTime from student where student_graduate = '0'";
        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                System.out.println("도서관 출입 현황출력");
                Student student = new Student();
                student.setStudent_id(rs.getString("student_id"));
                student.setStudent_name(rs.getString("student_name"));
                student.setStudent_major(rs.getString("student_major"));
                student.setLibraryInputTime(rs.getString("libraryInputTime"));
                student.setLibraryOutputTime(rs.getString("libraryOutputTime"));
                datas.add(student);
            }
            rs.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            disconnect();
        }
        return datas;
    }

    public ArrayList<Student> getDomitoryList() {
        connect();
        ArrayList<Student> datas = new ArrayList<Student>();
        String sql = "select student_id, student_name, student_major, domitoryInputTime, domitoryOutputTime from student where student_domitory ='1' and student_graduate = '0'";
        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                System.out.println("기숙사 출입 현황출력");
                Student student = new Student();
                student.setStudent_id(rs.getString("student_id"));
                student.setStudent_name(rs.getString("student_name"));
                student.setStudent_major(rs.getString("student_major"));
                student.setDomitoryInputTime(rs.getString("domitoryInputTime"));
                student.setDomitoryOutputTime(rs.getString("domitoryOutputTime"));
                datas.add(student);
            }
            rs.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            disconnect();
        }
        return datas;
    }
    public boolean updateEnterLibrary(Student student) {
        connect();
        String sql = "update student set libraryCheck=?, libraryInputTime =now() WHERE student_id=?";
        System.out.println(student.getStudent_id());
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,1);
            pstmt.setString(2, student.getStudent_id());
            pstmt.executeUpdate();
            System.out.println("DB수정 완료.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("DB수정 실패.");
            return false;
        } finally {
            disconnect();
        }
        return true;
    }
    public boolean updateQuitLibrary(Student student) {
        connect();
        String sql = "update student set libraryCheck=?, libraryOutPutTime =now() WHERE student_id=?";
        System.out.println(student.getStudent_id());
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,0);
            pstmt.setString(2, student.getStudent_id());
            pstmt.executeUpdate();
            System.out.println("DB수정 완료.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("DB수정 실패.");
            return false;
        } finally {
            disconnect();
        }
        return true;
    }
    public boolean updateEnterDomitory(Student student) {
        connect();
        String sql = "update student set domitoryCheck=?, domitoryInputTime =now() WHERE student_id=?";
        System.out.println(student.getStudent_id());
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,1);
            pstmt.setString(2, student.getStudent_id());
            pstmt.executeUpdate();
            System.out.println("DB수정 완료.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("DB수정 실패.");
            return false;
        } finally {
            disconnect();
        }
        return true;
    }
    public boolean updateQuitDomitory(Student student) {
        connect();
        String sql = "update student set domitoryCheck=?, domitoryOutputTime =now() WHERE student_id=?";
        System.out.println(student.getStudent_id());
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,0);
            pstmt.setString(2, student.getStudent_id());
            pstmt.executeUpdate();
            System.out.println("DB수정 완료.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("DB수정 실패.");
            return false;
        } finally {
            disconnect();
        }
        return true;
    }
    /*  학생의 정보를 가져오는 함수로서 자바빈즈로서 구현 후 JSP에서 호출을 할 경우 에러, 오류가 많이 발생해서 JSP에서 직접 구현하는 것으로 변경함
    public Student getDB(String input_id) {
        connect();

        String sql = "select student_id, student_name, student_account, student_major, student_graduate, student_bus, student_domitory, student_ethaddr from student where student_id=?";
        Student student = new Student();

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
            disconnect();
        }
        return student;
    }*/


}

