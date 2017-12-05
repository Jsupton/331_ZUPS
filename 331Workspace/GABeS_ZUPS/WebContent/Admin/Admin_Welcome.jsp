<%@ page language="java" import="java.sql.*"%>
<%@include file="Security.jsp"%>

<html style="background-color:white">
	<head>
		<title>ADMIN WELCOME</title>
	</head>
	<style>
		.button {
    		background-color: #97d8c3;
    		border: 2px solid #777;
    		color: White;
    		font-weight:bold;
    		padding: 15px 32px;
    		text-align: center;
    		text-decoration: none;
    		display: inline-block;
    		font-size: 18px;
    		cursor: pointer;
    		width:200px;
    		height:75%;
    		}
    		
    	.button:hover {
    		box-shadow: 10px 10px 5px #888888;
    		background-color: #777;
    		border: 3px solid #97d8c3;
    		color: white;
    	}
    	
		ul {
   			list-style-type: none;
    		margin: auto;
    		padding: 0;
    		overflow: hidden;
    		width:850px;
		}

		li {
    		float: left;
    		display:inline;
    		border: 1px solid #ddd;
		}

		li a {
    		display: block;
    		color: white;
    		font-weight:bold;
    		text-align: center;
    		padding: 14px 16px;
    		text-decoration: none;
		}

		li a:hover {
    		background-color: #97d8c3;
    		color: white;
    		font-weight:bold;
		}
		
		td {
    		padding: 15px;
    		border: 5px solid white;
		}
		table{
			border-collapse: collapse;
			background-color:#f5f5f5;
		}
	</style>
	<body>
		<div style="background-color:#97d8c3;width:100%;height:190px;border:solid 3px white">
			<div style="background-color:White;width:70%;height:110px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #888888">
				<h1 style="text-align:center"><img src="../Images/GABES.png" style="width:200px;height:40px;padding-top:10px"> ADMIN Homepage</h1>
				<p style="text-align:center;font-size:20px"> Welcome <%=account.getUserName()%>
			</div>
		</div>
		<div style="background-color:#777">
			<ul>
  				<li><a class="active" href="Admin_Welcome.jsp">Home</a></li>
  				<li><a href="User_Management.jsp">User Management</a></li>
  				<li><a href="View_Reports.jsp">View Reports</a></li>
  				<li><a href="ViewAllCustomerFeedback.jsp">View Customer Feedback</a></li>
  				<li><a href="../Logout_action.jsp">Logout</a></li>
			</ul>
		</div>
		<div style="background-color:#eaeaea;width:100%;height:auto;border:solid 2px white">
		<br/>
			<div style="width:950px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #888888">
				<table>
					<tr>
						<td >
							<a href="User_Management.jsp" class="button" style="height:50px;width:225px;line-height:50px"> USER MANAGEMENT</a>
						</td>
						<td> Enables administrators to list current customers. <br/>
						 	It also allows the administrators to add new customers.
						</td>
					</tr>
					<tr>
						<td>
							<a href="View_Reports.jsp" class="button" style="line-height:50px;width:225px">VIEW REPORTS</a>
						</td>
						<td > Allows the administrator to view monthly commission income.
							<br/><b>Sales Summary Report:</b>
						 	<p style="margin-top:0px;margin-bottom:0px;margin-left:40px">lists sales summary information for each item, grouped by item category.</p><b>Overall Commission Report:</b>
						 	<p style="margin-top:0px;margin-bottom:0px;margin-left:40px">lists all sellers who have sold items along with their total commission fees paid.</p>
						</td>
					</tr>
					<tr>
						<td>
							<a href="ViewAllCustomerFeedback.jsp" class="button" style="line-height:50px;width:225px">VIEW REPORTS</a>
						</td>
						<td > Allows the administrator to view all of the customer feedback, Ordered by customer.
							<br/><b>Sales Summary Report:</b>
						 	<p style="margin-top:0px;margin-bottom:0px;margin-left:40px">This allows the user to view all the feedback responses that buyers have given sellers and see which of their sellers
						 	aren't doing so great</p>
						</td>
					</tr>
				</table>
			</div>
			<br/>
			<br/>
			<br/>
			<br/>
			<div >
				<hr style="height:2px;background-color:#777;color:#777;border:solid 1px white;margin-left:20px;margin-right:20px"/>
				<p style="font-size:12px;margin-left:20px"> <b>Copyright ©2017 ZUPS. Powered by Upton, Schmidgall, Pekarek, and Zins </b></p>
			</div>
		</div>
	</body>
</html>