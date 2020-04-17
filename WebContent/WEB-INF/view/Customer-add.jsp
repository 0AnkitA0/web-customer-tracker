<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<!DOCTYPE html>
<html>
<title>
Add Customer
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
 height: 400px;
 width: 300px;
  <!--background-color: red; /* For browsers that do not support gradients */-->
  <!-- /* background-image: linear-gradient(to right, #f6f1d3, #648880 65%, #293f50 ); /* Standard syntax (must be last) */ -->
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;
}
td{ 
      width: 150px; 
      text-align: left ; 
      border: 0px solid black; 
      padding: 0px;
      } 
</style>









</head>
<body>
<div id="grad1">
<table cellpadding="5" cellspacing="5" border="0"><thead>
<form:form action="processForm" modelAttribute="tempCustomer" method="POST"></thead>
		<tr><td></td></tr>
		<tr><td class="td">First Name: <form:input path="firstName" placeholder="First Name"/></td></tr>
		<tr><td class="td">  Last Name: <form:input path="lastName" placeholder="Last Name"/></td></tr>
		<tr><td class="td">  Email: <form:input path="Email" placeholder="Email"/></td></tr>
		<br>
  		<tr><td class="td"><input type = "submit" value="Submit Details"/>   </td></tr>

</form:form>
</table>
</div>
<br><br>
<a href="${pageContext.request.contextPath}/customer/list">Back to List</a>


</body>
</html>