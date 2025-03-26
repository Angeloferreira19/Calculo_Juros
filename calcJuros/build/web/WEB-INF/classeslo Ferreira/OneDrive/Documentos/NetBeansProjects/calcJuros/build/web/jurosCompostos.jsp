<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tabela de Valor Futuro Acumulado</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <%@include file="WEB-INF/jspf/menu.jspf" %>
    <h1>Tabela de Juros Compostos</h1>

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

                // Exibe a tabela de valores futuros acumulados
                out.println("<table>");
                out.println("<tr><th>Mês</th><th>Valor Futuro</th></tr>");

                for (int mes = 1; mes <= meses; mes++) {
                    double valorFuturo = montante * Math.pow(1 + taxa, mes);
                    out.println("<tr><td>" + mes + "</td><td>R$ " + String.format("%.2f", valorFuturo) + "</td></tr>");
                }

                out.println("</table>");
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