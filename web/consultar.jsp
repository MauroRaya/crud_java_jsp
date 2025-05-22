<%@ page import="modelo.DAL" %>
<%@ page import="modelo.Livro" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consultar Livro</title>
</head>
<body>

<h2>Consultar Livro por ID</h2>

<%
    String idParam = request.getParameter("id");
    String mensagem = "";
    boolean encontrou = false;

    if (idParam != null && !idParam.trim().isEmpty()) {
        try {
            Livro.setId(idParam);
            Livro.setAutor(null);
            Livro.setEditora(null);
            Livro.setAno(null);

            DAL.get();

            if (Livro.getTitulo() == null) {
                mensagem = "Nenhum livro encontrado com o ID " + idParam + ".";
            } else {
                encontrou = true;
            }
        } catch (Exception e) {
            mensagem = "Erro ao consultar o livro: " + e.getMessage();
        }
    }
%>

<% if (!mensagem.isEmpty()) { %>
    <h3><%= mensagem %></h3>
<% } %>

<form action="consultar.jsp" method="get">
    <label for="id">ID do Livro:</label><br>
    <input type="number" id="id" name="id" required><br><br>
    <input type="submit" value="Consultar">
    <a href="index.html">Voltar</a>
</form>

<% if (encontrou) { %>
    <hr>
    <h3>Livro encontrado:</h3>
    <p><strong>ID:</strong> <%= Livro.getId() %></p>
    <p><strong>Título:</strong> <%= Livro.getTitulo() %></p>
    <p><strong>Autor:</strong> <%= Livro.getAutor() %></p>
    <p><strong>Editora:</strong> <%= Livro.getEditora() %></p>
    <p><strong>Ano:</strong> <%= Livro.getAno() %></p>
<% } %>

</body>
</html>
