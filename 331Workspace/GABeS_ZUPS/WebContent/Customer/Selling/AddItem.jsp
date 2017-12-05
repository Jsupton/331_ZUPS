<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@include file="Security.jsp"%>
<jsp:useBean id="item" class= "gabes_ZUPS.GABeS_Item" /> 

<html style="background-color:white">
	<head>
		<title>Selling Management</title>
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
    		padding: 3px;
    		border: 5px solid white;
		}
		table{
			border-collapse: collapse;
			background-color:#f5f5f5;
			width:100%;
		}
	</style>
	<body>
		<div style="background-color:#8AC0D1;width:100%;min-width:1000px;height:190px;border:solid 3px white">
			<div style="background-color:White;width:70%;min-width:650px;height:110px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #777">
				<h1 style="text-align:center"><img src="../../Images/GABES.png" style="width:200px;height:50px;padding-top:25px"> Add Item</h1>
			</div>
		</div>
		<div style="background-color:#777;min-width:1000px">
			<ul style="width:950px">
  				<li style="line-height:30px"><a class="active" href="../Customer_Welcome.jsp">Home</a></li>
  				<li><a href="../Update_Profile.jsp">Update Profile</a></li>
  				<li><a href="Selling_Management.jsp">Selling Management</a></li>
  				<li><a href="../Bidding/Bidding_Management.jsp">Bidding Management</a></li>
  				<li><a href="../Leave_Feedback.jsp">Leave Feedback</a></li>
  				<li><a href="../View_Feedback.jsp">View My Feedback</a></li>
  				<li><a href="../Account_History.jsp">Account History</a></li>
  				<li style="line-height:30px"><a href="../../Logout_action.jsp">Logout</a></li>
			</ul>
		</div>
		<div style="background-color:#eaeaea;width:100%;min-width:1000px;height:auto;border:solid 2px white;border-top:none">
			<br/>
			<div style="font-size:22px;background-color:#8AC0D1;border:solid 2px white;width:200px;height:40px;margin-left:auto;margin-right:auto;text-align: center;">
				<p style="line-height:0px"><b>Add New Item</b></p>
			</div>
			<br/>
			<form method="post" action="AddItem_action.jsp" name="Login" >
				<div style="padding:10px;border-bottom:0px;border: solid 2px #000;width:675px;height:375px;margin-left:auto;margin-right:auto;text-align: center;background-color:white;box-shadow: 10px 10px 5px #888888">
						<table>
							<tr>
								<td>ItemID</td>
								<td><input name="itemID" value=<%=item.getNextItemID()%> size="20" readonly></td>
							</tr>
							<tr>
								<td>Item Name</td>
								<td><input name="itemName" required></td>
							</tr>
							<tr>
								<td>Category</td>
								<td style="width:400px">
									<input name="categories" size="20" required></td>
							</tr>
							<tr>
								<td>Start Price</td>
								<td><input name="startPrice" type="Number" required></td>
							</tr>
							<tr>
								<td>Auction Starts</td>
								<td><input name="startTime" value=<%=item.getCurrentDate()%> size="20" readonly></td>
							</tr>
							<tr>
								<td>Auction Ends</td>
								<td style="width:100px"><input size="5" name="endDay" required>
									<select name="endMonth" required>
										<option value="0">--Select--</option>
										<option value="JAN">January</option>
										<option value="FEB">February</option>
										<option value="MAR">March</option>
										<option value="APR">April</option>
										<option value="MAY">May</option>
										<option value="JUN">June</option>
										<option value="JUL">July</option>
										<option value="AUG">August</option>
										<option value="SEP">September</option>
										<option value="OCT">October</option>
										<option value="NOV">November</option>
										<option value="DEC">December</option>
									</select>
									<select name="endYear" required>
										<option value="0">--Select--</option>
										<option value="2011">2010</option>
										<option value="2012">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
										<option value="2021">2021</option>
										<option value="2022">2022</option>
									</select></td>
							</tr>
							<tr>
								<td>Description</td>
								<td><textarea rows="4" cols="50" name="description" > </textarea></td>
							</tr>
							<tr>
								<td style="padding:15px"><input name="add" value="Add" type="submit" class="button" style="padding:0px;height:auto;margin-right:auto;margin-left:auto"></td>
								<td style="padding:15px"><input type="reset" class="button" value="Clear" style="padding:0px;height:auto;margin-right:auto;margin-left:auto"></td>
							</tr>
						</table>
				</div>
				<br/>
				<br/>
				<div>
					<hr style="height:2px;background-color:#777;color:#777;border:solid 1px white;margin-left:20px;margin-right:20px"/>
					<p style="font-size:12px;margin-left:20px"> <b>Copyright ©2017 ZUPS. Powered by Upton, Schmidgall, Pekarek, and Zins </b></p>
				</div>
			</div>
		</form>
	</body>
</html>