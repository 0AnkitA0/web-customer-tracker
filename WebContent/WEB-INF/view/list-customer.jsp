<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
		<!-- Adding Bootstrap cdn files  -->
		








	<title>List Customers</title>
	
	<!-- reference our style sheet -->

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/main2.css" />
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>	  

</head>

<body>

<section>

  <!--for demo wrap-->
  <h1 align="center">Customer Relation Manager</h1>
  
  
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Email</th>
          <th>Action</th>
          
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
        <c:forEach var="tempCustomer" items="${customers}">
        
                 <!-- Construct a link with custId in it -->
				<c:url var="updateLink" value="/customer/showUpdateForm">
				<c:param name="customerId" value="${tempCustomer.id}" />
				</c:url>
				<c:url var="deleteLink" value="/customer/delete">
				<c:param name="customerId" value="${tempCustomer.id}" />
				</c:url>
					
					<tr>
						<td> ${tempCustomer.firstName} </td>
						<td> ${tempCustomer.lastName} </td>
						<td> ${tempCustomer.email} </td>
						<!-- Display a button that holds that link variable -->
						<!-- <form action="${updateLink}"><input type="Button" value="Update" /> </form>-->
						<td><form method ="GET"  onsubmit="geek()">
						<button onclick="location.href='${updateLink}'" type="button">Update</button> |
						<button onclick="location.href='${deleteLink}'" type="submit">Delete</button></form></td>
						
					</tr>
					<!-- Using Script to assign action of Confirm on button --> 
					<!-- Another approach by using link only ( <a href="${deleteLink} onclick = if(!(confirm(Are you sure to delete?))) return false">Delete</a> ) -->
						
			</c:forEach>	
			<script> 
        			function geek(){ 
           					 var doc; 
           					 var result = confirm("Are you sure you want to delete this Customer?"); 
          					  if (result == true) { 
          						window.location.href='${updateLink}';
           					 }
    
        				} 
   					 </script>
      </tbody>
    </table>
  </div>
  <form action="search" method="GET">
	<input type="text" name="name" placeholder="Enter First Name to Search By." style="float: left;" />
    <input type="submit" value="Search" style="float: left;" />
</form>
  <form action="showFormAdd">
    <input type="submit" value="Add Customer" style="float: right;" />
</form>
</section>


</body>

</html>