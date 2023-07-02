<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dto.ProductRepository" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="productDTO" class="dto.ProductRepository" scope="session" />

<%-- 상품 목록 페이지 --%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<%--
		ArrayList<Product> listOfProducts = productDTO.getAllProducts();
	--%>
	
	<%
		ProductRepository dto = ProductRepository.getInstance();
		ArrayList<Product> listOfProducts = dto.getAllProducts();
	%>
	
	<div class="container">
		<div class="row" align="center">
			<%
				for(int i=0; i<listOfProducts.size(); i++) {
					Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4">
				<img src="c:/upload/<%=product.getFilename() %>" style="width: 100%">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %>
				<p><fmt:formatNumber value="<%=product.getUnitPrice() %>" type="number" /> 원
				<p> <a href="./product.jsp?id=<%=product.getProductID() %>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
			</div>
			<%
				}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>

