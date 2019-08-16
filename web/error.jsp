<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<body>
<div align="center">
    <H2>웹페이지 오류</H2>
    <HR>
    <table cellpadding=5 width=400>
        <tr width=100% bgcolor="pink"><td>
            웹페이지 처리중 에러가 발생 했습니다.<BR>
            관리자에게 문의해 주세요..<BR>
            빠른시일내 복구하겠습니다.
            <HR>
            에러내용 : <%= exception%>
            <HR>

        </td>
        </tr>
    </table>
</div>
</body>
</HTML>