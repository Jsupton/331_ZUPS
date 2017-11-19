<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="account" class="gabes_ZUPS.GABeS_Account"/> 
<% 
    try{
    	account.logout();
 		session.invalidate();  

    }
    catch(IllegalStateException ise){
        out.println(ise.getMessage());
    }
    response.sendRedirect("Login.jsp");
   %> 