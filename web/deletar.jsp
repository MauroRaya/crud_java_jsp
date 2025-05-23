<%@ page import="modelo.Livro" %>
<%@ page import="modelo.ALDAL" %>
<%@ page import="modelo.Erro" %>
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
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            
            Livro livro = new Livro();
            livro.setCodigo(String.valueOf(codigo));
            
            ALDAL.delete(livro);

            if (Erro.getErro()) {
                mensagem = "Erro ao excluir livro: " + Erro.getMens();
            } else {
                mensagem = "Livro deletado com sucesso.";
            }
        } catch (NumberFormatException nfe) {
            mensagem = "Código inválido.";
        } catch (Exception e) {
            mensagem = "Erro ao excluir livro: " + e.getMessage();
        }
    }
%>

<% if (!mensagem.isEmpty()) { %>
    <h3><%= mensagem %></h3>
<% } %>

<form action="deletar.jsp" method="post">
    <label for="codigo">Código:</label><br>
    <input type="number" name="codigo" id="codigo" required min="1"><br><br>

    <button type="submit">Excluir</button>
    <a href="index.jsp">Voltar</a>
</form>

</body>
</html>
