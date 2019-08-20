<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-17
  Time: 오후 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"   import="student.*, java.util.* ,java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="ab" class="student.StudentBean"/>
<jsp:useBean id="student" class="student.Student"/>
<jsp:setProperty name="student" property="*"/>
<%
    // 컨트롤러 요청 파라미터
    String action = request.getParameter("action");
    // 파라미터에 따른 요청 처리

    // 개인정보 확인 요청인 경우
    if(action.equals("list")) {
        String id = (String)session.getAttribute("id");
        Student studentList = ab.getDB(id);
        request.setAttribute("student", studentList);
        pageContext.forward("main.jsp");
    }
    // 학생 등록 요청인 경우
    else if(action.equals("insert")) {

        if(ab.insertDB(student)) {
            System.out.println(student.getStudent_name());
            response.sendRedirect("control.jsp?action=list");
        }
        else
            pageContext.forward("register.jsp");
    }
    // 학생 정보 수정 페이지 요청인 경우
    /*else if(action.equals("edit")) {
        Student student = ab.getDB(Student.getStudent_id());
        if(!request.getParameter("upasswd").equals("1234")) {
            out.println("<script>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
        }
        else {
            request.setAttribute("ab",student);
            pageContext.forward("changeinfo.jsp");
        }
    }*/
    // 개인정보 수정 요청인 경우
    else if(action.equals("update")) {
        if(ab.updateDB(student)) {
            response.sendRedirect("control.jsp?action=list");
        }
        else
            throw new Exception("DB 갱신오류");
    }
    // 주소록 삭제 요청인 경우
    else if(action.equals("delete")) {

        if(ab.deleteDB(student.getStudent_id())) {
            response.sendRedirect("control.jsp?action=list");
        }
        else
            throw new Exception("DB 삭제 오류");
    }
    else if(action.equals("main")){
        pageContext.forward("main.jsp");
    }
    else {
        out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
    }
%>
