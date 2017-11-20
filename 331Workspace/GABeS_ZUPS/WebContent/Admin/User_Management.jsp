<%@ page language="java" import="java.sql.*"%>
<%@include file="Security.jsp"%>

<%ResultSet rs = account.getCustomerList(); %>

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
	</style>
	<body>
		<div style="background-color:#97d8c3;width:100%;min-width:1000px;height:190px;border:solid 3px white">
			<div style="background-color:White;width:70%;min-width:650px;height:110px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #777">
				<h1 style="text-align:center"><img src="../Images/GABES.png" style="width:200px;height:50px;padding-top:25px"> Update Profile</h1>
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
		<div style="font-size:18px;border-left:solid 2px white;border-right:solid 2px white;background-color:#eaeaea;width:100%;height:inherit;margin-left:auto;margin-right:auto;text-align: center;">
			<% String anyErrors = request.getParameter("Error");
			   if(anyErrors!=null && anyErrors.equals("0")){
            		%><br/><span style="text-align:center; color:green"><b>User Created SUCCESSFULLY</b></span><%
       		    }
        	   else if(anyErrors!=null && anyErrors.equals("1")){
        		   %><br/><span style="text-align:center; color:red"><b>An Error Occurred - UNSUCCESSFUL addition</b></span><%
        	   }
        	   else if(anyErrors!=null && anyErrors.equals("2")){
        		   %><br/><span style="text-align:center; color:red"><b>Passwords did not match - UNSUCCESSFUL addition</b></span><%
        	   }%>
		</div>
		<div style="background-color:#eaeaea;width:100%;height:auto;border:solid 2px white;border-top:none">
			<br/>
			<div style="font-size:22px;background-color:#97d8c3;border:solid 2px white;width:175px;height:40px;margin-left:auto;margin-right:auto;text-align: center;">
				<p style="line-height:0px"><b>User List</b></p>
			</div>
			<br/>
			<div style="padding:10px;border: solid 2px #000;width:820px;height:auto;margin-left:auto;margin-right:auto;text-align: center;background-color:white;box-shadow: 10px 10px 5px #888888">
				<table>
					<tr>
						<th>User ID</th>
						<th>Username</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Password</th>
					</tr>
				<%while(rs.next()){%>
					<tr>
						<td><%=rs.getInt(1)%></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getString(6) %></td>
					</tr>
				<%} %>
				</table>
			</div>
			<br/>
			<hr style="height:5px;background-color:#777;color:#777;border:solid 1px white;margin-left:20px;margin-right:20px"/>
			<br/>
			<div style="font-size:22px;background-color:#97d8c3;border:solid 2px white;width:200px;height:40px;margin-left:auto;margin-right:auto;text-align: center;">
				<p style="line-height:0px"><b>Add New User</b></p>
			</div>
			<br/>
			<div style="padding:10px;border: solid 2px #000;width:575px;height:350px;margin-left:auto;margin-right:auto;text-align: center;background-color:white;box-shadow: 10px 10px 5px #888888">
				<form method="post" action="User_Management_action.jsp" name="Login" >
					<table>
						<tr>
							<td>UserID</td>
							<td><input name="userID" value=<%=account.getNextUserID()%> size="20" readonly></td>
						</tr>
						<tr>
							<td>Username</td>
							<td><input name="username" required></td>
						</tr>
						<tr>
							<td>First Name</td>
							<td><input name="fName" required></td>
						</tr>
						<tr>
							<td>Last Name</td>
							<td><input name="lName" required></td>
						</tr>
						<tr>
							<td>Email</td>
							<td><input name="email" required></td>
						</tr>
						<tr>
							<td>New Password</td>
							<td><input name="newPassword" size="20"></td>
						</tr>
						<tr>
							<td>Retype Password</td>
							<td><input name="retypePassword" size="20"></td>
						</tr>
						<tr>
							<td style="padding:15px"><input name="add" value="Add User" type="submit" class="button" style="padding:0px;height:auto;margin-right:auto;margin-left:auto"></td>
							<td style="padding:15px"><input type="reset" class="button" value="Clear" style="padding:0px;height:auto;margin-right:auto;margin-left:auto"></td>
						</tr>
					</table>
				</form>
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