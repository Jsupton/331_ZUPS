<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="account" class= "gabes_ZUPS.GABeS_Account" scope="session"/> 
<jsp:setProperty name="account" property="*"/>
<%
	session.setMaxInactiveInterval(1800);
	int login = account.login();
	if (login == 1){
    	response.sendRedirect("Customer/Customer_Welcome.jsp");}
   	else if(login == 2){
    	response.sendRedirect("Admin/Admin_Welcome.jsp");}
   	else if(login == -10)
	    response.sendRedirect("Login.jsp?Error=1");
%> 