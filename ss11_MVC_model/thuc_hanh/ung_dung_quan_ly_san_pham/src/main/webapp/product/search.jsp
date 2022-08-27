<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 27/08/2022
  Time: 12:29 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/ProductServlet?action=search&id=${product.id}">
    <input type="text" name="name" placeholder="Nhập tên">
    <input type="submit" name="action" value="search">
</form>


</body>
</html>
