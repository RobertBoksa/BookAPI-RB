<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: robert
  Date: 03.09.2021
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book</title>
    <title>Create book</title>
    <style>
        .error{
            color: red;
        }
    </style>
</head>
<body>
<table border="1">
    <form:form action="/admin/books/add" method="post" modelAttribute="book">
        <tr>
            <td><form:label path="isbn">isbn:</form:label></td>
            <td><form:input path="isbn"/></td>
            <td><form:errors path="isbn" cssClass="error"/></td>
        </tr>
        <tr>
            <td><form:label path="title">Title:</form:label></td>
            <td><form:input path="title"/></td>
            <td><form:errors path="title" cssClass="error"/></td>
        </tr>
        <tr>
            <td><form:label path="author">Author:</form:label></td>
            <td><form:input path="author"/></td>
            <td><form:errors path="author" cssClass="error"/></td>
        </tr>
        <tr>
            <td><form:label path="publisher">Publisher:</form:label></td>
            <td><form:input path="publisher"/></td>
            <td><form:errors path="publisher" cssClass="error"/></td>
        </tr>
        <tr>
            <td><form:label path="type">Type:</form:label></td>
            <td><form:input path="type"/></td>
            <td><form:errors path="type" cssClass="error"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="Save"></td>
        </tr>
    </form:form>
</table>
</body>
</html>
