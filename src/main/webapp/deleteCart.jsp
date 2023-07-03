<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Product" %>
<%@ page import="dto.ProductRepository" %>

<%
	String id = request.getParameter("cartID");

	if(id == null || id.trim().equals("")) {
		response.sendRedirect("cart.jsp");
		return;		
	}
	
	session.invalidate();
	
	response.sendRedirect("cart.jsp");
%>