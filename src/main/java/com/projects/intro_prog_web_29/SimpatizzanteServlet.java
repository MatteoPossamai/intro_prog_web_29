package com.projects.intro_prog_web_29;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

// Servlet to handle the simpatizzante.jsp page
@WebServlet(name = "Simpatizzante", urlPatterns = { "/simpatizzante" })
public class SimpatizzanteServlet extends HttpServlet {
  // data to conect to the database
  String dbURL = "jdbc:derby://localhost:1527/Mydb";
  String user = "App";
  String password = "pw";
  Connection con;
  // user info
  String username = "";
  Simpatizzante simpa;
  // activities
  Activity activity1 = new Activity();
  Activity activity2 = new Activity();
  Activity activity3 = new Activity();

  public void init() {
    // Initialize the database connection for the entire servlet
    try {
      Class.forName("org.apache.derby.jdbc.ClientDriver");
      con = DriverManager.getConnection(dbURL, user, password);
    } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
    }
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // response.setContentType("text/html;charset=UTF-8");
    String action = request.getParameter("action");
    try {
      // get username from session
      username = (String) request.getSession().getAttribute("username");
      String query;
      Statement stmt = con.createStatement();
      ResultSet res;
      // if the action is null, it means that the user is accessing the general page
      if (action == null) {
        // get the user info from the database
        query = "SELECT * FROM users WHERE username='" + username + "'";
        stmt = this.con.createStatement();
        res = stmt.executeQuery(query);
        // set the user info
        if (res.next()) {
          System.out.println(res.getString("nome"));

          simpa = new Simpatizzante(res.getString("nome"), res.getString("cognome"), res.getString("data_nascita"),
              res.getString("email"), res.getString("telefono"),
              res.getString("username"), res.getString("password"));
          request.setAttribute("user_nome", simpa.name);
          request.setAttribute("user_cognome", simpa.surname);
          request.setAttribute("user_data_nascita", simpa.birthdate);
          request.setAttribute("user_email", simpa.email);
          request.setAttribute("user_telefono", simpa.phone);
          request.setAttribute("user_username", simpa.username);
          request.setAttribute("user_password", simpa.password);
        }
        // gets activity images and titles
        activity1.setTitle("Mensa");
        activity1.setImageSource("images/act-1.jpg");
        activity2.setTitle("Edilizia");
        activity2.setImageSource("images/act-2.jpeg");
        activity3.setTitle("Corsi di formazione");
        activity3.setImageSource("images/act-3.jpeg");

        // set the user info as request attributes
        request.setAttribute("activity1", activity1);
        request.setAttribute("activity2", activity2);
        request.setAttribute("activity3", activity3);

        // forward the request to the simpatizzante.jsp page
        RequestDispatcher rd = request.getRequestDispatcher("/simpatizzante.jsp");
        rd.forward(request, response);
        // if the action is "delete", it means that the user wants to delete their
        // profile
      } else if (action.equals("delete")) {
        // delete the user with username from database
        query = "DELETE FROM users WHERE username='" + username + "'";
        stmt.executeUpdate(query);
        // if the user was deleted successfully, then logout
        request.getRequestDispatcher("/logout").forward(request, response);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public void destroy() {
    // close the database connection for the entire servlet
    try {
      con.close();
    } catch (SQLException ex) {
      ex.printStackTrace();
    }
  }

}
