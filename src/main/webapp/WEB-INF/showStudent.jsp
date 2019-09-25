<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New Student</title>
</head>
<body>
	<h1><c:out value="${studentObj.firstName}"/> <c:out value="${studentObj.lastName}"/></h1>
	
	<form:form action="/addCourse" method="POST" modelAttribute="enrollmentObj">
		<form:hidden path="student" value="${studentObj.id}" />
		<p>
			<form:label path="course">Course:</form:label>
	        <form:select path="course">
	        	<c:forEach items="${nonCurrentCourses}" var="c">
	        		<form:option value="${c.id}"><c:out value="${c.name}"/></form:option>
	        	</c:forEach>
	        </form:select>
	    </p>
	    <input type="submit" value="Submit"/>
	</form:form>
	
	<h1>Courses Signup</h1>
	<table>
		<thead>
			<tr>
				<th>Course Name</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
        	<c:forEach items="${studentObj.courses}" var="c">
        		<tr>
        			<td><c:out value="${c.name}"/></td>
        			<td>Action</td>
        		</tr>
        	</c:forEach>
		</tbody>
	</table>
	
</body>
</html>