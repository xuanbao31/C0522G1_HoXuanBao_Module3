<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24/08/2022
  Time: 2:12 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<h1 align="center">Danh Sách Khách Hàng</h1>
<table class="table" border="1">
    <tr>
        <th>Họ Và Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa Chỉ</th>
        <th>Ảnh</th>
    </tr
    <c:forEach varStatus="status" var="customer" items="${customerList}">
        <tr>
            <td>${customer.getName()} </td>
            <td>${customer.getBirthDay()} </td>
            <td>${customer.getAddress()} </td>
            <td><img width="110px"height="120px" src="${customer.getPicture()}"></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
