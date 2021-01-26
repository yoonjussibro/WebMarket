<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<!-- 파일 업로드용 라이브러리 추가 -->
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<!-- 
dao : Data Access Object 의 줄임말로서 데이터를 조작하기 위한 기능을 전담하기 위해서 만들어진 오브젝트
dto : Data Transfer Object  의 줄임말로서 계층간의 데이터를 교환하기 위한 오브젝트 / DB와 자바의
		데이터타입은 실제로는 같지 않음, 자바에서 DB의 데이터를 사용하기 위해서 데이터 변환을 하기 위한
		클래스의 객체
 -->
<%
	request.setCharacterEncoding("UTF-8");

	String filename= "";
	String realFolder = "D:\\Java\\Upload";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
/* MultipartRequest를 사용하여 넘겨받은 데이터를 하나씩 꺼냄 */
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	/* 넘겨받은 unitPrice가 문자열로 되어 있으며, Product.java의 unitPrice는 정수타입이므로
	   데이터 타입을 변경해야 함	
	*/
	Integer price;
	
	if (unitPrice.isEmpty())
	    price = 0;
	else
	    price = Integer.valueOf(unitPrice);
	
	
	/* 넘겨받은 unitsInStock가 문자열로 되어 있으며, Product.java의 unitsInStock은 정수타입이므로
	   데이터 타입을 변경해야 함	
	*/
	long stock;
	
	if (unitsInStock.isEmpty())
	    stock = 0;
	else
	    stock = Long.valueOf(unitsInStock);
	
	/* MultipartRequest에 저장된 첨부 파일에 대한 정보를 읽어옴 */
	Enumeration<?> files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	/* ProductRepository 클래스 타입의 변수 dao에 싱글톤 방식으로 ProductRepository 클래스 내부에서
		생성된 객체를 대입
	*/
	ProductRepository dao = ProductRepository.getInstance();
	
	/* Product 클래스 타입의 객체 생성 */
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	
	/* Product 클래스 타입의 데이터를 dao 객체를 통해서 상품 목록에 저장 */
	dao.addProduct(newProduct);
	
	// 데이터 처리 부분은 현재 파일은 processAddProduct.jsp 파일에서 진행하고 데이터가 추가된 화면은
	// products.jsp 에서 보여주기 위해서 리다이렉트 함
	response.sendRedirect("products.jsp");
	

%>
