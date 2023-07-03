<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="dto.Product" %>
<%@ page import="dto.ProductRepository" %>
<%@ page import="java.io.*, java.util.*" %>

<%-- 신규 상품 등록 처리 페이지 --%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String filename = "";
	String realFolder = "C:\\WebMarket\\upload";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String productID = multi.getParameter("productID");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	
	Integer price;
	
	if(unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
	
	long stock;
	
	if(unitsInStock.isEmpty())
		stock = 0L;
	else
		stock = Long.valueOf(unitsInStock);
	
	
	Enumeration<String> files = multi.getFileNames();
	String fname = files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	ProductRepository dto = ProductRepository.getInstance();
	
	Product newProduct = new Product();
	newProduct.setProductID(productID);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);	
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(fileName);
	
	dto.addProduct(newProduct);
	
	response.sendRedirect("products.jsp");
		
%>
	