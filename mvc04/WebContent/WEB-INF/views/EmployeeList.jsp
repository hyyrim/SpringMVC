<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); 	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmployeeList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		$(".updateBtn").click(function()
		{
			// 테스트
			//alert("수정 버튼 클릭");
			
			/* employeeupdateform.action?name=한혜림&ssn1=xxx&ssn2=yyy */
			// 1. 요청해야 하는 페이지가 employeeupdateform 이다.
			// 2. 원래는 각각의 속성들을 이렇게 updateform 을 그리면서 안에
			//	  값을 다 채운 형태를 그려야하는데 (속성값 하나하나 넘겨야 함)
			
			// 3. 이렇게 해야하는 것을 아이디만 넘겨서 객체형식으로 얻기 ★
			// employee.action 페이지 요청
			// employeeId 전송
			$(location).attr("href", "employeeupdateform.action?employeeId=" + $(this).val());
		});
		
		$(".deleteBtn").click(function()
		{
			// 테스트
			//alert("삭제 버튼 클릭");
			
			// 별도의 폼(페이지)이 필요 없기 때문에 ...
			if (confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
			{
				$(location).attr("href", "employeedelete.action?employeeId=" + $(this).val());
			}
			
		});
	});
	
</script>

</head>
<body>

<!--------------------------------------------------
	#14. EmployeeList.jsp
	- 직원 리스트 출력 페이지
	- 관리자가 접근하는 직원 데이터 출력 페이지
	  (일반 직원이 접근하는 직원 데이터 출력 페이지는
	   EmpList.jsp 로 구성할 예정)
--------------------------------------------------->

<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>

	<!-- 콘텐츠 영역 -->
	<div id="content">
		
		<h1>[ 직원 관리 ]</h1>
		<hr>
		
		<div>
			<form action="">
				<input type="button" value="직원 추가" class="btn"
				onclick="location.href='employeeinsertform.action'">
			</form>
		</div>
		
		<br><br>
		
		<table id="customers" class="table">
			<tr>
				<!-- 항목 15EA -->
				<th>번호</th>
				<th>이름</th>
				<th>주민번호</th>
				<th>생년월일</th>
				<th>양/음력</th>
				<th>전화번호</th>
				<th>지역</th>
				<th>부서</th>
				<th>직위</th>
				<th>기본급</th>
				<th>수당</th>
				<th>급여</th>
				<th>등급</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>

			
			<c:forEach var="employee" items="${employeeList }">
			<tr>
				<td>${employee.employeeId}</td>
				<td>${employee.name}</td>
				<td>${employee.ssn}-*******</td>
				<td>${employee.birthday}</td>
				<td>${employee.lunarName}</td>
				<td>${employee.telephone}</td>
				<td>${employee.regionName}</td>
				<td>${employee.departmentName}</td>
				<td>${employee.positionName}</td>
				
				<%-- <td>${employee.basicPay}</td> --%>
				<td>
					<fmt:formatNumber value="${employee.basicPay }"
					groupingUsed="true"></fmt:formatNumber>
				</td>
				<!-- 1,500,000 과 같은 format 으로 출력된다. -->
				
				<td>
					<fmt:formatNumber value="${employee.extraPay }"
					groupingUsed="true"></fmt:formatNumber>
				</td>
				
				<td>
					<fmt:formatNumber value="${employee.pay }"
					groupingUsed="true"></fmt:formatNumber>
				</td>
				
				<%-- <td>${employee.grade}</td> --%>
				<td>${employee.grade==0 ? "관리자" : "일반직원"}</td>
				
				<td><button type="button" class="btn updateBtn"
				value="${employee.employeeId }">수정</button></td>
				<td><button type="button" class="btn deleteBtn"
				value="${employee.employeeId }">삭제</button></td>	
			</tr>		
			</c:forEach>
			
			<!-- 		
			<tr>
				<td>1</td>
				<td>박나현</td>
				<td>631212</td>
				<td>1963-12-12</td>
				<td>양력</td>
				<td>010-1111-1111</td>
				<td>서울</td>
				<td>개발부</td>
				<td>사원</td>
				<td>1,500,000</td>
				<td>1,000,000</td>
				<td>2,500,000</td>
				<td>관리자</td>
				<td><button type="button" class="btn">수정</button></td>
				<td><button type="button" class="btn">삭제</button></td>
			</tr>
			 -->
		</table>
	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	
	</div>
	
</div>


</body>
</html>