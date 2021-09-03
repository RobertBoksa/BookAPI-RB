<%--
  Created by IntelliJ IDEA.
  User: robert
  Date: 03.09.2021
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Book List</title>
</head>
<body>

<table border="1">
    <thead>
    <th>isbn</th>
    <th>title</th>
    <th>author</th>
    <th>publisher</th>
    <th>type</th>
    <th>edit</th>
    <th>delete</th>
    </thead>
    <tbody>
    <a href="/admin/books/add">Add book</a>
    <c:forEach items="${books}" var="book">
        <tr>
            <td><c:out value="${book.isbn}"/></td>
            <td><c:out value="${book.title}"/></td>
            <td><c:out value="${book.author}"/></td>
            <td><c:out value="${book.publisher}"/></td>
            <td><c:out value="${book.type}"/></td>
            <td><a href="/admin/books/edit/${book.id}">Edit</a></td>
            <td><a href="/admin/books/delete/${book.id}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<form action="/admin/books/all">
    <table>
    <thead>
    <th>Sort by:</th>
    <th></th>
    </thead>
        <tbody>
        <tr>
            <td>isbn:<input type="radio" name="sort" value="isbn"/></td>
        </tr>
        <tr>
            <td> Title:<input type="radio" name="sort" value="title"/></td>
        </tr>
        <tr>
            <td> Author:<input type="radio" name="sort" value="author"/></td>
        </tr>
        <tr>
            <td> Publisher:<input type="radio" name="sort" value="publisher"/></td>
        </tr>
        <tr>
            <td>Type:<input type="radio" name="sort" value="type"/></td>
        </tr>
        <tr>
            <td>Write value: <input name="val"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="search"></td>
        </tr>
        </tbody>
    </table>
</form>


</body>
</html>

