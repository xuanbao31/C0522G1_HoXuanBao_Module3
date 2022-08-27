<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 25/08/2022
  Time: 11:22 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>
    Trang Thêm Mới
</h1>
<a href="/Product">Trang List</a>
<form action="/Product?action=add" method="post">
<pre>ID: <input type="text" name="id"></pre>
<pre>Tên Sản Phẩm: <input type="text" name="tenSanPham"></pre>
<pre>Giá Sản Phẩm: <input type="text" name="giaSanPham"></pre>
<pre>Mô Tả Sản Phẩm: <input type="text" name="moTaSanPham"></pre>
</form>

</body>
</html>
