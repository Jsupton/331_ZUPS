
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="customer" class= "gabes_ZUPS.GABeS_Customer"/> 
<jsp:useBean id="acct" class= "gabes_ZUPS.GABeS_Account"/> 
<jsp:useBean id="account" class= "gabes_ZUPS.GABeS_Account" scope="session"/> 
<jsp:setProperty name="acct" property="*"/> 
<jsp:setProperty name="customer" property="*"/>

<%	
try{
	String error = "0";
	String newPassword = request.getParameter("newPassword");
	String retypedPassword = request.getParameter("retypePassword");
	if(!newPassword.isEmpty()||!retypedPassword.isEmpty() && (!newPassword.equals(retypedPassword))){
		error = "1";
	}
	else if(newPassword.equals(retypedPassword) && !newPassword.isEmpty()){
		acct.setPassword(newPassword);
	} 
	int a = acct.UpdateAccountInfo();
	int b = customer.UpdateCustomerInfo();
	if(a!=-1 && b!=-1){
		%>
		<jsp:setProperty name="account" property="*"/> 
		<%
	}
	else{
		error = "1";
	}
	response.sendRedirect("Customer_Welcome.jsp?Error="+error);
}
catch(Exception e){
	response.sendRedirect("Customer_Welcome.jsp?Error=1");
}
%>