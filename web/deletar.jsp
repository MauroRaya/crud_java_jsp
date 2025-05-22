<%-- 
    Document   : deletar
    Created on : 22/05/2025, 09:17:33
    Author     : Mauro
--%>

<%@ page import="modelo.Livro" %>
<%@ page import="modelo.DAL" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Deletar Livro</title>
</head>
<body>

<h2>Excluir Livro</h2>

<%
    String mensagem = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Livro.setId(String.valueOf(id));
            Livro.setAutor(null);
            Livro.setEditora(null);
            Livro.setAno(null);

            int resultado = DAL.delete();

            if (resultado > 0) {
                mensagem = "Livro excluído com sucesso.";
            } else {
                mensagem = "Nenhum livro encontrado com o ID fornecido.";
            }
        } catch (Exception e) {
            mensagem = "Erro ao excluir livro: " + e.getMessage();
        }
    }
%>

<% if (!mensagem.isEmpty()) { %>
    <h3><%= mensagem %></h3>
<% } %>

<form action="deletar.jsp" method="post">
    <label for="id">ID do Livro a Excluir:</label><br>
    <input type="number" name="id" id="id" required min="1"><br><br>

    <button type="submit">Excluir</button>
    <a href="index.html">Voltar</a>
</form>

</body>
</html>