<%@page import="modelo.Livro"%>
<%@page import="modelo.ALDAL"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>CRUD Links</title>
</head>
<body>
<%
    ALDAL.geraTabela(new Livro());
%>
    <h1>Operações CRUD</h1>
    <ul>
        <li><a href="consultar.jsp">Consultar</a></li>
        <li><a href="adicionar.jsp">Adicionar</a></li>
        <li><a href="atualizar.jsp">Atualizar</a></li>
        <li><a href="deletar.jsp">Deletar</a></li>
    </ul>
</body>
</html>
