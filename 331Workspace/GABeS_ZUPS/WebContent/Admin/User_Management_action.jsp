
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="cust" class= "jupton.gabes_ZUPS.GABeS_Customer"/> 
<jsp:useBean id="acct" class= "jupton.gabes_ZUPS.GABeS_Account"/> 
<jsp:setProperty name="cust" property="*"/> 
<jsp:setProperty name="acct" property="*"/>
<%@include file="/Security.jsp"%>

<%
	String newPassword = request.getParameter("newPassword");
	String retypedPassword = request.getParameter("retypePassword");
	if(newPassword.equals(retypedPassword) && !newPassword.isEmpty()){
		acct.setPassword(newPassword);
		int a = acct.addAccount(); 
		int b = cust.addCustomer(); 
		if(a>0 && b>0)
			response.sendRedirect("User_Management.jsp?Error=0");
		else
			response.sendRedirect("User_Management.jsp?Error=1");
	} 
	else{
		response.sendRedirect("User_Management.jsp?Error=2");
	}
%>