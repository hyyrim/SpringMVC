<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); 	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
</head>
<body>

<div>
	<h2>회원 추가</h2>
	<hr>
	<a href="memberlist.action">회원 리스트</a>
</div>

<div>
	<form action="memberinsert.action" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" id="id" name="id">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" id="pw" name="pw">
				</td>
			</tr>
			<tr>
				<th>이름</th>
					<td>
					<input type="text" id="name" name="name">
				</td>
			</tr>
			<tr>
				<th>전화</th>
				<td>
					<input type="tel" id="tel" name="tel">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" id="email" name="email">
				</td>
			</tr>
			<br><br>
			<td colspan="2">
				<button type="submit">등록</button>
				<button type="reset">취소</button>
			</td>
				
		</table>
	
	</form>
</div>

</body>
</html>