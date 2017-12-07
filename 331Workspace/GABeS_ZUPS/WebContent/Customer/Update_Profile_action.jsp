
<%@ page language="java" import="java.sql.*"%>
<%@include file="/Security.jsp"%>
<jsp:useBean id="customer" class= "gabes_ZUPS.GABeS_Customer"/> 
<jsp:useBean id="acct" class= "gabes_ZUPS.GABeS_Account"/> 
<jsp:setProperty name="acct" property="*"/> 
<jsp:setProperty name="customer" property="*"/>

<%	
try{
	String error = "0";
	//The two passwords are retrieved and checked to see if they match
	String newPassword = request.getParameter("newPassword");
	String retypedPassword = request.getParameter("retypePassword");
	if(!retypedPassword.isEmpty() && !newPassword.isEmpty()){
		if((!newPassword.equals(retypedPassword))){
			error = "1";
		}
		else{
			acct.setPassword(newPassword);
		} 
	}
	
	//The account informaiton is updated
	int a = acct.UpdateAccountInfo();
	int b = customer.UpdateCustomerInfo();
	//If both updates were successful, then the session variable is populated
	if(a!=-1 && b!=-1){
		account.setPassword(acct.getPassword());
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