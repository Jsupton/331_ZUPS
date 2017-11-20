
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="Bid" class= "gabes_ZUPS.GABeS_Bids"/> 
<jsp:useBean id="account" class= "gabes_ZUPS.GABeS_Account" scope="session"/> 
<jsp:setProperty name="Bid" property="*"/>

<%	
try{
	double CurrentBid = Double.parseDouble(request.getParameter("currentBid"));
	if(CurrentBid>Bid.getMaxBid()){
		response.sendRedirect("SearchResults.jsp?Error=1");
	}
	Bid.setUserID(account.getUserID());
	Bid.bidOnItem();
	response.sendRedirect("SearchResults.jsp?Error=0");
}
catch(Exception e){
	System.out.println(e.toString());
	response.sendRedirect("SearchResults.jsp?Error=2");
}
%>