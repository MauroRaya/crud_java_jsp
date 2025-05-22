<%-- 
    Document   : atualizar
    Created on : 22/05/2025, 09:10:13
    Author     : Mauro
--%>

<%@ page import="java.sql.*" %>
<%@ page import="modelo.Livro" %>
<%@ page import="modelo.DAL" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Atualizar Livro</title>
</head>
<body>

<h2>Atualizar Livro</h2>

<%
    String mensagem = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            String editora = request.getParameter("editora");
            int ano = Integer.parseInt(request.getParameter("ano"));

            Livro.setId(String.valueOf(id));
            Livro.setTitulo(titulo);
            Livro.setAutor(autor);
            Livro.setEditora(editora);
            Livro.setAno(String.valueOf(ano));

            int resultado = DAL.update();

            if (resultado > 0) {
                mensagem = "Livro atualizado com sucesso!";
            } else {
                mensagem = "Nenhum livro encontrado com o ID fornecido.";
            }

        } catch (Exception e) {
            mensagem = "Erro ao atualizar livro: " + e.getMessage();
        }
    }
%>

<% if (!mensagem.isEmpty()) { %>
    <h3><%= mensagem %></h3>
<% } %>

<form action="atualizar.jsp" method="post">
    <input type="hidden" name="_method" value="PUT">

    <label for="id">Código (ID):</label><br>
    <input type="number" name="id" id="id" required min="1"><br><br>

    <label for="titulo">Título:</label><br>
    <input type="text" name="titulo" id="titulo" required maxlength="100"><br><br>

    <label for="autor">Autor:</label><br>
    <input type="text" name="autor" id="autor" required maxlength="100"><br><br>

    <label for="editora">Editora:</label><br>
    <input type="text" name="editora" id="editora" required maxlength="100"><br><br>

    <label for="ano">Ano:</label><br>
    <input type="number" name="ano" id="ano" required min="0" max="2100"><br><br>

    <button type="submit">Atualizar</button>
    <a href="index.html">Voltar</a>
</form>

</body>
</html>

