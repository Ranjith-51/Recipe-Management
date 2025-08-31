<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Recipe</title>
    <style>
        body { font-family:"Segoe UI"; background:linear-gradient(135deg,#fee2e2,#fecaca); margin:0; }
        .container { max-width:500px; background:#fff; margin:60px auto; padding:30px; text-align:center; border-radius:12px; box-shadow:0 6px 15px rgba(0,0,0,0.2); }
        h2 { color:#dc2626; margin-bottom:20px; }
        p { margin:15px 0; font-size:16px; }
        .btn { padding:10px 20px; border:none; border-radius:6px; font-size:15px; cursor:pointer; transition:0.3s; margin:5px; }
        .btn-delete { background:#dc2626; color:white; }
        .btn-delete:hover { background:#b91c1c; }
        .btn-cancel { background:#9ca3af; color:white; }
        .btn-cancel:hover { background:#4b5563; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete Recipe</h2>
        <p>Are you sure you want to delete this recipe?</p>
        <form action="Delete.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <button type="submit" class="btn btn-delete">Yes, Delete</button>
            <a href="View.jsp" class="btn btn-cancel">Cancel</a>
        </form>
    </div>
</body>
</html>
