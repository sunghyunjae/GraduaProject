<%--
  Created by IntelliJ IDEA.
  User: tjddb
  Date: 2019-08-19
  Time: 오후 5:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" import="java.sql.*, student.*" %>
<html lang="en">

<head>
    <jsp:useBean id="ab" scope="request" class="student.Student" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>비밀번호 확인</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h2 text-gray-900 mb-4">개인정보변경</h1>
                                </div>
                                <%
                                    // input_pw 는 바로 전 페이지인 ChangePw.jsp 에서 입력한 첫번째 input(현재 비밀번호) 이다
                                    String input_pw = request.getParameter("now_pw");

                                    // session_pw 는 logincheck.jsp 에서 로그인 성공과 동시에 session에 pw라는 이름으로 저장된 문자이다
                                    String session_pw = session.getAttribute("pw").toString();

                                    // 앞전에 입력한 input_pw와 내 계정이 가지고 있는 session_pw가 다르면 다시 돌려보낸다
                                    if(!input_pw.equals(session_pw)) {
                                        // 변경에 실패하면 실패사유를 경고창으로 띄워주고 현재 비밀번호 입력, 새로운 비밀번호 입력, 확인 페이지로 보낸다
                                %> <script> alert("현재 비밀번호가 안맞네요"); history.go(-1); </script> <%
                            }
                            // input_pw와 session_pw가 같다면 (비밀번호 변경에 요구된 모든조건을 충족했다면)
                            else {
                                // new_pw를 만드는데 이는 전 페이지인 ChangePw.jsp 2번째 input에서 입력한 새로운 비밀번호 이다
                            %>
                                <form name=form1 action="control.jsp" method="post" onsubmit="return input_check_func()">
                                    <input type=hidden name="student_id" value="<%=session.getAttribute("id")%>">
                                    <input type=hidden name="action" value="update">
                                    <center>
                                        <br>
                                        <tr>
                                           <input type="text" name="student_name" placeholder="이름">
                                        </tr>
                                        <br></br>
                                        <tr>
                                            <input type="text" name="student_account" placeholder="계좌">
                                        </tr>
                                    <br></br>
                                        <tr>
                                           <input type="text" name="student_pw" placeholder="비밀번호">
                                        </tr>
                                    <br></br>
                                        <tr>
                                            <td colspan=2 align=center><input type=submit value="저장" class="btn-primary "></td>
                                        </tr>

                                    </center>
                                </form>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
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

</body>

</html>