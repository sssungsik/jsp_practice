<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
String send_code = request.getParameter("send_code");	
System.out.println(send_code + "<-- 샌드코드");
Connection conn = null;
PreparedStatement pstmt = null;
Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.6:3306/dev51db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");

pstmt = conn.prepareStatement("DELETE FROM tb01_medicine WHERE m_code=?"); 
pstmt.setString(1, send_code);
pstmt.executeUpdate();
pstmt.close();
conn.close();
response.sendRedirect(request.getContextPath()+"/msearch/medicine_search_list.jsp");
%>
