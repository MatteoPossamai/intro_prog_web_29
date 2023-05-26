package com.projects.intro_prog_web_29;

        import javax.servlet.ServletException;
        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;
        import java.sql.*;

@WebServlet(name = "delete", value = "/delete")
public class DeleteFromPlatform extends HttpServlet {

    String dbURL = "jdbc:derby://localhost:1527/Mydb";
    String user = "App";
    String password = "pw";
    Connection con;

    public void init() {
        // Initialize the database connection for the entire servlet
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con = DriverManager.getConnection(dbURL, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void destroy() {
        try {
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the username from the user that is currently logged in the session
        String username = (String) request.getSession().getAttribute("username");

        try{
            // Delete the user from the database
            PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE username = ?");
            ps.setString(1, username);
            ps.executeUpdate();

            // Invalidate the session
            request.getSession(false).invalidate();

            // Redirect to the index page
            request.getRequestDispatcher("/index.jsp").forward(request, response);

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

}
