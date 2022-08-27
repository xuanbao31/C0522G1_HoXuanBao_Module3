<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 26/08/2022
  Time: 8:43 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/ProductServlet?action=edit&id=${product.id}" method="post">
    <table>
        <tr>
            <td>
                <input type="text" readonly name="id" value="${product.id}">
            </td>
        </tr>

        <tr>
            <td><input type="text" value="${product.name}" name="name" placeholder="Nhập tên"></td>

        </tr>
        <tr>
            <td> <input type="text" value="${product.price}" name="price" placeholder="Nhập giá"></td>
        </tr>
        <tr>
            <td><input type="text" value="${product.feedBack}" name="feedBack" placeholder="Nhập đánh giá"></td>
        </tr>
     <tr>
         <td><input type="text" value="${product.producer}" name="producer" placeholder="Nhập nhà sản xuất"></td>
     </tr>

    </table>

    <input type="submit">

</form>

</body>
</html>
