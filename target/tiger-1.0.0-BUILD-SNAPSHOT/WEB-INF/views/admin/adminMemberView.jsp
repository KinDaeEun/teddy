<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../headerBase.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.m_all{
margin-bottom: 20px;
}
</style>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div align="center" class="m_all">
<div class="card" style="width: 18rem;">
  <img src="${path}/resources/upload/${member.fileName}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">이름</h5>
    <p class="card-text">${member.name } </p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">아이디 : ${member.id }</li>
    <li class="list-group-item">성별 : ${member.gender } </li>
    <li class="list-group-item">가입일 : ${member.regdate }</li>
    <li class="list-group-item">이메일 : ${member.email }</li>
  </ul>
  <div class="card-body">
    <a href="${path }/admin/adminMemberDelete.do?id=${member.id}&pageNum=${pageNum }" class="card-link">회원삭제</a>
  </div>
</div>
 


</div>
</body>
</html>