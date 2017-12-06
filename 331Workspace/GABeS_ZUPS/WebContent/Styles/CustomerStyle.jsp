
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
			/* Popup container */
	.popup {
	    position: relative;
	    display: inline-block;
	    cursor: pointer;
	}
			/* The actual popup */
	.popup .popuptext {
	    visibility: hidden;
	    width: 160px;
	    background-color: #555;
	    color: #fff;
	    text-align: center;
	    border-radius: 6px;
	    padding: 8px 0;
	    position: absolute;
	    z-index: 1;
	    bottom: 125%;
	    left: 50%;
	    margin-left: -80px;
	}
	
	/* Popup arrow */
	.popup .popuptext::after {
	    content: "";
	    position: absolute;
	    top: 100%;
	    left: 50%;
	    margin-left: -5px;
	    border-width: 5px;
	    border-style: solid;
	    border-color: #555 transparent transparent transparent;
	}
	
	/* Toggle this class - hide and show the popup */
	.popup .show {
	    visibility: visible;
	    -webkit-animation: fadeIn 1s;
	    animation: fadeIn 1s;
	}
	
	/* Add animation (fade in the popup) */
	@-webkit-keyframes fadeIn {
	    from {opacity: 0;} 
	    to {opacity: 1;}
	}
	
	@keyframes fadeIn {
	    from {opacity: 0;}
	    to {opacity:1 ;}
	}
</style>
<script>
	// When the user clicks on div, open the popup
	function myFunction() {
		//var popup = document.getElementById("myPopup");
		//popup.classList.toggle("hide");
		 alert("You are no longer the winner of " + <%//item.itemsNotWinning(account.getUserID(), account.getUserName())%>);
	}
</script>