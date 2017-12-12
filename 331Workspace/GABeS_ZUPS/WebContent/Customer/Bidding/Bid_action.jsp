
<%@ page language="java" import="java.sql.*"%>
<%@include file="../../Styles/Security.jsp"%>
<jsp:useBean id="Bid" class= "jsupton.gabes_ZUPS.GABeS_Bids"/> 
<jsp:setProperty name="Bid" property="*"/>

<%	
try{
	double CurrentBid = Double.parseDouble(request.getParameter("currentBid"));
	if(CurrentBid>Bid.getMaxBid()){
		response.sendRedirect("SearchResults.jsp?Error=1");
	}
	else{
		Bid.setUserID(account.getUserID());
		Bid.bidOnItem();
		response.sendRedirect("SearchResults.jsp?Error=0");
	}
}
catch(Exception e){
	System.out.println(e.toString());
	response.sendRedirect("SearchResults.jsp?Error=2");
}
%>