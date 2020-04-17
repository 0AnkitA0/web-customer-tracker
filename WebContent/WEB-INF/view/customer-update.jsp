<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<title>
Update Customer
</title>
<head><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover({
        placement : 'bottom',
        trigger : 'hover'
    });
});
</script>
<style>
#grad1 {
left: 100px;
 height: 300px;
 width: 400px;
  <!--background-color: red; /* For browsers that do not support gradients */-->
  <!-- /* background-image: linear-gradient(to right, #f6f1d3, #648880 65%, #293f50 ); /* Standard syntax (must be last) */ -->
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;
}
	.bs-form{
		margin: -20px 50px
	}
	.bs-example{
    	margin: 50px 35px;
    }
</style>

</head>
<body style="text-align: center;">
		<div id="grad1">
			<div class="bs-form">
<br>
			<h2>Update Customer</h2>
<br><br>
				<form:form action="processUpdate" modelAttribute="updateCustomer" method="POST">
				<form:hidden path="id" />
					First Name: <form:input type="text" path="firstName"  value="${updateCustomer.firstName}" />
<br>
					Last Name: <form:input type="text" path="lastName" value="${updateCustomer.lastName}" />
<br>
					Email: <form:input type="text" path="email" value="${updateCustomer.email}" />
<br>
					<!--  <input type="submit" value="Update Details" />-->

					<!-- Using BootStap popover -->
			</div>
			<div class="bs-example">
    		<button type="submit" class="btn btn-primary" data-toggle="popover" title="Update" data-content="Submits and Updates Customer.">Update</button>
    		<a href="${pageContext.request.contextPath}/customer/list" class="btn btn-info" role="button" data-toggle="popover"  data-content="Customer List">Back to List</a>
    
 			</div>   
			</form:form>
<br><br>
			<a href="${pageContext.request.contextPath}/customer/list">Back to List</a>
		</div>

</body>
</html>