<%--
  Created by IntelliJ IDEA.
  User: robert
  Date: 01.09.2021
  Time: 00:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Accept delete</title>
</head>
<body>

    <h1>Czy chcesz usunąć książkę ${book.title}</h1>

    <a href="/admin/books/deleteAccepted?id=${book.id}">Tak Usuń</a>
    <a href="/admin/books/all">Nie usuwaj</a>



</body>
</html>
