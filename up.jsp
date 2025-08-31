<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String url = "jdbc:mysql://localhost:3306/recipedb";
    String user = "root";   // change if needed
    String pass = "root@123";   // change if needed
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String name="", ingredients="", instructions="";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, pass);
        ps = con.prepareStatement("SELECT * FROM recipe WHERE id=?");
        ps.setInt(1, Integer.parseInt(id));
        rs = ps.executeQuery();
        if(rs.next()) {
            name = rs.getString("name");
            ingredients = rs.getString("ingredients");
            instructions = rs.getString("instructions");
        }
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Recipe</title>
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(135deg, #e0f2fe, #fef9c3);
            margin: 0;
        }
        .container {
            max-width: 500px;
            background: #fff;
            margin: 60px auto;
            padding: 25px 30px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
        }
        h2 { text-align:center; color:#16a34a; margin-bottom:20px; }
        label { font-weight:bold; display:block; margin:10px 0 5px; }
        input[type="text"], textarea {
            width:100%; padding:10px; border:1px solid #ddd; border-radius:6px;
            margin-bottom:15px; font-size:14px;
        }
        textarea { resize:vertical; }
        input[type="submit"] {
            background:#16a34a; color:white; border:none; padding:12px;
            width:100%; border-radius:8px; font-size:16px; cursor:pointer;
            transition:0.3s;
        }
        input[type="submit"]:hover { background:#15803d; }
        .link { text-align:center; margin-top:15px; }
        .link a { color:#2563eb; text-decoration:none; font-weight:bold; }
        .link a:hover { text-decoration:underline; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Recipe</h2>
        <form action="Update.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            
            <label for="name">Recipe Name:</label>
            <input type="text" name="name" value="<%= name %>" required>

            <label for="ingredients">Ingredients:</label>
            <textarea name="ingredients" rows="3" required><%= ingredients %></textarea>

            <label for="instructions">Instructions:</label>
            <textarea name="instructions" rows="4" required><%= instructions %></textarea>

            <input type="submit" value="Update Recipe">
        </form>
        <div class="link">
            <a href="View.jsp">Back to Recipes</a>
        </div>
    </div>
</body>
</html>
