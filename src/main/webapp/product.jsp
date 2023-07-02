<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Product"%>
<%@ page import="dto.ProductRepository"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="productDTO" class="dto.ProductRepository" scope="session" />

<%-- 상품 상세 정보 페이지 --%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>상품 상세 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"> 상품 정보 </h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		
		ProductRepository dto = ProductRepository.getInstance();
		Product product = dto.getProcutByID(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="c:/upload/<%=product.getFilename() %>" style="width: 100%">
			</div>
			<div class="col-md-6">
				<h3><%=product.getPname() %></h3>
				<p> <%=product.getDescription() %>
				<p> <b>상품 코드 : </b><span class="badge badge-danger">
					<%=product.getProductID() %></span>
				<p> <b>제 조 사  :</b><%=product.getManufacturer() %>
				<p> <b>분    류 :</b><%=product.getCategory() %>
				<p> <b>재 고 수 :</b><fmt:formatNumber value="<%=product.getUnitsInStock() %>" type="number" />
				<h4><fmt:formatNumber value="<%=product.getUnitPrice() %>" type="number" /> 원</h4>
				
				<p> <a href="#" class="btn btn-info"> 상품 주문 &raquo;</a>
				<a href="./products.jsp" class="btn btn-secondary"> 상품 목록 </a>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>