<%@page language="java" import="java.util.*"%>
<jsp:useBean id="account" class= "jsupton.gabes_ZUPS.GABeS_Account" scope="session"/> 
<%

if(!account.isLoggedIn()){
	response.sendRedirect("../../Login.jsp?Error=2");
	return;
}
%>