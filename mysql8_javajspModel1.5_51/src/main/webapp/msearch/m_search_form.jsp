<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form action="<%=request.getContextPath()%>/msearch/m_search_list.jsp" method="post">
<select name="sk">
    <option value="m_id">���̵�</option>
    <option value="m_level">����</option>
    <option value="m_name">�̸�</option>
    <option value="m_email">�̸���</option>
</select>
<input type="text" name="sv">
<input type="submit" value="�˻���ư">
</form>