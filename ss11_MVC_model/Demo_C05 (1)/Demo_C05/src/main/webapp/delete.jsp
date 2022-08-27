<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 26/08/2022
  Time: 10:03 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
Bạn có muốn xóa ${per.name}
<a href="/person?action=delete&id=${per.id}">Có</a>
<a href="/person">Không</a>
</body>
</html>
