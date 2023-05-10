<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Librarian Page</title>

</head>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<!-- css -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- javscript -->
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<style>
.custom-bg{
	background:#46D7AC;
}

</style>

<body>
<% 
	response.setHeader("Cache-Control","no-cache,no-store,must-validate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
	%>
<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
  <div class="container" style="float:left">
<h3>Login</h3>
  
  </div> 
  </div>
</nav>
	<c:if test="${not empty error }">
		<div class="alert alert-warning ">
			<strong class="text-center"><c:out value="${error}" /></strong>
		</div>
		<c:set var="error" value="" scope="session" />
	</c:if>
		<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-header custom-bg">
						<h3>Login Here</h3>
					</div>
					<div class="card-body">
		<form name="login-form" action="login" method="post" class="needs-validation" novalidate>
			<div class="form-group">
								<label for="exampleInputEmail1">Username</label> <input
									type="text" name="username" id="username"class="form-control"
									 aria-describedby="emailHelp"
									placeholder="Enter username"  required> 
         							 <div class="invalid-feedback feedback-pos">Please enter the username</div>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password" >
									 <a id="lnkforget" class="hyperlink" style="float: right; margin-right: 5px;color:#87CEEB;cursor:pointer;" href="#">Forgot</a>
									<small>
                                    <div class="help-block with-errors"></div>
                                </small>
							</div>
                              <small>
                                    <a href></div>
                                </small>
							<div class="container text-center">
								<button type="submit" value="Login" class="btn btn-primary custom-bg">Submit</button>
								<button type="text" value="clear"
									class="btn btn-primary custom-bg">Reset</button>
							</div>
		</form>
			</div>
		</div>
	</div>
	</div>
<script>
(function() {
	'use strict';
	window.addEventListener('load', function() {
	var forms = document.getElementsByClassName('needs-validation');
	var validation = Array.prototype.filter.call(forms, function(form) {
	  form.addEventListener('submit', function(event) {
	    if (form.checkValidity() === false) {
	      event.preventDefault();
	      event.stopPropagation();
	    }
	    form.classList.add('was-validated');
	  }, false);
	});
	}, false);
	})();
	
$(document).ready(function () {

    $("#lnkforget").click(
        function () {
            AlertSave();
        }            
    );
});

</script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
   
</body>
</html>