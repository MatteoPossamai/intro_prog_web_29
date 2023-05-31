package com.projects.intro_prog_web_29;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.HashSet;
import java.util.Set;

@WebServlet(name = "Amministratore", urlPatterns = { "/admin" })
public class Amministratore extends HttpServlet {
  String dbURL = "jdbc:derby://localhost:1527/Mydb";
  String user = "App";
  String password = "pw";
  Connection con;
  Set<User> users = new HashSet<User>();
  float[] donations = new float[12];

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
      // Check if there are users in the database
      String query = "SELECT username, userType FROM users WHERE userType!='ADMIN'";
      Statement stmt = con.createStatement();
      ResultSet res = stmt.executeQuery(query);

      while (res.next()) {
        String username = res.getString(1);
        if (res.getString(2).equals("SIMPA")) {
          Simpatizzante user = new Simpatizzante(username);
          users.add(user);
        } else if (res.getString(2).equals("ADERE")) {
          Aderente user = new Aderente(username);
          users.add(user);
        }
      }
      // gets donations from database and saves them by month
      query = "SELECT MONTH(date) AS month, SUM(amount) AS monthly_sum " +
          "FROM donations GROUP BY MONTH(date)" +
          "ORDER BY month";
      stmt = con.createStatement();
      res = stmt.executeQuery(query);
      int i = 0;
      while (res.next()) {
          donations[i] = res.getFloat(2);
          i++;

      }

      // stampa di controllo per me
      System.out.println("utenti: ");
      for (User user : users) {
        System.out.println("° " + user.username);
      }
      // print all donation by month
      System.out.println("donazioni: ");  
      for (float donation : donations) {
        System.out.println("° " + donation);
      }
      // ----------------------------------------
      RequestDispatcher rd = getServletContext().getRequestDispatcher("/amministratore.jsp");
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
