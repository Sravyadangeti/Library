<%@page import="com.entity.Books"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored = "false" errorPage="error.jsp"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
	String userID = (String) session.getAttribute("username");
	 if (userID == null) {
		response.sendRedirect("index.jsp");
	} 
%>

<%
	response.setHeader("Cache-Control","no-cache,no-store,must-validate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

		


<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<style>
	body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 0;
	}

	.row {
		display: flex;
		flex-wrap: wrap;
		align-items: center;
		justify-content: center;
	}

	h3 {
		text-align: center;
	}

	form {
		margin: 10px;
	}

	.table-responsive {
		overflow-x: auto;
	}

	table {
		border-collapse: collapse;
		width: 100%;
	}

	th, td {
		padding: 10px;
		text-align: center;
		
	}

	th {
		background-color:blue;
		font-weight: bold;
	}

	tr:nth-child(even) {
		background-color: #f2f2f2;
	}

	.btn {
		display: inline-block;
		padding: 6px 12px;
		margin-bottom: 0;
		font-size: 14px;
		font-weight: 400;
		line-height: 1.42857143;
		text-align: center;
		white-space: nowrap;
		vertical-align: middle;
		cursor: pointer;
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
		background-image: none;
		border: 1px solid transparent;
		border-radius: 4px;
		color: #fff;
		background-color: blue;
		border-color: blue;
	}

	.btn:hover {
		color: #fff;
		background-color: darkblue;
		border-color: darkblue;
	}

	.hh {
		background-color: #4CAF50;
	}
	
	.center {
		text-align: center;
	}
</style> 
<body >

	<div >
				
           <div class="row">

               <h3 class="d-flex justify-content-center py-3 p-3 mb-2">
                   Library
               </h3>
               <form action="logout" class="t2">
               
	                <div >
						<span style="float:right">Welcome ${username} <input type="submit" value="logout" style="color: #ffffff; background-color:blue;"></span><br/>
	                </div>
               </form>   
               
               <form action="add" class="pad">
	                <div >
						<span style="float:right"><input type="submit" value="Add Book" style="color: #ffffff; background-color:blue;"></span><br/>
	                </div>
               </form>
       		</div>

        <div class= "row center ">
            
            
            <div class="table-responsive t1 ">
                <table class="table table-bordered ">

                        <tr>
                        	<th class="hh">S. No.</th>
					        <th class="hh">Book Code</th>
					        <th class="hh">Book Name</th>
					        <th class="hh">Author</th>
					        <th class="hh">Data Added</th>
					        <th class="hh">Action</th>
				    	</tr>
                        
                        
                    
 		    <%
		
		List<Books> list = (List<Books>) request.getSession().getAttribute("list");
		 if (!list.isEmpty()) {
		%>
		
		<%
			Iterator<Books> iterator = list.iterator();
				int i = 0;
				while (iterator.hasNext()) {
					i++;
					Books book = iterator.next();
		%>
		
						<tr class="center">
							<td><%=i %></td>
							<td><%=book.getBookcode()%></td>
							<td><%=book.getBookname()%></td>
							<td><%=book.getAuthor()%></td>
							<td><%=book.getDataadded()%></td>
							  <td>
							  <a href="<%= request.getContextPath()%>/Deleted?id=<%=book.getBookcode() %>" class="btn btn-primary">Delete</a>
								<a href="<%=request.getContextPath()%>/editpage?id=<%=book.getBookcode()%>" class="btn btn-primary">Edit</a>
							</td> 
						</tr>
			   

		<%
			}
		%>
                   </table>
			</div>
		</div>
		</div>
		<%
		} 
		%>   
</body>
</html>