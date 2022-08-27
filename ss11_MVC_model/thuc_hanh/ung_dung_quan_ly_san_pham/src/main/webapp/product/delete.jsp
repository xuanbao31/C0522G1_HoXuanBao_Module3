<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 26/08/2022
  Time: 8:42 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
Bạn có muốn xóa${product.name}
<%--<a href="">Có</a>--%>
<%--<a href="/ProductServlet">Không</a>--%>
<form action="/ProductServlet?action=delete&id=${products.id}" method="post">
    <button type="submit">delete</button>
</form>
</body>
</html>
