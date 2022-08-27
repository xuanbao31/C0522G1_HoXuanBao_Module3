<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 26/08/2022
  Time: 8:42 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/ProductServlet?action=create">Create new product</a>

</p>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>FeedBack</td>
        <td>Producer</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td><a href="/ProductServlet?action=view&id=${product.id}">${product.name}</a></td>
            <td>${product.price}</td>
            <td>${product.feedBack}</td>
            <td>${product.producer}</td>
            <td><a href="/ProductServlet?action=edit&id=${product.id}">edit</a></td>
            <td><a href="/ProductServlet?action=delete&id=${product.id}">delete</a></td>
            <td><a href="/ProductServlet?action=${product.id}">search</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>