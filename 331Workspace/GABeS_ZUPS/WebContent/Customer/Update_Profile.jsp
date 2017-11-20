<%@ page language="java" import="java.sql.*"%>
<%@include file="../Admin/Security.jsp"%>
<jsp:useBean id="customer" class= "gabes_ZUPS.GABeS_Customer"/>
<%
	customer.setUserID(account.getUserID());
	customer.setCustomerInfo(); 
%>

<html style="background-color:white"> 
	<head>
		<title>GABeS Customer - Update Profile</title>
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
	<body>
		<div style="background-color:#8AC0D1;width:100%;min-width:1000px;height:190px;border:solid 3px white">
			<div style="background-color:White;width:70%;min-width:650px;height:110px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #777">
				<h1 style="text-align:center"><img src="../Images/GABES.png" style="width:200px;height:50px;padding-top:25px"> Update Profile</h1>
			</div>
		</div>
		<div style="background-color:#777">
			<ul style="width:900px">
  				<li style="line-height:30px"><a class="active" href="Customer_Welcome.jsp">Home</a></li>
  				<li><a href="Update_Profile.jsp">Update Profile</a></li>
  				<li><a href="Selling/Selling_Management.jsp">Selling Management</a></li>
  				<li><a href="Bidding/Bidding_Management.jsp">Bidding Management</a></li>
  				<li><a href="Leave_Feedback.jsp">Leave Feedback</a></li>
  				<li><a href="View_Feedback.jsp">View My Feedback</a></li>
  				<li style="line-height:30px"><a href="../Logout_action.jsp">Logout</a></li>
			</ul>
		</div>
		<div style="background-color:#eaeaea;width:100%;height:auto;border:solid 2px white">
		<br/>
		<br/>
		<div style="font-size:22px;background-color:#8AC0D1;border:solid 2px white;width:175px;height:40px;margin-left:auto;margin-right:auto;text-align: center;">
			<p style="line-height:0px"><b>User Profile</b></p>
		</div>
		<br/>
			<div style="padding:15px;padding-bottom:0px;border: solid 2px #000;width:475px;height:auto;margin-left:auto;margin-right:auto;text-align: center;background-color:white;box-shadow: 10px 10px 5px #888888">
				<form method="post" action="Update_Profile_action.jsp" name="Login" >
					<table>
						<tr>
							<td>Username</td>
							<td><input name="userName" value=<%=account.getUserName()%> size="20">
							 <input name="userID" value=<%=account.getUserID()%> size="20" type="hidden"></td>
						</tr>
						<tr>
							<td>First Name</td>
							<td><input name="fName" value=<%=customer.getfName()%>></td>
						</tr>
						<tr>
							<td>Last Name</td>
							<td><input name="lName" value=<%=customer.getlName()%>></td>
						</tr>
						<tr>
							<td>Email</td>
							<td><input name="email" value=<%=customer.getEmail()%>></td>
						</tr>
						<tr>
							<td>Phone</td>
							<td><input name="phone" value=<%=customer.getPhone()%>></td>
						</tr>
						<tr>
							<td>Seller Rating</td>
							<td><input name="SellerRating" value=<%=String.format("%.4f",customer.getSellerRating())%> size="20" readonly></td>
						</tr>
						<tr>
							<td>Number Of Seller Ratings</td>
							<td><input name="NoSellerRating" value=<%=customer.getNumSellerRating() %> size="20" readonly></td>
						</tr> 
						<tr>
							<td>Old Password</td>
							<td><input name="password" value=<%=account.getPassword()%> size="20"></td>
						</tr>
						<tr>
							<td>New Password</td>
							<td><input name="newPassword" value="" size="20"></td>
						</tr>
						<tr>
							<td>Retype Password</td>
							<td><input name="retypePassword" value="" size="20"></td>
						</tr>
						<tr>
							<td style="padding:15px"><input name="edit" value="Save Changes" type="submit" class="button" style="padding:0px;height:auto;margin-right:auto;margin-left:auto"></td>
							<td style="padding:15px"><input type="reset" class="button" style="padding:0px;height:auto;margin-right:auto;margin-left:auto"></td>
						</tr>
					</table>
				</form>
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