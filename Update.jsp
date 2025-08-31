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
        PreparedStatement ps = con.prepareStatement("UPDATE recipe SET name=?, ingredients=?, instructions=? WHERE id=?");
        ps.setString(1, name);
        ps.setString(2, ingredients);
        ps.setString(3, instructions);
        ps.setInt(4, Integer.parseInt(id));
        ps.executeUpdate();
        response.sendRedirect("View.jsp");
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
