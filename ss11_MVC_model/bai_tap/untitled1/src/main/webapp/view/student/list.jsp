<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 27/08/2022
  Time: 3:56 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang danh sách sinh viên</h1>
<a href="/student?action=add">Them moi</a>
<table class="table ">
    <tr>
        <th>STT</th>
        <th>Id</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Birthday</th>
        <th>Point</th>
        <th>Rank</th>
        <th>Account</th>
        <th>Class ID</th>
        <th>Email</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach varStatus="status" var="student" items="${studentList}">
    <tr>
        <td>${status.count}</td>
        <td>${student.getId()}</td>
        <td>${student.getName()}</td>
        <c:if test="${student.isGender()}">
            <td>Nam</td>
        </c:if>
        <c:if test="${!student.isGender()}">
            <td>Nữ</td>
        </c:if>

        <td>${student.getBirthday()}</td>
        <td>${student.getPoint()}</td>
        <c:choose>
            <c:when test="${student.getPoint()>=8}">
                <td>Giỏi</td>
            </c:when>
            <c:when test="${student.getPoint()>=7}">
                <td>Khá</td>
            </c:when>
            <c:when test="${student.getPoint()>=5}">
                <td>Trung bình</td>
            </c:when>
            <c:otherwise>
                <td>Yếu quá</td>
            </c:otherwise>
        </c:choose>
        <td>${student.getAccount()}</td>
        <td>${student.getClassId()}</td>
        <td>${student.getEmail()}</td>
        <td><button class="btn btn-primary btn-sm">Edit</button></td>
        <td><button class="btn btn-danger btn-sm">Delete</button></td>
    </tr>
    </c:forEach>

</body>
</html>
