<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-12
  Time: 오후 5:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" errorPage="error.jsp"
         pageEncoding="utf-8"  errorPage="error.jsp" import="student.*, java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
            <a class="nav-link collapsed" href="pay.jsp" >
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
            <div class="container-fluid" align=center>
                <h1> 학생 등록 </h1>
                <form name=form1 action="control.jsp" method="post" onsubmit="return input_check_func()" >
                    <input type=hidden name="action" value="insert">
                    <table class="table table-bordered" id="dataTable" cellspacing="0" style="text-align: center;">

                        <tr>
                            <th> id </th> <td> <input id = "student_id" name="student_id"> </td>
                        </tr>
                        <tr>
                            <th> 이름 </th> <td> <input id = "student_name" name="student_name"> </td>
                        </tr>
                        <tr>
                            <th> 계좌 </th> <td> <input id = "student_account" name="student_account"> </td>
                        </tr>
                        <tr>
                            <th> 전공 </th> <td> <input id = "student_major" name="student_major"> </td>
                        </tr>
                        <tr>
                            <th> 졸업여부 </th> <td> <input id = "student_graduate" name="student_graduate"> </td>
                        </tr>
                        <tr>
                            <th> 통학버스신청여부 </th> <td> <input id ="student_bus" name="student_bus"> </td>
                        </tr>
                        <tr>
                            <th> 기숙사신청여부 </th> <td> <input id ="student_domitory" name="student_domitory"> </td>
                        </tr>
                        <tr>
                            <th> 이더리움주소 </th> <td> <input id = "student_ethaddr" name="student_ethaddr"> </td>
                        </tr>
                        <tr>
                            <th> 비밀번호 </th> <td> <input id = "student_pw" name="student_pw"> </td>
                        </tr>

                    </table>
                    <button type=submit class="btn btn-primary btn-user ">
                        등록
                    </button>
                </form>

                <script>
                    // input_check_func는 회원가입에 필요한 4가지 문항을 전부다 채워 넣었는지 check 해준다
                    // 이는 form onsubmit에 의해 발동되며 return 값이 false 일 경우 페이지의 데이터가 action= 좌표로 넘어가지 않게된다
                    function input_check_func() {
                        var id = document.getElementById('student_id').value;
                        var pw = document.getElementById('student_pw').value;
                        var name = document.getElementById('student_name').value;
                        var major = document.getElementById('student_major').value;
                        var account = document.getElementById('student_account').value;
                        var graduate = document.getElementById('student_graduate').value;
                        var bus = document.getElementById('student_bus').value;
                        var domitory = document.getElementById('student_domitory').value;
                        var ethaddr = document.getElementById('student_ethaddr').value;

                        if(id == null || pw == null || name == null || major == null || account == null || graduate == null || bus == null || domitory == null || ethaddr == null ||
                            id == ""   || pw == ""   || name == "" || major == "" || account =="" || graduate == "" || bus =="" || domitory =="" || ethaddr == "") {

                            alert("공백은 허용치 않는다");
                            return false;
                        } else {
                            // 모든조건이 충족되면 true를 반환한다 이는 현재 페이지의 정보를 action= 좌표로 넘긴다는것을 의미
                            return true;
                        }
                    }
                </script>

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
