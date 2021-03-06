
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KeepNote</title>
</head>
<body>
	<!-- Create a form which will have text boxes for Note ID, title, content and status along with a Send 
		 button. Handle errors like empty fields -->
		 
		 
	<h2>Note Information</h2>
	
	<form action="/add" method="POST">
	  
	 
	  Title:<br>
	  <input type="text" name="noteTitle"><br>
	  Content:<br>
	  <input type="textarea" name="noteContent"><br>
	  Status:<br>
	  <select  name= "noteStatus">
		  <option value="pending">pending</option>
		  <option value="ongoing">ongoing</option>
		  <option value="completed">completed</option>
	  </select>
	  <br>
	  <br>
	  <input type="submit" value="Submit">
	  
	</form> 
	<br>
	<!-- display all existing notes in a tabular structure with Id, Title,Content,Status, Created Date and Action -->
	<c:if test="${not empty errorMessage}">
	   <p style="color:red">Error</p>: ${errorMessage}
	</c:if>
	<h2>Saved Notes</h2>
	<table border="2">
	
	<tr>
		<td>Title</td>
		<td>Content</td>
		<td>Status</td>
		<td>Created at</td>
		<td>Delete Row</td>
		<td>Update Row</td>
	</tr>
	<c:forEach items="${notelist}" var="Note">
		
		<tr>
		<td>${note.noteTitle}</td>
		
		<td>${note.noteContent}</td>
		
		<td>${note.noteStatus}</td>
		
		<td>${note.createdAt}</td>
		
		<td>
		<form action="/delete" method="GET">
			<input type="hidden" id="noteId" name="noteId" value="${note.noteId}"/>
			<button type="submit">Delete</button>
		</form>
		</td>
		
		<td>
		<form action="/update" method="post">
			<input type="hidden" id="noteId" name="noteId" value="${note.noteId}"/>
			<button type="submit">Update</button>
		</form>
		</td>
		</tr>
		</c:forEach>	
	</table>
</body>

</html>