<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.Date.*"%>
<%@include file="/Security.jsp"%>
<%@include file="/Styles/CustomerStyle.jsp"%>
<jsp:useBean id="item" class= "jsupton.gabes_ZUPS.GABeS_Item"/>  
<jsp:setProperty name="item" property="*"/>

<%
ResultSet rs = item.getItemsSelling(account.getUserID()); 
%>

<html style="background-color:white"> 
	<head>
		<title>GABeS - View Items</title>
	</head>
	<style>
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
		th{
			font-size:17px;
			background-color:#777;
			color:white;
		}
	</style>
	<body>
		<div style="background-color:#8AC0D1;width:100%;min-width:1000px;height:190px;border:solid 3px white">
			<div style="background-color:White;width:70%;min-width:650px;height:110px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #777">
				<h1 style="text-align:center"><img src="../../Images/GABES.png" style="width:200px;height:50px;padding-top:25px"> View Items Selling</h1>
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
		<div style="font-size:18px;border-left:solid 2px white;border-right:solid 2px white;background-color:#eaeaea;width:100%;height:inherit;margin-left:auto;margin-right:auto;text-align: center;">
			<% String anyErrors = request.getParameter("Error");
			   if(anyErrors!=null && anyErrors.equals("0")){
            		%><br/><span style="text-align:center; color:green"><b>Item Added SUCCESSFULLY</b></span><%
       		    }
        	   else if(anyErrors!=null && anyErrors.equals("1")){
        		   %><br/><span style="text-align:center; color:red"><b>An Error Occurred - UNSUCCESSFUL Item addition</b></span><%
        	   }%>
		</div>
		<div style="background-color:#eaeaea;width:auto;min-width:1000px;height:auto;border:solid 2px white">
		<br/>
		<br/>
		<%if(rs!=null && rs.next()) {%>
			<div style="font-size:22px;background-color:#8AC0D1;border:solid 2px white;width:175px;height:40px;margin-left:auto;margin-right:auto;text-align: center;">
				<p style="line-height:0px"><b>View Items</b></p>
			</div>
			<br/>
				<div style="padding:15px;border: solid 2px #000;width:1000px;height:auto;margin-left:auto;
							margin-right:auto;text-align: center;background-color:white;box-shadow: 10px 10px 5px #888888">
						<table>
						<tr>
							<th>Item ID</th>
							<th>Item Name</th>
							<th>Category</th>
							<th>Auction Start Time</th>
							<th>Auction End Time</th>
							<th>Start Price</th>
							<th>Current Bid</th>
							<th>Status</th>
							<th>Item-Info</th>
							<th>Bidder-List</th>
						</tr>
					<%do{%>
						<tr>
							<td><%=rs.getInt(1)%></td>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(3) %></td>
							<td><%=item.getDate(rs.getTimestamp(4)) %></td>
							<td><%=item.getDate(rs.getTimestamp(5)) %></td>
							<td><%=rs.getInt(6) %></td>
							<td><%=rs.getInt(7) %></td>
							<td><%=rs.getString(8) %></td>
							<form method="post" action="View_ItemInfo.jsp" name="ItemInfo">
								<td><input name="Item-Info" value="Item-Info" type="submit" style="width:auto;height:auto;margin-right:auto;margin-left:auto">
									<input type="hidden" name="itemID" value=<%=rs.getInt(1)%>></td>
							</form>
							<%if(rs.getInt(7)!= rs.getInt(6)) {%>
								<form method="post" action="Bidder_List.jsp" name="Bidding">
									<td><input name="BidList" value="Bidder-List" type="submit" style="width:auto;height:auto;margin-right:auto;margin-left:auto">
										<input type="hidden" name="itemID" value=<%=rs.getInt(1)%>></td>
								</form>
							<%}else{ %>
							<td style="text-align:center">----</td>
							<%} %>
						</tr>
					<%}while(rs.next()); %>
					</table>
				</div>
			<%}else{
			%>
				<div style="font-size:18px;background-color:#eee;border:solid 2px white;width:900px;height:auto;margin-left:auto;margin-right:auto;text-align: center;">
					<p style="color:#F88017"><b>YOU ARE CURRENTLY SELLING NO PRODUCTS</b></p>
				</div>
				<br/>
			<%} %>
			<br/>
			<br/>
			<br/>
			<div >
				<hr style="height:2px;background-color:#777;color:#777;border:solid 1px white;margin-left:20px;margin-right:20px"/>
				<p style="font-size:12px;margin-left:20px"> <b>Copyright �2017 ZUPS. Powered by Upton, Schmidgall, Pekarek, and Zins </b></p>
			</div>
		</div>
	</body>
</html>