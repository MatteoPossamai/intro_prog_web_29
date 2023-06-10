package com.projects.intro_prog_web_29;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// import java.io.File;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
// import java.io.FileWriter;
// import org.json.simple.JSONObject;

@WebServlet(name = "Simpatizzante", urlPatterns = { "/simpatizzante" })
public class SimpatizzanteServlet extends HttpServlet {
  String dbURL = "jdbc:derby://localhost:1527/Mydb";
  String user = "App";
  String password = "pw";
  Connection con;
  String username = "";
  Simpatizzante simpa;

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
    response.setContentType("text/html;charset=UTF-8");

    try {
      // get username from session
      username = (String) request.getSession().getAttribute("username");
      // get the user info from the database
      String query = "SELECT * FROM users WHERE username='" + username + "'";
      Statement stmt = con.createStatement();
      ResultSet res = stmt.executeQuery(query);
     
      // set the user info
     simpa = new Simpatizzante(res.getString("nome"), res.getString("cognome"), res.getString("data_nascita"), res.getString("email"), res.getString("telefono"),
          res.getString("username"), res.getString("password"));


      request.setAttribute("user_nome", simpa.name);
      request.setAttribute("user_cognome", simpa.surname);
      request.setAttribute("user_data_nascita", simpa.birthdate);
      request.setAttribute("user_email", simpa.email);
      request.setAttribute("user_telefono", simpa.phone);
      request.setAttribute("user_username", simpa.username);
      request.setAttribute("user_password", simpa.password);
      
      // request.setAttribute("totalVisits", totalVisits);
      RequestDispatcher rd = request.getRequestDispatcher("/simpatizzante.jsp");
      rd.forward(request, response);

    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public void destroy() {
    try {
      con.close();
    } catch (SQLException ex) {
      ex.printStackTrace();
    }
    System.out.println("destroy---------------------------------------------------------------------");
  }

}
