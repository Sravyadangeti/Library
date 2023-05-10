<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.entity.Authors"%> 
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Page</title>

<style>
/* Add CSS styling here */
.edit-form {
    border: 1px solid #ccc;
    padding: 20px;
    max-width: 500px;
    margin: 0 auto;
}

.edit-form input[type=text], .edit-form button[type=submit], .edit-form button[type=reset] {
    width: 100%;
    padding: 12px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

.edit-form button[type=submit], .edit-form button[type=reset] {
    background-color: #4CAF50;
    color: white;
    border: none;
}

.edit-form button[type=submit]:hover, .edit-form button[type=reset]:hover {
    opacity: 0.8;
}
select {
  box-sizing: border-box;

  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;

  background-color: transparent;
  border:inset;
  padding: 0;
  margin: 5px;
  width: 100%;

  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  font-size: 16px;
  font-weight: 500;
  line-height: 1.3;

  cursor: default;
}
</style>

</head>
<body>
<% 
	response.setHeader("Cache-Control","no-cache,no-store,must-validate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
	%>
	<div class="edit-form" id="myForm">
	<h1 Style="text-align: center">Add Book Details</h1>
		<form action="data" class="form-container" method="post" Style="text-align: center">
			<tr>
				<td>Add Book code :</td>
				<td><input type="text" placeholder="Enter Book code" name="bookcode" required /><br/></td>
			</tr>
			<tr>
				<td>Book Name :</td>
				<td><input type="text" placeholder="Enter Book name " name="bookname" required /><br/></td>
			</tr>
			<tr>
			<td>Authors</td><br>
			<td>
			<%
			List<Authors> list = (List<Authors>) request.getSession().getAttribute("AuthorList");
			 if (!list.isEmpty()) {
			%>
			<select name="author" >
			<%
				Iterator<Authors> iterator = list.iterator();
					int i = 0;
					
					while (iterator.hasNext()) {
						i++;
						Authors authorList = iterator.next();
			%>
								<option value="<%=authorList.getName()%>"><%=authorList.getName()%></option>
			<%
				}
			%>
			</select required>
	     	<%
			} 
			%> </td> <br> 
			</tr>
			<tr>
				<td>Data added :</td>
				<td><input type="text" placeholder="Enter data added" name="datadded" value="<%=new java.text.SimpleDateFormat("dd MM yyyy").format(new java.util.Date())%>" readonly/><br/></td>
			</tr>
			<button type="submit" class="btn">Submit</button>
			<button type="Reset" class="btn cancel" >Cancel</button>
		</form>
	</div>
</body>
</html>
