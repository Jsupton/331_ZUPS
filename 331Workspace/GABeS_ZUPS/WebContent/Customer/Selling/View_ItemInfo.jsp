<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="Item" class= "gabes_ZUPS.GABeS_Item"/> 
<jsp:useBean id="account" class= "gabes_ZUPS.GABeS_Account" scope="session"/> 
<jsp:setProperty name="Item" property="*"/>
<%
	ResultSet rs = Item.getItemInfo();
%>

<html style="background-color:white"> 
	<head>
		<title>GABeS Customer - Update Profile</title>
	</head>
	<style>
		.button {
    		background-color: #95C6C3;
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
    		border: 3px solid #95C6C3;
    		color: white;
    	}
    	
    	.button2 {
    		background-color: #eeeeee;
    		border: 2px solid #dddddd;
    		color: #aaaaaa;
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
    		width:125px;
    		height:60px;
		}

		li a {
    		display: block;
    		color: white;
    		font-weight:bold;
    		text-align: center;
    		padding: 14px 16px;
    		text-decoration: none;
    		font-size: 14px;
		}

		li a:hover {
    		background-color: #95C6C3;
    		color: white;
    		font-weight:bold;
		}
		
		td {
    		padding: 5;
    		width:300px;
    		border: 5px solid white;
		}
		table{
			border-collapse: collapse;
			background-color:#f5f5f5;
		}
	</style>
	<body>
		<div style="background-color:#95C6C3;width:100%;min-width:1000px;height:190px;border:solid 3px white">
			<div style="background-color:White;width:70%;min-width:650px;height:110px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #777">
				<h1 style="text-align:center"><img src="../../Images/GABES.png" style="width:200px;height:50px;padding-top:25px"> Item Information</h1>
			</div>
		</div>
		<div style="background-color:#777">
			<ul style="width:900px">
  				<li style="line-height:30px"><a class="active" href="../../Customer_Welcome.jsp">Home</a></li>
  				<li><a href="../Update_Profile.jsp">Update Profile</a></li>
  				<li><a href="../Selling/Selling_Management.jsp">Selling Management</a></li>
  				<li><a href="../Bidding/Bidding_Management.jsp">Bidding Management</a></li>
  				<li><a href="../Leave_Feedback.jsp">Leave Feedback</a></li>
  				<li><a href="../View_Feedback.jsp">View My Feedback</a></li>
  				<li style="line-height:30px"><a href="../../Logout_action.jsp">Logout</a></li>
			</ul>
		</div>
		<div style="background-color:#eaeaea;width:100%;height:auto;border:solid 2px white">
		<br/>
		<br/>
		<div style="font-size:22px;background-color:#95C6C3;border:solid 2px white;width:175px;height:40px;margin-left:auto;margin-right:auto;text-align: center;">
			<p style="line-height:0px"><b>Item Info</b></p>
		</div>
		<br/>
		<%while(rs.next()){ %>
			<div style="padding-top:15px;padding-left:15px;padding-right:15px;border: solid 2px #000;width:475px;height:auto;margin-left:auto;margin-right:auto;text-align: center;background-color:white;box-shadow: 10px 10px 5px #888888">
				<table>
					<tr>
						<td style="width:80px"><b>Item ID</b></td>
						<td><%=rs.getInt(1)%></td>
					</tr>
					<tr>
						<td style="width:80px"><b>Item Name</b></td>
						<td><%=rs.getString(2)%></td>
					</tr>
					<tr>
						<td style="width:80px"><b>Category</b></td>
						<td><%=rs.getString(3)%></td>
					</tr>
					<tr>
						<td style="width:80px"><b>Start Price</b></td>
						<td><%=rs.getFloat(4)%></td>
					</tr>
					<tr>
						<td style="width:80px"><b>Auction Starts</b></td>
						<td><%=Item.getDate(rs.getTimestamp(5))%></td>
					</tr>
					<tr>
						<td style="width:80px"><b>Auction Ends</b></td>
						<td><%=Item.getDate(rs.getTimestamp(6))%></td>
					</tr>
					<tr>
						<td style="width:80px"><b>Description</b></td> 
						<td><%=rs.getString(7)%></td>
					</tr> 
					<tr>
						<form method="post" action="ViewItemsSelling.jsp" name="cancel" >								
							<td style="padding:15px"><input type="submit" value="Back" class="button" style="padding:0px;height:auto;margin-right:auto;margin-left:auto"></td>
						</form>
						<td></td>
					</tr>
				</table>
			</div>
			<%} %>
			<br/>
			<br/>
			<br/>
			<br/>
			<div >
				<hr style="height:2px;background-color:#777;color:#777;border:solid 1px white;margin-left:20px;margin-right:20px"/>
				<p style="font-size:12px;margin-left:20px"> <b>Copyright ©2017 ZUPS. Powered by Upton, Schmidgall, Pekarek, and Zins </b></p>
				<br/>
				<br/>
			</div>
		</div>
	</body>
</html>