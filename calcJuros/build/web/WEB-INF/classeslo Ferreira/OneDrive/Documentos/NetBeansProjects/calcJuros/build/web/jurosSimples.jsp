<%-- 
<%-- 
    Document   : jurosSimples
    Created on : 25 de mar. de 2025, 16:35:07
    Author     : Fatec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Juros Simples</h1>
         <%
        // Obtém os parâmetros do formulário
        String montanteStr = request.getParameter("montante");
        String taxaStr = request.getParameter("taxa");
        String mesesStr = request.getParameter("meses");

        // Verifica se os parâmetros foram fornecidos
        if (montanteStr != null && taxaStr != null && mesesStr != null) {
            try {
                // Converte os parâmetros para números
                double montante = Double.parseDouble(montanteStr);
                double taxa = Double.parseDouble(taxaStr) / 100; // Converte a taxa de porcentagem para decimal
                int meses = Integer.parseInt(mesesStr);

                // Calcula o valor futuro
                double valorFuturo = montante * Math.pow(1 + taxa, meses);

                // Exibe o resultado
                out.println("<p>Valor Futuro: R$ " + String.format("%.2f", valorFuturo) + "</p>");
            } catch (NumberFormatException e) {
                out.println("<p>Entrada inválida. Por favor, insira números válidos.</p>");
            }
        }
    %>

    <form method="get">
        <label for="montante">Montante Inicial:</label>
        <input type="text" name="montante" id="montante" required><br><br>

        <label for="taxa">Taxa de Juros (%):</label>
        <input type="text" name="taxa" id="taxa" required><br><br>

        <label for="meses">Número de Meses:</label>
        <input type="text" name="meses" id="meses" required><br><br>

        <input type="submit" value="Calcular">
    </form>
    </body>
</html>
