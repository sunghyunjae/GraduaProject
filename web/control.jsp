<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-17
  Time: 오후 3:20
  To change this template use File | Settings | File Templates.
--%>
<%-- 전반적인 JSP파일들을 컨트롤 해주는 역활을 하며 다양한 액션파라미터 각각의 동작유형에 대해서 구현--%>
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

    //도서관 출입 로그 요청인 경우
    if(action.equals("libraryList")){
        ArrayList<Student> datas = ab.getLibraryList();
        request.setAttribute("datas", datas);
        pageContext.forward("adminlibrary.jsp");
    }

    //기숙사 출입 로그 요청인 경우
    else if(action.equals("domitoryList")){
        ArrayList<Student> datas = ab.getDomitoryList();
        request.setAttribute("datas", datas);
        pageContext.forward("admindomitory.jsp");
    }
    // 학생 등록 요청인 경우
     else if(action.equals("insert")) {
        if(ab.insertDB(student)) {
            System.out.println(student.getStudent_name());
            out.println("<script>alert('등록되었습니다!!!')</script>");
            response.sendRedirect("control.jsp?action=login");
        }
        else
            pageContext.forward("register.jsp");
    }

    // 개인정보 수정 요청인 경우
    else if(action.equals("update")) {
        if(ab.updateDB(student)) {
            out.println("<script>alert('수정되었습니다!!!')</script>");
            response.sendRedirect("control.jsp?action=login");
        }
        else
            throw new Exception("DB 갱신오류");
    }
    // 개인정보 삭제 요청인 경우
    else if(action.equals("delete")) {
        if(ab.deleteDB(student.getStudent_id())) {
            out.println("<script>alert('삭제되었습니다!!!')</script>");
            response.sendRedirect("control.jsp?action=login");
        }
        else
            throw new Exception("DB 삭제 오류");
    }
    //Main문으로의 전환을 하는 경우
    else if(action.equals("main")){
        pageContext.forward("main.jsp");
    }
    //login 페이지로 전환을 하는 경우
    else if(action.equals("login")){
        pageContext.forward("login.jsp");
    }
    else if(action.equals("enterDomitory")) {
        String stid = (String)session.getAttribute("id");
        student.setStudent_id(stid);
        if (ab.updateEnterDomitory(student)) {
            out.println("<script>alert('기숙사 입실 확인되었습니다.');history.go(-1);</script>");
        }
    }
    else if(action.equals("quitDomitory")) {
        String stid = (String)session.getAttribute("id");
        student.setStudent_id(stid);
        if (ab.updateQuitDomitory(student)) {
            out.println("<script>alert('기숙사 퇴실 확인되었습니다.');history.go(-1);</script>");
        }
    }
    else if(action.equals("enterLibrary")) {
        String stid = (String)session.getAttribute("id");
        student.setStudent_id(stid);
        if (ab.updateEnterLibrary(student)) {
            out.println("<script>alert('도서관 입실 확인되었습니다.');history.go(-1);</script>");
        }
    }
    else if(action.equals("quitLibrary")) {
        String stid = (String)session.getAttribute("id");
        student.setStudent_id(stid);
        if (ab.updateQuitLibrary(student)) {
            out.println("<script>alert('도서관 퇴실 확인되었습니다.');history.go(-1);</script>");
        }
    }

    //액션파라미터 값의 오류가 있을경우 호출
    else {
        out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
    }
%>
