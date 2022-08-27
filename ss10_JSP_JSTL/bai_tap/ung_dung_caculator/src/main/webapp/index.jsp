<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 24/08/2022
  Time: 3:10 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
  <h1>Simple Calculator</h1>
<form method="get" action="/calculate">
    <p>First Operand</p>
    <br>
    <input type="text" name="firstOperand">
    <br>
    <p>
        Choose calculation</p>
    <select name="operator">
        <option>Addition</option>
        <option>Subtraction</option>
        <option>Multiplication</option>
        <option>Addition</option>

    </select>
    <p>Second Operand</p>
    <br>
    <input type="text" name="SecondOperand">
    <br>
    <input type="submit" id="submit" name="Calculate" value="submit">
</form>
  </body>
</html>
