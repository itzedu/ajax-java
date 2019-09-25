<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HomePage</title>
	<style>
		form {
			display: inline-block;
		}
		
		button {
			border: none;
			font-size: 14px;
			color: blue;
		}
		
		button:hover {
			text-decoration: underline;
		}
	</style>
</head>
<body>
	<h1>Display all students</h1>
	
	<table>
		<thead>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${allStudents}" var="student">
				<tr>
					<td><c:out value="${student.firstName}"/></td>
					<td><c:out value="${student.lastName}"/></td>
					<td>
						<a href="/students/${student.id}">Show</a> |
						<a href="/students/${student.id}">Edit</a> |
						<form action="/students/${student.id}" method="POST">
							<input type="hidden" name="_method" value="DELETE" />
							<button type="submit">Delete</button>
						</form>
					</td>
				</tr>		
			</c:forEach>
		</tbody>
	</table>
	
	<a href="/students/new">New Student</a>
</body>
</html>