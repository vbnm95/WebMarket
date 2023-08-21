<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	
	String loginMemberUrl = "/member/loginMember.jsp";
	String addMemberUrl = "/member/addMember.jsp";
	String logoutMemberUrl = "/member/logoutMember.jsp";
	String updateMemberUrl = "/member/updateMember.jsp";
	
	String welcomeUrl = "/welcome.jsp";
	String productUrl = "/products.jsp";
	String addProductUrl = "/addProduct.jsp";
	String updateProductUrl ="/editProduct.jsp?edit=update";
	String deleteProductUrl ="/editProduct.jsp?edit=delete";
%>

<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="<c:url value="<%=welcomeUrl %>" />">Home</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item"><a class="nav-link" href="<c:url value="<%=loginMemberUrl %>" />" >로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="<%=addMemberUrl %>" />" >회원 가입</a></li>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: white">[<%=sessionId %>님]</li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="<%=logoutMemberUrl %>" />">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="<%=updateMemberUrl %>" />">회원 수정</a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a class="nav-link" href="<c:url value="<%=productUrl %>" />">상품 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="<%=addProductUrl %>" />">상품 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="<%=updateProductUrl %>" />">상품 수정</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="<%=deleteProductUrl %>" />">상품 삭제</a></li>
			</ul>
		</div>
	</div>
</nav>