<%@ page import="modelo.Livro" %>
<%@ page import="modelo.ALDAL" %>
<%@ page import="modelo.Erro" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Adicionar Livro</title>
</head>
<body>

<h2>Adicionar Livro</h2>

<%
    String mensagem = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            int ano = Integer.parseInt(request.getParameter("ano"));

            Livro livro = new Livro();
            livro.setCodigo(String.valueOf(codigo));
            livro.setTitulo(request.getParameter("titulo"));
            livro.setAutor(request.getParameter("autor"));
            livro.setEditora(request.getParameter("editora"));
            livro.setAno(String.valueOf(ano));
            livro.setLocalizacao(request.getParameter("localizacao"));
            
            ALDAL.set(livro);

            if (Erro.getErro()) {
                mensagem = "Erro ao adicionar livro: " + Erro.getMens();
            } else {
                mensagem = "Livro adicionado com sucesso!";
            }
        } catch (Exception e) {
            mensagem = "Erro ao adicionar livro: " + e.getMessage();
        }
    }
%>

<% if (!mensagem.isEmpty()) { %>
    <h3><%= mensagem %></h3>
<% } %>

<form action="adicionar.jsp" method="post">

    <label for="codigo">Código:</label><br>
    <input type="number" name="codigo" id="codigo" required min="1"><br><br>

    <label for="titulo">Título:</label><br>
    <input type="text" name="titulo" id="titulo" required maxlength="100"><br><br>

    <label for="autor">Autor:</label><br>
    <input type="text" name="autor" id="autor" required maxlength="100"><br><br>

    <label for="editora">Editora:</label><br>
    <input type="text" name="editora" id="editora" required maxlength="100"><br><br>

    <label for="ano">Ano:</label><br>
    <input type="number" name="ano" id="ano" required min="0" max="2025"><br><br>

    <label for="localizacao">Localização:</label><br>
    <input type="text" name="localizacao" id="localizacao" maxlength="50"><br><br>

    <button type="submit">Salvar</button>
    <a href="index.jsp">Voltar</a>

</form>

</body>
</html>
