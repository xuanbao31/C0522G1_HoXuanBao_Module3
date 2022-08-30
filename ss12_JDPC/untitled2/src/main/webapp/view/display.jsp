<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 30/08/2022
  Time: 7:26 SA
  To change this template use File | Settings | File Templates.
--%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang hiển thị user</h1>
<pre><a href="/user?action=add">Thêm mới</a></pre>

<form action="/user">
    <input type="text" name="countrySearch" placeholder="nhập quốc gia">
    <button type="submit" name="action" value="search" >tìm kiếm</button>
</form>

<table  class=" table">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="user" items="${userList}">
        <tr>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td><a class="edit" href="/user?action=edit&id=${user.id}">Edit</a></td>
            <td><a class="delete" href="/user?action=delete&id=${user.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
