<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String ingredients = request.getParameter("ingredients");
    String instructions = request.getParameter("instructions");

    String url = "jdbc:mysql://localhost:3306/recipedb";
    String user = "root";
    String pass = "root@123";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, pass);
        PreparedStatement ps = con.prepareStatement("INSERT INTO recipe (id, name, ingredients, instructions) VALUES (?, ?, ?, ?)");
        ps.setInt(1, Integer.parseInt(id));
        ps.setString(2, name);
        ps.setString(3, ingredients);
        ps.setString(4, instructions);
        ps.executeUpdate();
        response.sendRedirect("View.jsp");
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
