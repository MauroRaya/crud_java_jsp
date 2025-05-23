<%@ page import="modelo.Livro" %>
<%@ page import="modelo.ALDAL" %>
<%@ page import="modelo.Erro" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consultar Livro</title>
</head>
<body>

<h2>Consultar Livro por Código</h2>

<%
    String idParam = request.getParameter("codigo");
    String mensagem = "";
    boolean encontrou = false;
    Livro livro = new Livro();

    if (idParam != null && !idParam.trim().isEmpty()) {
        try {
            livro.setCodigo(idParam);

            ALDAL.get(livro);

            if (Erro.getErro()) {
                mensagem = "Erro ao consultar o livro: " + Erro.getMens();
            } else if (livro.getTitulo() == null || livro.getTitulo().isEmpty()) {
                mensagem = "Nenhum livro encontrado com o código " + idParam + ".";
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
    <label for="codigo">Código:</label><br>
    <input type="number" name="codigo" id="codigo" required min="1"><br><br>
    <input type="submit" value="Consultar">
    <a href="index.jsp">Voltar</a>
</form>

<% if (encontrou) { %>
    <hr>
    <h3>Livro encontrado:</h3>
    <p><strong>Código:</strong> <%= livro.getCodigo() %></p>
    <p><strong>Título:</strong> <%= livro.getTitulo() %></p>
    <p><strong>Autor:</strong> <%= livro.getAutor() %></p>
    <p><strong>Editora:</strong> <%= livro.getEditora() %></p>
    <p><strong>Ano:</strong> <%= livro.getAno() %></p>
    <p><strong>Localização:</strong> <%= livro.getLocalizacao() %></p>
<% } %>

</body>
</html>
