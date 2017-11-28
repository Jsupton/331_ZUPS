<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.Date.*"%>
<%@include file="../Admin/Security.jsp"%>
<jsp:useBean id="item" class= "gabes_ZUPS.GABeS_Item"/> 
<jsp:setProperty name="item" property="*"/>
<%
item.setItemInfo();
%>

<html style="background-color:white"> 
	<head>
		<title>GABeS - Leave Feedback</title>
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
    		padding-top:10px;
			padding-left:10px;
			padding-right:10px;
    		width:300px;
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
				<h1 style="text-align:center"><img src="../Images/GABES.png" style="width:200px;height:50px;padding-top:25px"> Leave Feedback</h1>
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
		<div style="background-color:#eaeaea;width:auto;min-width:1000px;height:auto;min-height:400px;border:solid 2px white">
		<br/>
		<br/>
		<div style="font-size:22px;background-color:#8AC0D1;border:solid 2px white;width:400px;height:40px;margin-left:auto;margin-right:auto;text-align: center;">
			<p style="line-height:0px"><b>Rate Seller</b></p>
		</div>
		<br/>
		<div style="padding:15px;border: solid 2px #000;width:600px;height:auto;margin-left:auto;
					margin-right:auto;text-align: center;background-color:white;box-shadow: 10px 10px 5px #888888">
			<form method="post" action="Rate_Seller_action.jsp" name="rateSeller" >
				<table>
					<tr>
						<td>ItemID</td>
						<td><input name="itemID" value=<%=item.getItemID()%> size="20" readonly>
							<input name="buyerID" value=<%=account.getUserID()%> type="hidden"></td>
					</tr>
					<tr>
						<td>Item Name</td>
						<td><%=item.getItemName()%></td>
					</tr>
					<tr>
						<td>Overall Rating</td>
						<td><select name="rating" required>
								<option value="1">1</option>
  								<option value="2">2</option>
 								<option value="3">3</option>
  								<option value="4">4</option>
  								<option value="5">5</option>
  								<option value="6">6</option>
 								<option value="7">7</option>
  								<option value="8">8</option>
  								<option value="9">9</option>
  								<option value="10">10</option>
						    </select></td>
					</tr>
					<tr>
						<td>Item Quality</td>
						<td><input name="itemQuality" type="radio" value="1">1 
							<input name="itemQuality" type="radio" value="2">2 
							<input name="itemQuality" type="radio" value="3">3 
							<input name="itemQuality" type="radio" value="4">4 
							<input name="itemQuality" type="radio" value="5">5 </td>
					</tr>
					<tr>
						<td>Delivery</td>
						<td><input name="deliveryQuality" type="radio" value="1">1 
							<input name="deliveryQuality" type="radio" value="2">2 
							<input name="deliveryQuality" type="radio" value="3">3 
							<input name="deliveryQuality" type="radio" value="4">4 
							<input name="deliveryQuality" type="radio" value="5">5 </td>
					</tr>
					<tr>
						<td>Comments</td>
						<td><textarea name="comments" required></textarea>
					</tr>
					<tr>
						<td style="padding:15px"><input name="rate" value="Rate" type="submit" class="button" style="padding:0px;height:auto;margin-right:auto;margin-left:auto"></td>
						<td style="padding:15px"><input type="reset" class="button" style="padding:0px;height:auto;margin-right:auto;margin-left:auto"></td>
					</tr>
				</table>
			</form>	
			</div>
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
