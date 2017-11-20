<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="account" class= "gabes_ZUPS.GABeS_Account" scope="session"/> 

<%
ResultSet rs1 = account.getSalesSummary(); 
ResultSet rs2 = account.getCommissionReport();
float subtotal = 0;
float total = 0;
String category = "";
%>

<html style="background-color:white"> 
	<head>
		<title>GABeS Admin - User Management</title>
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
    		width:550px;
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
    		padding: 5px;
    		border: 5px solid white;
		}
		table{
			border-collapse: collapse;
			background-color:#f5f5f5;
			width:100%;
		}
		th{
			background-color:#777;
			color:white;
		}
	</style>
	<body>
		<div style="background-color:#97d8c3;width:100%;min-width:1000px;height:190px;border:solid 3px white">
			<div style="background-color:White;width:70%;min-width:650px;height:110px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #777">
				<h1 style="text-align:center"><img src="../Images/GABES.png" style="width:200px;height:50px;padding-top:25px"> View Reports</h1>
			</div>
		</div>
		<div style="background-color:#777">
			<ul>
  				<li><a class="active" href="Admin_Welcome.jsp">Home</a></li>
  				<li><a href="User_Management.jsp">User Management</a></li>
  				<li><a href="View_Reports.jsp">View Reports</a></li>
  				<li><a href="../Logout_action.jsp">Logout</a></li>
			</ul>
		</div>
		<div style="background-color:#eaeaea;width:100%;height:auto;border:solid 2px white">
			<br/>
			<div style="font-size:22px;background-color:#97d8c3;border:solid 2px white;width:300px;height:40px;margin-left:auto;margin-right:auto;text-align: center;">
				<p style="line-height:0px"><b>Sales Summary Report</b></p>
			</div>
			<br/>
			<div style="padding:10px;border: solid 2px #000;width:820px;height:auto;margin-left:auto;margin-right:auto;text-align: center;background-color:white;box-shadow: 10px 10px 5px #888888">
				<table>
					<tr>
						<th>Category</th>
						<th>Item ID</th>
						<th>Item Name</th>
						<th>Final Selling Price</th>
						<th>Commission</th>
					</tr>
					<%while(rs1.next()){
						if(!rs1.getString(1).equals(category)){
							if(!category.equals("")){%>
								<tr>
									<td></td>
									<td><b>Subtotal</b></td>
									<td>--------</td>
									<td>--------</td>
									<td><b><%=subtotal%></b></td>
								</tr>
								<tr style="height:20px;"></tr>
							<%
								total = total + subtotal;
								subtotal = 0;
							} 
							category = rs1.getString(1);
							subtotal = subtotal + rs1.getFloat(5);
							%>
							<tr>
								<td><%=category%></td>
								<td><%=rs1.getInt(2) %></td>
								<td><%=rs1.getString(3) %></td>
								<td><%=rs1.getFloat(4) %></td>
								<td><%=rs1.getFloat(5) %></td>
							</tr>
						<%} 
						else{
							subtotal = subtotal + rs1.getFloat(5);
							%>
							<tr>
								<td></td>
								<td><%=rs1.getInt(2) %></td>
								<td><%=rs1.getString(3) %></td>
								<td><%=rs1.getFloat(4) %></td>
								<td><%=rs1.getFloat(5) %></td>
							</tr>
						<%}
					} 
					total = total + subtotal;%>
					<tr>
						<td></td>
						<td><b>SUBTOTAL</b></td>
						<td>--------</td>
						<td>--------</td>
						<td><b><%= String.format("%.2f",subtotal)%></b></td>
					</tr>
					<tr style="height:20px;"></tr>
					<tr>
						<td></td>
						<td><b>TOTAL</b></td>
						<td>--------</td>
						<td>--------</td>
						<td><b><%=String.format("%.2f",total)%></b></td>
					</tr>
				</table>
			</div>
			<br/>
			<br/>
			<hr style="height:5px;background-color:#777;color:#777;border:solid 1px white;margin-left:20px;margin-right:20px"/>
			<br/>
			<div style="font-size:22px;background-color:#97d8c3;border:solid 2px white;width:375px;height:40px;margin-left:auto;margin-right:auto;text-align: center;">
				<p style="line-height:0px"><b>Overall Commission Report</b></p>
			</div>
			<br/>
			<div style="padding:10px;border: solid 2px #000;width:900px;height:auto;margin-left:auto;margin-right:auto;text-align: center;background-color:white;box-shadow: 10px 10px 5px #888888">
				<table>
					<tr>
						<th>UserID</th>
						<th>User Name</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Seller Rating</th>
						<th>Commission</th>
					</tr>
					<% total = 0;
					while(rs2.next()){
						total = total + rs2.getFloat(7);%>
						<tr>
							<td><%=rs2.getInt(1) %></td>
							<td><%=rs2.getString(2) %></td>
							<td><%=rs2.getString(3) %></td>
							<td><%=rs2.getString(4) %></td>
							<td><%=rs2.getString(5) %></td>
							<td><%=rs2.getDouble(6) %></td>
							<td><%=rs2.getFloat(7) %></td>
						</tr>
					<%}%>
					<tr style="height:20px;"></tr>
					<tr>
						<td></td>
						<td><b>TOTAL</b></td>
						<td>--------</td>
						<td>--------</td>
						<td>--------</td>
						<td>--------</td>
						<td><b><%=String.format("%.2f",total)%></b></td>
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