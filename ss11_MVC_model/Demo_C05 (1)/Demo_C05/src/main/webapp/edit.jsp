<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 26/08/2022
  Time: 9:46 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/person?action=edit&id=${per.id}" method="post">
    <input type="text" value="${per.name}" name="name">
    <input type="submit" value="Submit">
</form>
</body>
</html>
