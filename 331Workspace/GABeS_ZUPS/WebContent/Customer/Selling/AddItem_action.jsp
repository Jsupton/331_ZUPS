<%@ page language="java" import="java.sql.*"%> 
<%@include file="Security.jsp"%>
<jsp:useBean id="item" class= "gabes_ZUPS.GABeS_Item"/> 
<jsp:setProperty name="item" property="*"/>

<%	
String endtime = request.getParameter("endDay") + "/" + request.getParameter("endMonth") + "/" + request.getParameter("endYear");
item.setEndTime(endtime);
item.insertNewItem(account.getUserID()); 
response.sendRedirect("ViewItemsSelling.jsp");
%>