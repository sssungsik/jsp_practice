<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
//post��� �ѱ� ó�� ���
request.setCharacterEncoding("euc-kr");
String m_id = request.getParameter("m_id"); //String m_id = "id008";
String m_pw = request.getParameter("m_pw");
String m_level = request.getParameter("m_level");
String m_name = request.getParameter("m_name");
String m_email = request.getParameter("m_email");
System.out.println(m_id + "<-- m_id /mupdate/m_update_action.jsp");
System.out.println(m_pw + "<-- m_pw /mupdate/m_update_action.jsp");
System.out.println(m_level + "<-- m_level /mupdate/m_update_action.jsp");
System.out.println(m_name + "<-- m_name /mupdate/m_update_action.jsp");
System.out.println(m_email + "<-- m_email /mupdate/m_update_action.jsp");
Connection conn = null;
PreparedStatement pstmt = null;
Class.forName("com.mysql.jdbc.Driver");
String jdbcDriver = "jdbc:mysql://192.168.10.17:3306/dev51db?" +
		"useUnicode=true&characterEncoding=euckr";
String dbUser = "dev51id";
String dbPass = "dev51pw";

conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
System.out.println(conn + "<-- conn");
pstmt = conn.prepareStatement("UPDATE tb_member SET m_pw=?,m_level=?,m_name=?,m_email=? WHERE m_id=?"); 
pstmt.setString(1, m_pw);
pstmt.setString(2, m_level);
pstmt.setString(3, m_name);
pstmt.setString(4, m_email);
pstmt.setString(5, m_id);
System.out.println(pstmt + "<-- pstmt");
pstmt.executeUpdate();
pstmt.close();
conn.close();
response.sendRedirect(request.getContextPath()+"/msearch/m_search_list.jsp");
%>





