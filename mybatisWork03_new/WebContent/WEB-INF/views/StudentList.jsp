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
<title>StudentList.jsp</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style type="text/css">
   
   th, td
   {
   		text-align: center;
   }
</style>

</head>
<body>

<div class="panel title">
	<h1>성적관리(SpringMVC + Annotation + Mybatis 버전)</h1>
</div>

<!-- 메인 메뉴 영역  -->
<nav class="navbar navbar-default">

	<div class="container-fluid">
	
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Home</a>
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active">
					<a href="studentlist.action">학생 관리 <span class="sr-only">(current)</span></a>
				</li>
				
				<li>
					<a href="gradelist.action">성적 관리</a>
				</li>
				
			</ul>
		</div>
		
		
	</div><!-- close .container-fluid -->
	
	
	
</nav> 



<div class="containr">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading row">
				<span style="font-size: 17pxt; font-weight:bold;" class="col-md-3">
					학생 리스트 출력
				</span>
				<span class="col-md-9">
					<a href="studentinsertform.action" role="button" class="btn btn-success btn-xs"
					id ="btnAdd" style="vertical-align: bottom;">학생추가</a>
				</span>
			</div><!-- close .panel-heading .row -->
			
			<div class="panel-body">
				<!-- 전체 학생 수<span class="badge">4</span> -->
				전체 학생 수<span class="badge">${count }</span>
			</div>
			
			<div class="panel-body">
				<table class="table table-hover table-striped">
					<thead>
						<tr class="trTitle">
							<th>번호</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>성적 입력여부</th>
							<!-- <th>수정 및 삭제</th> -->
						</tr>
					</thead>
					
					<tbody>
						<!-- <tr>
							<td>1</td>
							<td>심혜진</td>
							<td>010-4444-4444</td>
							<td>O</td>
							<td>
								<button type="button"  class="btn btn-success">수정</button>
								<button type="button"  class="btn btn-success">삭제</button>
							</td>
						</tr>
						
						<tr>
							<td>2</td>
							<td>이새롬</td>
							<td>010-3333-3333</td>
							<td>X</td>
							<td>
								<button type="button"  class="btn btn-success">수정</button>
								<button type="button"  class="btn btn-success">삭제</button>							
							</td>
						</tr>
						
						<tr>
							<td>3</td>
							<td>장서현</td>
							<td>010-4444-4444</td>
							<td>X</td>
							<td>
								<button type="button"  class="btn btn-success">수정</button>
								<button type="button"  class="btn btn-success">삭제</button>							
							</td>
						</tr>			 -->	
						
						
						<c:forEach var="student" items="${list }">
						<tr>
							<td>${student.sid }</td>
							<td>${student.name }</td>
							<td>${student.tel }</td>
							<c:if test="${student.sub == 0 }">
							<td>Ⅹ</td>
							</c:if>
							<c:if test="${student.sub == 1 }">
							<td>○</td>
							</c:if>
							<td>
								<button type="button"  class="btn btn-success">수정</button>
								<button type="button"  class="btn btn-danger">삭제</button>							
							</td>
						</tr>
						</c:forEach>
								
					</tbody>
					
				</table>				
			</div>
			
		</div>
	</div>
</div>


</body>
</html>