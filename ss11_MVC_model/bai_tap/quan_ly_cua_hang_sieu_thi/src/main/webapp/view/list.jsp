<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 25/08/2022
  Time: 11:19 CH
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h1>Quản Lý Sản Phẩm</h1>
<a href="/Product?action=add">Thêm Mới</a>
<table class="table">
    <tr>
        <th>Id</th>
        <th>Tên Sản Phẩm</th>
        <th>Giá Sản Phẩm</th>
        <th>Mô Tả Sản Phẩm</th>

    </tr>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td>${product.count}</td>
            <td>${product.getId()}</td>
            <td>${product.getTenSanPham()}</td>
            <td>${product.getGiaSanPham()}</td>
            <td>${product.getMoTaSanPham()}</td>

        </tr>

    </c:forEach>

</table>
</body>
</html>

