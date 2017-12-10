
<%@ page language="java" import="java.sql.*"%>
<%@include file="/Security.jsp"%>
<jsp:useBean id="feedback" class= "jsupton.gabes_ZUPS.GABeS_Feedback"/> 
<jsp:setProperty name="feedback" property="*"/> 
<%	

try{
	feedback.insertNewFeedback();
	response.sendRedirect("Leave_Feedback.jsp?Error=0");
}
catch(Exception e){
	response.sendRedirect("Leave_Feedback.jsp?Error=1");
}
%>