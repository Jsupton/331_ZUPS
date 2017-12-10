<html>
	<style>
	
		ul {
   			list-style-type: none;
    		margin: auto;
    		padding: 0;
    		overflow: hidden;
		}

		li {
    		float: left;
    		display:inline;
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
    		background-color: #A26262;
    		color: white;
    		font-weight:bold;
		}
	</style>
	<head>
		<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
		<title>About GABeS</title>
	</head>
	<body>
		<div style="background-color:#A26262;width:100%;min-width:700px;height:125px;border:solid 2px white">
			<div style="background-color:White;width:500px;height:75px;margin-left:auto;margin-right:auto;box-shadow: 10px 10px 5px #888888">
				<h1 style="text-align:center">About <img src="Images/GABES.png" style="width:200px;height:50px;margin-top:10px"></h1>
			</div>
		</div>
		<div style="background-color:#777;border:solid 2px white;border-top:none;min-width:700px">
			<ul style="width:170px">
  				<li style="border:solid 1px white"><a class="active" href="Login.jsp">Back to Login</a></li>
			</ul>
		</div>
		<div style="background-color:#ddd;min-width:700px;height:auto">
			<br/>
			<br/>
			<div style="display: block;text-align: center;border:solid 2px #A26262;margin-left:auto;margin-right:auto;width:600px;background-color:#fff">
				<p style="text-align:center;font-size:15px;width:500px;margin-left:auto;margin-right:auto;display: inline-block"> 
				GABeS is an online information system that operates on top of a database backend to manage users and auctions.
				<br/><br/>
				Customers are allowed to post items that they want to auction/sell and other customers are able to bid on any item of interest, as long as the item is on auction.
				<br/><br/>
				When bidding on an item, a bidder must submit a 'Maximum bid limit'. This needs to exceed the current bid on the item, otherwise the bid is not accepted.
				The bidder can continue to bid on the item as many times as they want as long as the item is currently on auction, they are not the current winner, and the bidder is not the seller of the item.
				<br/><br/>
				The algorithm below is used to calculate the current bid of the item. It uses the current max bid, and the previous max bid to find calculate the current bid.
				<ul style="text-align:left;font-size:15px;width:500px;margin-left:auto;margin-right:auto;display: inline-block">
					<p><b><i>The current bid is computed according to the following set of rules:</i></b>
	  				<li><i><b>Initially:</b></i> current bid = <mark>seller's starting bid</mark></li>
	  				<li><i><b>After first bid:</b></i> current bid = <mark>seller's starting bid + $1</mark></li>
	  				<li><i><b>After that:</b></i> current bid = <mark>$1 + 2nd highest maximum bid limit</mark></li>
	  				<li>If somebody submits a new bid that equals the previous highest bid: current bid = <mark>highest maximum bid limit</mark> <i>(previous highest bidder is still the winner)</i>)</li></p>
				</ul>
				<p><p/>
			</div>
			<br/>
			<br/>
			<br/>
			<br/>
			<div >
				<hr style="height:2px;background-color:#777;color:#777;border:solid 1px white;margin-left:20px;margin-right:20px"/>
				<p style="font-size:12px;margin-left:20px"> <b>Copyright ©2017 ZUPS. Powered by Upton, Schmidgall, Pekarek, and Zins </b></p>
				<br/>
			</div>
		</div>
	</body>
</html>