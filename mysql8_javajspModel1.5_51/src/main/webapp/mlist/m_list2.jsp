<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%= request.getRequestURI() %> <br>
회원 리스트 <br>
<table width="100%" border="1">
<tr>
	<td>아이디</td><td>비번</td><td>권한</td><td>이름</td><td>이메일</td>
</tr>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
//JDBC 프로그램 순서
//01단계 :드라이버 로딩 시작
	Class.forName("com.mysql.jdbc.Driver");
//01단계 :드라이버 로딩 끝
	try{
//02단계 :DB연결(Connection)시작
		String jdbcDriver = "jdbc:mysql://localhost:3306/dev51db?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dev51id";
		String dbPass = "dev51pw";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
//02단계 :DB연결(Connection)끝
		System.out.println(conn + "<-- conn m_list.jsp");
		if(conn != null){
			out.println("01 DB연결 성공");
		}else{
			out.println("02 DB연결 실패");
		}
//03단계 :Query실행을 위한 statement 또는 prepareStatement객체생성 시작
		pstmt = conn.prepareStatement("select * from tb_member");
		System.out.println(pstmt + "<-- pstmt");
//04단계 :Query실행 시작
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs m_list.jsp");
//ResultSet인터페이스 구현클래스 ResultSetImpl 통해 생성된 객체의 주소값 : 
//com.mysql.cj.jdbc.result.ResultSetImpl@2c831aba
		//System.out.println(rs.next() + "<-- rs.next() m_list.jsp");
//04단계 :Query실행 끝
//05단계 :Query실행결과 사용
		//System.out.println(rs.next() + "<-- rs.next() m_list.jsp");
//---   select문장 통해서 모든 회원 목록 가져와서 한줄씩 (레코드(record) or 로우(row))보여준다 시작 
		while(rs.next()){
%>
		<tr>
			<td><%= rs.getString("m_id")%></td>
			<td><%= rs.getString("m_pw")%></td>
			<td><%= rs.getString("m_level")%></td>
			<td><%= rs.getString("m_name")%></td>
			<td><%= rs.getString("m_email")%></td>
			<td><%= rs.getString(5)%></td>
			<%-- <td><%= rs.getString("m_email55555")%></td> --%>
			
			
		</tr>

<%		
/*
			out.println(rs.getString("m_id") + "<-- m_id 필드=컬럼 값 in tb_member테이블 <br>");
			out.println(rs.getString("m_pw") + "<-- m_pw 필드=컬럼 값 in tb_member테이블 <br>");
			out.println(rs.getString("m_level") + "<-- m_level 필드=컬럼 값 in tb_member테이블 <br>");
			out.println(rs.getString("m_name") + "<-- m_name 필드=컬럼 값 in tb_member테이블 <br>");
			out.println(rs.getString("m_email") + "<-- m_email 필드=컬럼 값 in tb_member테이블 <br><br>"); 
*/
		}
//---   select문장 통해서 모든 회원 목록 가져와서 한줄씩 (레코드(record) or 로우(row))보여준다 끝

	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		// 6. 사용한 Statement 종료
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		
		// 7. 커넥션 종료
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>	

</table>

