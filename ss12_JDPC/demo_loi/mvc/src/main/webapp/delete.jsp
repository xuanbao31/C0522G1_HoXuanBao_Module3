
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<p>Bạn có muốn xóa : <span><c:out value="${product.name}"/></span></p>
<button><a href="/product?action=deleteProduct&id=${product.id}">Có</a></button>
<button><a href="/product">Không</a></button>
</body>
</html>
