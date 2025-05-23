<%@ page import="modelo.Livro" %>
<%@ page import="modelo.ALDAL" %>
<%@ page import="modelo.Erro" %>
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
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            int ano = Integer.parseInt(request.getParameter("ano"));
            
            Livro dados  = new Livro();
            Livro chaves = new Livro();
            
            dados.setCodigo(null);
            dados.setTitulo(request.getParameter("titulo"));
            dados.setAutor(request.getParameter("autor"));
            dados.setEditora(request.getParameter("editora"));
            dados.setAno(String.valueOf(ano));
            dados.setLocalizacao(request.getParameter("localizacao"));
            
            chaves.setCodigo(String.valueOf(codigo));
            chaves.setTitulo(null);
            chaves.setAutor(null);
            chaves.setEditora(null);
            chaves.setAno(null);
            chaves.setLocalizacao(null);
            
            ALDAL.update(dados, chaves);

            if (Erro.getErro()) {
                mensagem = "Erro ao atualizar livro: " + Erro.getMens();
            } else {
                mensagem = "Livro atualizado com sucesso!";
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

    <label for="codigo">Código:</label><br>
    <input type="number" name="codigo" id="codigo" required min="1"><br><br>

    <label for="titulo">Título:</label><br>
    <input type="text" name="titulo" id="titulo" required maxlength="100"><br><br>

    <label for="autor">Autor:</label><br>
    <input type="text" name="autor" id="autor" required maxlength="100"><br><br>

    <label for="editora">Editora:</label><br>
    <input type="text" name="editora" id="editora" required maxlength="100"><br><br>

    <label for="ano">Ano:</label><br>
    <input type="number" name="ano" id="ano" required min="0" max="2100"><br><br>
    
    <label for="localizacao">Localização:</label><br>
    <input type="text" name="localizacao" id="localizacao" maxlength="50"><br><br>

    <button type="submit">Atualizar</button>
    <a href="index.jsp">Voltar</a>
</form>

</body>
</html>
