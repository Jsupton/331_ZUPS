<%@ page language="java" import="java.sql.*"%>
<%@include file="/Security.jsp"%>
<%@include file="/Styles/CustomerStyle.jsp"%>
<jsp:useBean id="Item" class= "gabes_ZUPS.GABeS_Item"/> 
<jsp:useBean id="search" class= "gabes_ZUPS.GABeS_Search" scope="page"/> 
<%
	ResultSet r = Item.getAllCategories();
%>
<html style="background-color:white"> 
	<head>
		<title>GABeS - Search</title>
	</head>
	<style>
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
				<h1 style="text-align:center"><img src="../../Images/GABES.png" style="width:200px;height:50px;padding-top:25px"> Search Items</h1>
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
		<div style="background-color:#eaeaea;width:auto;min-width:1000px;height:auto;border:solid 2px white">
		<br/>
		<br/>
		<div style="font-size:22px;background-color:#8AC0D1;border:solid 2px white;width:175px;height:40px;margin-left:auto;margin-right:auto;text-align: center;">
			<p style="line-height:0px"><b>Item Search</b></p>
		</div>
		<br/>
			<div style="padding:5px;border: solid 2px #000;width:650px;height:340px;margin-left:auto;margin-right:auto;text-align: center;background-color:white;box-shadow: 10px 10px 5px #888888">
				<form method="post" action="SearchResults.jsp" name="Login" >
					<table id="search">
						<tr>
							<td style="width:200px">Item ID</td>
							<td style="width:400px"><input name="itemID" size="20"></td>
						</tr>
						<tr>
							<td style="width:200px">Keyword</td>
							<td style="width:400px"><input name="keyword" ></td>
						</tr>
						<tr>
							<td style="width:200px">Category</td>
							<td style="width:400px">
								<select name="category">
										<option value="0">--Select--</option>
									<%while(r.next()){ %>
										<option value=<%=r.getString(1)%>><%=r.getString(1)%></option>
									<%} %>
								</select>
							</td>
						</tr>
						<tr>
							<td style="width:200px">Current Bid</td>
							<td style="width:400px"><input name="minCurrentBid" style="width:100px"><%=" <= X <= "%><input name="maxCurrentBid" style="width:100px"></td>
						</tr>
						<tr>
							<td style="width:200px" rowspan="2">Auction Time Period</td>
							<td style="width:400px"><input name="startDay"> 
								<select name="startMonth">
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
								<select name="startYear">
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
								</select>
							</td>
						</tr>
						<tr>
							<td style="width:400px"><input name="endDay"> 
								<select name="endMonth">
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
								<select name="endYear">
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
								</select>
							</td>
						</tr>
						<tr>
							<td style="width:200px">Soundex</td>
							<td style="width:400px"><input name="soundex"></td>
						</tr>
						<tr style="padding-bottom:0;">
							<td style="padding:15px;width:200px"><input name="Search" value="Search" type="submit" class="button" style="padding:0px;height:auto;margin-right:auto;margin-left:auto"></td>
							<td style="padding:15px"><input type="reset" class="button" style="padding:0px;height:auto;margin-right:auto;margin-left:auto"></td>
						</tr>
					</table>
				</form>
			</div>
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