<%@ page language="java" import="java.sql.*"%>
<%@include file="/Security.jsp"%>
<%@include file="/Styles/CustomerStyle.jsp"%>
<jsp:useBean id="customer" class= "jupton.gabes_ZUPS.GABeS_Customer"/> 
<jsp:useBean id="item" class= "jupton.gabes_ZUPS.GABeS_Item"/> 

<%
	customer.setUserID(account.getUserID());
	customer.setCustomerInfo(); 
%>

<html style="background-color:white">
	<head>
		<title>CUSTOMER WELCOME</title>
	</head>
	<style>
		td {
    		padding: 15px;
    		border: 5px solid white;
		}
		table{
			border-collapse: collapse;
			background-color:#f5f5f5;
		}
		.alert {
		    padding: 20px;
		    background-color: #CF0000;
		    color: white;
		    font-size:17px;
		    font-weight:bold;
		    text-align:center;
		    opacity: 0.8;
		    border-bottom: 2px solid white;
		}
		.closebtn {
		    margin-left: 15px;
		    color: white;
		    font-weight: bold;
		    float: right;
		    font-size: 22px;
		    line-height: 20px;
		    cursor: pointer;
		    transition: 0.3s;
		}
		.closebtn:hover {
		    color: black;
		}
	</style>
	<body >
		<div style="background-color:#8AC0D1;width:100%;min-width:1000px;height:190px;border:solid 3px white">
			<div style="background-color:White;width:70%;min-width:650px;height:110px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #777">
				<h1 style="text-align:center"><img src="../Images/GABES.png" onload="myFunction()" style="width:200px;height:50px;"> CUSTOMER Homepage</h1>
				<p style="text-align:center;font-size:20px"> Welcome <%=account.getUserName()%>
			</div>
		</div>
		<%String alert = item.itemsNotWinning(account.getUserID(), account.getUserName());
		if(!alert.equals("") && !account.hasBeenAlerted()){%>
			<div class="alert">
	  			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
	  			<strong>Warning --- </strong> You are no longer the winner of <%=alert%>
			</div>
		<%account.setAlerted();
		}%>
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
		<div style="font-size:18px;border-left:solid 2px white;border-right:solid 2px white;background-color:#eaeaea;width:100%;height:inherit;margin-left:auto;margin-right:auto;text-align: center;">
			<% String anyErrors = request.getParameter("Error");
			   if(anyErrors!=null && anyErrors.equals("0")){
            		%><br/><span style="text-align:center; color:green"><b>Profile Update SUCCESSFULLY</b></span><%
       		    }
        	   else if(anyErrors!=null && anyErrors.equals("1")){
        		   %><br/><span style="text-align:center; color:red"><b>An Error Occurred - UNSUCCESSFUL update</b></span><%
        	   }%>
		</div>
		<div style="background-color:#eaeaea;width:100%;min-width:1000px;height:auto;border:solid 2px white;border-top:none">
		<br/>
		<div style="width:950px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #888888">
			<table>
				<tr>
					<td>
						<a href="Update_Profile.jsp" class="button" style="height:30px;width:250px;line-height:30px">Update Profile</a>
					</td>
					<td> Enables the Customer to update their profile. The Customer can update their Username, First Name, Last Name, Password, Email and Phone number.   
					</td>
				</tr>
				<tr>
					<td>
						<a href="Selling/Selling_Management.jsp" class="button" style="height:30px;width:250px;line-height:30px">Selling Management</a>
					</td>
					<td>  Allows the Customer to view all items they have for sale and add new items to sell.
					</td>
				</tr>
				<tr>
					<td>
						<a href="Bidding/Bidding_Management.jsp" class="button" style="height:30px;width:250px;line-height:30px">Bidding Management</a>
					</td>
					<td> Allows the Customer to search for items, show detailed item information, and bid on items. 
					</td>
				</tr>
				<tr>
					<td>
						<a href="Leave_Feedback.jsp" class="button" style="height:30px;width:250px;line-height:30px">Leave Feedback</a>
					</td>
					<td>  Enables the Customer to leave Feedback on items that they have bought. Note, a buyer can rate a seller of an item only once.
					</td>
				</tr>
				<tr>
					<td>
						<a href="View_Feedback.jsp" class="button" style="height:30px;width:250px;line-height:30px">View My Feedback</a>
					</td>
					<td>  Allows the Customer to view all feedback that they have received
					</td>
				</tr>
				<tr>
					<td>
						<a href="Account_History.jsp" class="button" style="height:30px;width:250px;line-height:30px">Bidding History</a>
					</td>
					<td>  Allows the Customer view previous items bought, and view current items. It allows the user to see how many total items they have bought,
							how many items the user is currently bidding on, how many items the user is currently winning, and the amount.
					</td>
				</tr>
			</table>
			</div>
			<br/>
			<br/>
			<div >
				<hr style="height:2px;background-color:#777;color:#777;border:solid 1px white;margin-left:20px;margin-right:20px"/>
				<p style="font-size:12px;margin-left:20px"> <b>Copyright ©2017 ZUPS. Powered by Upton, Schmidgall, Pekarek, and Zins </b></p>
			</div>
		</div>
	</body>
</html>