<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-07-29
  Time: 오전 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="student.*, java.sql.*" %>
<%-- pageContext.forward("login.jsp"); --%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>부산대학교 모바일 학생증</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <jsp:useBean id="ab" class="student.StudentBean"/>
    <jsp:useBean id="student" class="student.Student"/>
    <jsp:setProperty name="student" property="*"/>
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">모바일 학생증<sup></sup></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
       모바일 학생증
      </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="main.jsp" >
                <i class="fas fa-fw fa-folder"></i>
                <span>HOME</span>
            </a>
            <%
                // 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다.
                if(session.getAttribute("id")==null){
            %>  <script> alert("아이디나 비밀번호를 확인해주세요"); window.location = 'login.jsp';</script>
            <%
                //관리자 계정일 경우 트랜잭션 생성을 위한 페이지 버튼을 보여준다.
            }else if(session.getAttribute("id").equals("admin")){
            %>

            <a class="nav-link collapsed" href="login.jsp" >
                <i class="fas fa-fw fa-folder"></i>
                <span>Mypage</span>
            </a>
            <a class="nav-link collapsed" href="adminbus.jsp" >
                <i class="fas fa-fw fa-folder"></i>
                <span>통학버스</span>
            </a>
            <a class="nav-link collapsed" href="control.jsp?action=domitoryList" >
                <i class="fas fa-fw fa-table"></i>
                <span>기숙사출입목록</span>
            </a>
            <a class="nav-link collapsed" href="control.jsp?action=libraryList" >
                <i class="fas fa-fw fa-table"></i>
                <span>도서관출입목록</span>
            </a>
            <a class="nav-link collapsed" href="adminpay.jsp" >
                <i class="fas fa-fw fa-folder"></i>
                <span>대금결제</span>
            </a>
            <a class="nav-link collapsed" onclick="window.open('https://ethplorer.io/address/0x2d3ea6dd9be22cf44170324975985ae5961bde73?from=search','_blank','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,directories=no, top=10,left=10')" >
                <i class="fas fa-fw fa-folder"></i>
                <span>트랜잭션조회</span>
            </a>
            <%   // 로그인 되었을 경우 - 로그아웃, 내정보 버튼을 보여준다.
            } else{   %>
            <a class="nav-link collapsed" href="login.jsp" >
                <i class="fas fa-fw fa-folder"></i>
                <span>Mypage</span>
            </a>
            <a class="nav-link collapsed" href=trust://" >
                <i class="fas fa-fw fa-folder"></i>
                <span>결제</span>
            </a>
            <a class="nav-link collapsed" href="libDomEnter.jsp" >
                <i class="fas fa-fw fa-folder"></i>
                <span>기숙사도서관출입</span>
            </a>
            <% } %>
        </li>


        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Search -->
                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>


                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>


                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                                <% String id = (String) session.getAttribute("id");
                                    out.print(id);%></span>
                            <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                            <div class="dropdown-divider" href="logout.jsp"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid"ㄴ style="overflow-x:auto;">
                <form>
                    <center>
                        <h1>모바일 학생증</h1>
                    </center>
                    <table class="table table-bordered" id="dataTable" cellspacing="0">

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
                            %>
                        <tr><th>학번</th>  <td><%=student.getStudent_id()%></td>
                        <tr><th>이 름</th>  <td><%=student.getStudent_name()%></td>
                        <tr><th>전 공</th>  <td><%=student.getStudent_major()%></td>
                        <tr><th>졸업 여부</th> <td><%=student.getStudent_graduate()%></td>
                        <tr><th>통학버스신청여부</th> <td><%=student.getStudent_bus()%></td>
                        <tr><th>기숙사신청여부</th>  <td><%=student.getStudent_domitory()%></td>
                            <%-- DB에서 가져온 값을 출력하는 과정--%>
                    </table>
                </form>

            </div>
            <!-- /.container-fluid -->


        </div>
        <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="logout.jsp">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="js/demo/chart-area-demo.js"></script>
<script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>


