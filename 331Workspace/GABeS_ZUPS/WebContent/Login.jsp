<html style="background-color:white">
	<style>
		.button {
		    background-color: #777;
		    border: none;
		    color: white;
		    padding: 15px 32px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    font-size: 14px;
		    margin: 4px 2px;
		    cursor: pointer;
		}
		.button:hover {
		    background-color: #A6C971;
		    color: white;
		    padding: 10px;
		    margin: 4px 2px;
		    font-size: 30px;
		    cursor: pointer;
		    box-shadow: 10px 10px 5px #888888;
		    border:solid 2px #777;
		}
	</style>
	<head>
		<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
		<title>GABeS Login Page</title>
	</head>
	<body>
		<div style="background-color:#A6C971;width:100%;min-width:700px;height:225px;border:solid 3px #777">
		<br/>
			<div style="background-color:White;width:70%;min-width:400px;height:120px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #888888">
				<h1 style="text-align:center"><img src="Images/GABES.png" style="width:200px;height:50px;"> LOGIN</h1>
				<p style="text-align:center;font-size:20px"><b><i>G</i></b>eek <b><i>A</i></b>utomated <b><i>B</i></b>idding <b><i>e-S</i></b>ystem</p>
			</div>
			<div style="display: block;text-align: center;">
				<p style="text-align:center;font-size:15px;width:500px;margin-left:auto;margin-right:auto;display: inline-block"> This site is designed as an automated bidding system. Allows Customers to buy and sell desired items.</p>
			</div>
		</div>
		<hr style="border:solid 1px white;color:white"/>
		<div style="display: block;text-align: center;min-width:700px;height:auto;background-color:#e1e1e1;border:solid 3px #777">
			<br/>
			<br/>
			<div style="font-size:18px;background-color:#e1e1e1;width:100%;height:auto;margin-left:auto;margin-right:auto;text-align: center;">
				<% String anyErrors = request.getParameter("Error");
				   if(anyErrors!=null && anyErrors.equals("1")){
	        		   %><p style="text-align:center; color:red"><b>An Error Occurred - UNSUCCESSFUL Login</b></p><% 
				   }else if(anyErrors!=null && anyErrors.equals("2")){
   	        		   %><p style="text-align:center; color:red"><b>YOU MUST BE LOGGED IN</b></p><%
   	        	   }%>
			</div>
			<br/>
			<br/>
				<form method="post" action="Login_action.jsp" name="Login" style="padding:15px;border: solid 2px #000;width:400px;height:180px;margin-left:auto;margin-right:auto;display: inline-block;text-align: center;background-color:white;box-shadow: 10px 10px 5px #888888">
					<br/>
					Enter your User Name <input name="userName" value=""><br>
					<br>
					Enter your password <input name="password" value="" type="password"><br>
					<br>
					<table style="width:200px;margin-left:auto;margin-right:auto">
					<tr style="height:75px">
						<td><input name="Login" value="Login" type="submit" class="button"></td>
						<td><input type="reset" class="button"><br></td>
					</tr>
					</table>
				</form>
				<br/>
				<br/>
				<p style="text-align:center;font-size:10px">For more information regarding the GABeS bidding process, click <a href="GABeS_Info.jsp">here</a></p>
			<br/>
			<br/>
			<div >
				<hr style="height:2px;background-color:#777;color:#777;border:solid 1px white;margin-left:20px;margin-right:20px"/>
				<p style="font-size:12px;margin-left:20px"> <b>Copyright ©2017 ZUPS. Powered by Upton, Schmidgall, Pekarek, and Zins </b></p>
			</div>
		</div>
	</body>
</html>