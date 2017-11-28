<%@ page language="java" import="java.sql.*"%>
<%@include file="../Admin/Security.jsp"%>
<jsp:useBean id="Bid" class= "gabes_ZUPS.GABeS_Bids"/>
<%
	
%> 

<html style="background-color:white"> 
	<head>
		<title>GABeS Customer - Bidding History</title>
	</head>
	<style>
		.button {
    		background-color: #8AC0D1;
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
    		border: 3px solid #8AC0D1;
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
    		width:115px;
    		height:60px;
		}

		li a {
    		display: block;
    		color: white;
    		font-weight:bold;
    		text-align: center;
    		padding: 14px 16px;
    		text-decoration: none;
    		font-size: 12px;
		}

		li a:hover {
    		background-color: #8AC0D1;
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
	<script>
		//Used to go to the previous page in the system
		function goBack() {
    		window.history.back();
		}
	</script>
	<body>
		<div style="background-color:#8AC0D1;width:100%;min-width:1000px;height:190px;border:solid 3px white">
			<div style="background-color:White;width:70%;min-width:650px;height:110px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #777">
				<h1 style="text-align:center"><img src="../Images/GABES.png" style="width:200px;height:50px;padding-top:25px"> Bidding History</h1>
			</div>
		</div>
		<div style="background-color:#777;min-width:1000px">
			<ul style="width:950px">
  				<li style="line-height:30px"><a class="active" href="Customer_Welcome.jsp">Home</a></li>
  				<li><a href="Update_Profile.jsp">Update Profile</a></li>
  				<li><a href="Selling/Selling_Management.jsp">Selling Management</a></li>
  				<li><a href="Bidding/Bidding_Management.jsp">Bidding Management</a></li>
  				<li><a href="Leave_Feedback.jsp">Leave Feedback</a></li>
  				<li><a href="View_Feedback.jsp">View My Feedback</a></li>
  				<li><a href="Account_History.jsp">Account History</a></li>
  				<li style="line-height:30px"><a href="../Logout_action.jsp">Logout</a></li>
			</ul>
		</div>
		<div style="background-color:#eaeaea;width:100%;min-width:1000px;height:auto;border:solid 2px white">
		<br/>
		<br/>
		<div style="font-size:22px;background-color:#8AC0D1;border:solid 2px white;width:300px;height:40px;margin-left:auto;margin-right:auto;text-align: center;">
			<p style="line-height:0px"><b>Account History</b></p>
		</div>
		<br/>
			<div style="padding:15px;border: solid 2px #000;width:475px;height:auto;margin-left:auto;margin-right:auto;text-align: center;background-color:white;box-shadow: 10px 10px 5px #888888">
				<table>
					<tr>
						<td><b>Username</b></td>
						<td colspan="2"><input name="userName" value=<%=account.getUserName()%> size="20" readonly>
						 <input name="userID" value=<%=account.getUserID()%> size="20" type="hidden"></td>
					</tr>
					<tr>
						<td colspan="3" style="text-align:center"><b>BIDDING MANAGEMENT</b></td>
					</tr>
					<tr>
						<td><b>Current Winning Bids</b></td>
						<td><%=account.getCurrentNumBidsWinning()%></td>
						<td><b><i>TOTAL:</i></b> <%=account.getCurrentTotalBids()%></td>
					</tr>
					<tr>
						<td><b>Number of items Bought</b></td>
						<td><%=account.getNumItemsBought() %></td>
						<td><b><i>TOTAL:</i></b> <%=account.getAmountItemsBought()%></td>
					</tr>
					<tr>
						<td colspan="3" style="text-align:center"><b>SELLING MANAGEMENT</b></td>
					</tr>
					<tr>
						<td><b><h>Current Items On Auction</h></b></td>
						<td><%=account.getNumItemsSelling()%></td>
						<td><b><i>TOTAL:</i></b> <%=account.getAmountItemsSelling() %></td>
					</tr>
					<tr>
						<td><b>Current Items Sold</b></td>
						<td><%=account.getNumItemsSold() %></td>
						<td><b><i>TOTAL:</i></b> <%=account.getAmountItemsSold() %></td>
					</tr>
					<tr>
						<form method="post" action="Customer_Welcome.jsp" name="cancel" >								
							<td style="padding:15px" colspan="3"><input type="submit" value="Back" class="button" style="padding:0px;width:200px;height:auto;margin-right:auto;margin-left:110px"></td>
						</form>
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
