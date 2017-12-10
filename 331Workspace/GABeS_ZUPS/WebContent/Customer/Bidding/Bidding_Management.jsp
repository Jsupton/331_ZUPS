<%@ page language="java" import="java.sql.*"%>
<%@include file="../../Security.jsp"%>
<%@include file="../../Styles/CustomerStyle.jsp"%>
<html style="background-color:white">
	<head>
		<title>Bidding Management</title>
	</head>
	<style>
		td{
    		padding: 15px;
    		border: 5px solid white;
		}
		table{
			border-collapse: collapse;
			background-color:#f5f5f5;
		}
	</style>
	<body>
		<div style="background-color:#8AC0D1;width:100%;min-width:1000px;height:190px;border:solid 3px white">
			<div style="background-color:White;width:70%;min-width:650px;height:110px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #777">
				<h1 style="text-align:center"><img src="../../Images/GABES.png" style="width:200px;height:50px;padding-top:25px"> Bidding Homepage</h1>
			</div>
		</div>
		<div style="background-color:#777;min-width:1000px">
			<ul style="width:950px">
  				<li style="line-height:30px"><a class="active" href="../Customer_Welcome.jsp">Home</a></li>
  				<li><a href="../Update_Profile.jsp">Update Profile</a></li>
  				<li><a href="../Selling/Selling_Management.jsp">Selling Management</a></li>
  				<li><a href="Bidding_Management.jsp">Bidding Management</a></li>
  				<li><a href="../Leave_Feedback.jsp">Leave Feedback</a></li>
  				<li><a href="../View_Feedback.jsp">View My Feedback</a></li>
  				<li><a href="../Account_History.jsp">Account History</a></li>
  				<li style="line-height:30px"><a href="../../Logout_action.jsp">Logout</a></li>
			</ul>
		</div>
		<div style="font-size:18px;border-left:solid 2px white;border-right:solid 2px white;background-color:#eaeaea;width:100%;height:inherit;margin-left:auto;margin-right:auto;text-align: center;">
			<% String anyErrors = request.getParameter("Error");%>
		</div>
		<div style="background-color:#eaeaea;width:100%;min-width:1000px;height:auto;min-height:400px;border:solid 2px white;border-top:none">
		<br/>
		<br/>
		<div style="width:950px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #888888">
			<table>
				<tr>
					<td>
						<a href="Search.jsp" class="button" style="height:30px;width:250px;line-height:30px">Search</a>
					</td>
					<td> Enables the to search for specific items in the database. They are able to search by ItemId, Keyword, Category, Current bid range, auction time period, and inexact search on item name (using soundex).   
					</td>
				</tr>
				<tr>
					<td>
						<a href="PopularItems.jsp" class="button" style="height:30px;width:250px;line-height:30px">Popular Items</a>
					</td>
					<td>  Allows the customer to view the top 5 most popular items currently that are still on sale.
					</td>
				</tr>
				<tr>
					<td>
						<a href="Check_Status.jsp" class="button" style="height:30px;width:250px;line-height:30px">Check Status</a>
					</td>
					<td>  Allows the Customer to view all items that are currently on bid.
					</td>
				</tr>
				<tr>
					<td>
						<a href="BiddingHistory.jsp" class="button" style="height:30px;width:250px;line-height:30px">History</a>
					</td>
					<td>  Allows the Customer to view all items that they have bid on in the past.
					</td>
				</tr>
			</table>
			</div>
			<br/>
			<br/>
			<br/>
			<br/>
		</div>
		<div style="margin-top:-50px">
			<hr style="height:2px;background-color:#777;color:#777;border:solid 1px white;margin-left:20px;margin-right:20px"/>
			<p style="font-size:12px;margin-left:20px"> <b>Copyright ©2017 ZUPS. Powered by Upton, Schmidgall, Pekarek, and Zins </b></p>
		</div>
	</body>
</html>