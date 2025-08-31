<%@ page import="java.sql.*,java.util.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/recipedb";
    String user = "root";   // change if needed
    String pass = "root@123";   // change if needed

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, pass);
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM recipe");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Recipes</title>
    <style>
        body {
            font-family: "Poppins", "Segoe UI", sans-serif;
            background: linear-gradient(135deg, #eef2ff, #e0f2fe);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 8px 18px rgba(0,0,0,0.15);
            animation: fadeIn 0.8s ease-in-out;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2563eb;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background: #2563eb;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 14px;
        }

        tr:nth-child(even) {
            background: #f9fafb;
        }

        tr:hover {
            background: #e0f2fe;
            transition: 0.3s;
        }

        .btn {
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 13px;
            font-weight: 600;
            transition: transform 0.2s, background 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .btn-update {
            background: #22c55e;
            color: white;
        }

        .btn-update:hover {
            background: #15803d;
            transform: translateY(-2px);
        }

        .btn-delete {
            background: #ef4444;
            color: white;
        }

        .btn-delete:hover {
            background: #b91c1c;
            transform: translateY(-2px);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>All Recipes</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Ingredients</th>
                <th>Instructions</th>
                <th>Actions</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("ingredients") %></td>
                <td><%= rs.getString("instructions") %></td>
                <td>
                    <a href="up.jsp?id=<%= rs.getInt("id") %>" class="btn btn-update">Update</a>
                    <a href="del.jsp?id=<%= rs.getInt("id") %>" class="btn btn-delete">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <div class="back-link">
            <a href="Register1.html">Add New Recipe</a>
        </div>
    </div>
</body>
</html>
<%
    } catch (Exception e) {
        out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    }
%>
