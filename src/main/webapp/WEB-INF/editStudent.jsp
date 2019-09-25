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
</head>
<body>
	<h1>Edit student</h1>
	
	<form:errors path="studentObj.*" />
	
	<form:form action="/students/${studentObj.id}" method="POST" modelAttribute="studentObj">
		<input type="hidden" name="_method" value="PUT"/>
		<p>
	        <form:label path="firstName">First Name:</form:label>
	        <form:input path="firstName"/>
	    </p>
	    <p>
	        <form:label path="lastName">Last Name:</form:label>
	        <form:input path="lastName"/>
	    </p>
	    <input type="submit" value="Submit"/>
	</form:form>
</body>
</html>