<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ page isErrorPage="true" %>        
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New Student</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			$("form").submit(function() {
				var actionUrl = $(this).attr("action");
				var body = $(this).serialize();
				
				$.ajax({
					  url: actionUrl,
					  method: "POST",
					  data: body,
					  success: function(data) {
						  var newRow = "<tr><td>" + data.firstName + "</td><td>" + data.lastName + "</td></tr>";
						  console.log(newRow);
					  	  $("tbody").append(newRow);
					  },
					  dataType: "json"
				});
				
				return false;
			})
		})
	</script>
</head>
<body>
	<h1>Create new student</h1>
	
	<form action="/api/students" method="POST">
		<p>
			<label for="firstName">First Name</label>
			<input type="text" name="firstName" id="firstName" />
		</p>
		<p>
			<label for="lastName">Last Name</label>
			<input type="text" name="lastName" id="lastName" />
		</p>
		<input type="submit" value="Create" />
	</form>
	
	<table>
		<thead>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${allStudents}" var="student">
				<tr>
					<td><c:out value="${student.firstName}"/></td>
					<td><c:out value="${student.lastName}"/></td>
				</tr>		
			</c:forEach>
		</tbody>
	</table>
</body>
</html>