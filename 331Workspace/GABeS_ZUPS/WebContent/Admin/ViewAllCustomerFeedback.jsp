<%@ page language="java" import="java.sql.*"%>
<%@include file="/Security.jsp"%>
<%@include file="/Styles/AdminStyle.jsp"%>

<%
ResultSet rs = account.getRatingsSummary();
ResultSet rs2 = account.getTopSellers();
%>

<html style="background-color:white"> 
	<head>
		<title>GABeS Admin - User Management</title>
	</head>
	<style>
		td {
    		padding: 5px;
    		border: 5px solid white;
		}
		table{
			border-collapse: collapse;
			background-color:#f5f5f5;
			width:100%;
		}
		th{
			font-size:17px;
			background-color:#777;
			color:white;
		}
	</style>
	<body>
		<div style="background-color:#97d8c3;width:100%;min-width:1000px;height:190px;border:solid 3px white">
			<div style="background-color:White;width:70%;min-width:650px;height:110px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #777">
				<h1 style="text-align:center"><img src="../Images/GABES.png" style="width:200px;height:50px;padding-top:25px"> View Customer Feedback</h1>
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
			<div style="font-size:22px;background-color:#97d8c3;border:solid 2px white;width:500px;height:40px;margin-left:auto;margin-right:auto;text-align: center;">
				<p style="line-height:0px"><b>Top 5 sellers</b></p>
			</div>
			<br/>
			<div style="padding:10px;border: solid 2px #000;width:700px;height:auto;margin-left:auto;margin-right:auto;text-align: center;background-color:white;box-shadow: 10px 10px 5px #888888">
				<table>
					<tr>
						<th>Seller Username</th>
						<th>Seller Rating</th>
					</tr>
					<% while(rs2.next()){ %>
						<tr>
							<td><%=rs2.getString(1) %></td>
							<td><%=rs2.getInt(2) %></td>
						</tr>
					<%}%>
				</table>
			</div>
			<br/>
			<br/>
			<div style="font-size:22px;background-color:#97d8c3;border:solid 2px white;width:500px;height:40px;margin-left:auto;margin-right:auto;text-align: center;">
				<p style="line-height:0px"><b>Customer Feedback Summary</b></p>
			</div>
			<br/>
			<div style="padding:10px;border: solid 2px #000;width:700px;height:auto;margin-left:auto;margin-right:auto;text-align: center;background-color:white;box-shadow: 10px 10px 5px #888888">
				<table>
					<tr>
						<th>Seller</th>
						<th>Buyer</th>
						<th>Item ID</th>
						<th>Rating</th>
						<th>Comments</th>
					</tr>
					<% while(rs.next()){ %>
						<tr>
							<td><%=rs.getString(1) %></td>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getInt(3) %></td>
							<td><%=String.format("%.2f",rs.getDouble(4))%></td>
							<td><%=rs.getString(5) %></td>
							
						</tr>
					<%}%>
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