
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="customer" class= "gabes_ZUPS.GABeS_Customer"/> 
<jsp:useBean id="account" class= "gabes_ZUPS.GABeS_Account" scope="session"/> 
<jsp:setProperty name="account" property="*"/> 
<jsp:setProperty name="customer" property="*"/>

<%	
try{
	String error = "0";
	String newPassword = request.getParameter("newPassword");
	String retypedPassword = request.getParameter("retypePassword");
	if(newPassword.equals(retypedPassword) && !newPassword.isEmpty()){
		account.setPassword(newPassword);
	} 
	else if(!newPassword.isEmpty()||!retypedPassword.isEmpty() && (!newPassword.equals(retypedPassword))){
		error = "1";
	}
	int a = account.UpdateAccountInfo();
	int b = customer.UpdateCustomerInfo();
	response.sendRedirect("Customer_Welcome.jsp?Error="+error);
}
catch(Exception e){
	response.sendRedirect("Customer_Welcome.jsp?Error=1");
}
%>