<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="java.io.*" %>
<%
	int cashNo = Integer.parseInt(request.getParameter("cashNo"));
	String filename = request.getParameter("filename");
	// 전달된 파라미터 값 확인용 출력
	System.out.println("deleteReceipt.jsp cashNo: " + cashNo);
	System.out.println("deleteReceipt.jsp filename: " + filename);
	
	ReceiptDao receiptDao = new ReceiptDao();
	receiptDao.deleteReceipt(cashNo, filename);
	
	// 파일 삭제
	String path = request.getServletContext().getRealPath("upload");
	File file = new File(path, filename); // new File 경로에 파일이 없으면 빈 파일을 생성 준비
	if(file.exists()) { // 빈 파일이 아니라면
		file.delete(); // 삭제
	}
	
	response.sendRedirect("/cashbook-mvc/cash/cashOne.jsp?cashNo=" + cashNo);
%>