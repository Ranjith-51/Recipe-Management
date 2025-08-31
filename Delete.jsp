<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String url = "jdbc:mysql://localhost:3306/recipedb";
    String user = "root";
    String pass = "root@123";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, pass);
        PreparedStatement ps = con.prepareStatement("DELETE FROM recipe WHERE id=?");
        ps.setInt(1, Integer.parseInt(id));
        ps.executeUpdate();
        response.sendRedirect("View.jsp");
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
