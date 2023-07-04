<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="dto.Product"%>
<%@ page import="dto.ProductRepository"%>
<%@ page errorPage="exceptionNoProductId.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="productDTO" class="dto.ProductRepository" scope="session" />

<%-- 상품 상세 정보 페이지 --%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
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
		Product product = dto.getProcutById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="/Upload/<%=product.getFilename() %>" style="width: 100%">
			</div>
			<div class="col-md-6">
				<h3><%=product.getPname() %></h3>
				<p> <%=product.getDescription() %>
				<p> <b>상품 코드 : </b><span class="badge badge-danger">
					<%=product.getProductId() %></span>
				<p> <b>제 조 사  :</b><%=product.getManufacturer() %>
				<p> <b>분    류 :</b><%=product.getCategory() %>
				<p> <b>재 고 수 :</b><fmt:formatNumber value="<%=product.getUnitsInStock() %>" type="number" />
				<h4><fmt:formatNumber value="<%=product.getUnitPrice() %>" type="number" /> 원</h4>
				
				<p> <form name="addForm" action="./addCart.jsp?id=<%=product.getProductId() %>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> 상품 주문 &raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>					
					<a href="./products.jsp" class="btn btn-secondary"> 상품 목록 </a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>