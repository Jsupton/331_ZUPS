<%@ page language="java" import="java.sql.*"%> 
<%@include file="Security.jsp"%>
<jsp:useBean id="item" class= "gabes_ZUPS.GABeS_Item"/> 
<jsp:setProperty name="item" property="*"/>

<%	
String endtime = request.getParameter("endDay") + "/" + request.getParameter("endMonth") + "/" + request.getParameter("endYear");
item.setEndTime(endtime);
int i = item.insertNewItem(account.getUserID()); 
if(i>0)
	response.sendRedirect("ViewItemsSelling.jsp?Error=0");
else
	response.sendRedirect("ViewItemsSelling.jsp?Error=1");
%>