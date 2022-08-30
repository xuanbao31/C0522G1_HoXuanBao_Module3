
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <p>${msg}</p>
  <a href="/product?action=showformcreate">Create new product</a>
<h1>List Product</h1>
  <table border="1">
      <tr>
          <th>Name</th>
          <th colspan="2">Action</th>
      </tr>
      <c:forEach var="per" items="${list}">
          <tr>
                <td>
                    <c:out value="${per.name}"/>
                </td>
                <td><button><a href="">Edit</a></button></td>
                <td><button><a href="/product?action=delete&id=${per.id}">Delete</a></button></td>
          </tr>
      </c:forEach>

  </table>
  </body>
</html>
