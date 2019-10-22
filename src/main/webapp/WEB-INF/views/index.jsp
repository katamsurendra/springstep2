<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">

<head>
<title>Keep-Board</title>
</head>

<body>
	<!-- Create a form which will have text boxes for Note title, content and status along with a Add 
		 button. Handle errors like empty fields.  (Use dropdown-list for NoteStatus) -->
		 <h2>Note Information</h2>
	
	<form action='add' method="post" modelAttribute="note">
	  Title:<br>
	  <input type="text" name="noteTitle"><br>
	  Content:<br>
	  <input type="textarea" name="noteContent"><br>
	  Status:<br>
	  <select  name="noteStatus">
		  <option value="active">Active</option>
		  <option value="inactive">Inactive</option>
	  </select>
	  <br>
	  <br>
	  <input type="submit" value="Add">
	  
	</form> 
   <c:if test="${not empty errorMessage}">
	   <p style="color:red">Error</p>: ${errorMessage}
	</c:if>
	<!-- display all existing notes in a tabular structure with Title,Content,Status, Created Date and Action -->
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
	<c:forEach items="${noteList}" var="note">
		
		<tr>
		<td>${note.noteTitle}</td>
		
		<td>${note.noteContent}</td>
		
		<td>${note.noteStatus}</td>
		
		<td>${note.createdAt}</td>
			
		<td>

		<a href="delete?noteId=${note.noteId }">delete</a>
		</td>
		
		<td>
		<a href="updateNote?noteId=${note.noteId}">update</a> 
		</td>
		</tr>
		</c:forEach>	
	</table>
	<h2>Update Notes</h2>
	<form action='update' method="post"> 
	  Note ID:<br>
	  <input type="text" id="noteId" name="noteId" value=${note.noteId} readonly><br>
	  Title:<br>
	  <input type="text" id="noteTitle" name="noteTitle" value=${note.noteTitle}><br>
	  Content:<br>
	  <input type="textarea" id="noteContent" name="noteContent" value=${note.noteContent}><br>
	  Status:<br>
	  <select id="noteStatus" name= "noteStatus">
		  <option value="active">Active</option>
		  <option value="inactive">Inactive</option>
	  </select>
	  <br>
	  <br>
	  <button type="submit" value="update">update</button>
	  
	</form> 
</body>

</html>