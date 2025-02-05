<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title> Simple Calculator</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="calculator">
        <h2>myCal</h2>
        <form method="post">
            <input type="number" name="num1" placeholder="Enter first number" required>
            <input type="number" name="num2" placeholder="Enter second number" required>
            <select name="operation">
                <option value="add">Addition (+)</option>
                <option value="subtract">Subtraction (-)</option>
                <option value="multiply">Multiplication (*)</option>
                <option value="divide">Division (/)</option>
            </select>
            <input type="submit" value="Calculate">
        </form>

        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                double num1 = Double.parseDouble(request.getParameter("num1"));
                double num2 = Double.parseDouble(request.getParameter("num2"));
                String operation = request.getParameter("operation");
                double result = 0;

                switch (operation) {
                    case "add":
                        result = num1 + num2;
                        break;
                    case "subtract":
                        result = num1 - num2;
                        break;
                    case "multiply":
                        result = num1 * num2;
                        break;
                    case "divide":
                        if (num2 != 0) {
                            result = num1 / num2;
                        } else {
                            out.println("<div class='error'>Error: Division by zero!</div>");
                            return;
                        }
                        break;
                }

                out.println("<div class='result'>Result: " + result + "</div>");
            }
        %>
    </div>
</body>
</html>