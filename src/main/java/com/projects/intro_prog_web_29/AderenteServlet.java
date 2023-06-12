package com.projects.intro_prog_web_29;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;

@WebServlet(name = "Aderente", urlPatterns = { "/aderente" })
public class AderenteServlet extends HttpServlet {
  String dbURL = "jdbc:derby://localhost:1527/Mydb";
  String user = "App";
  String password = "pw";
  Connection con;
  String username = "";
  Aderente adere;
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
    String amount = request.getParameter("amount");
    try {
      // get username from session
      username = (String) request.getSession().getAttribute("username");
      System.out.println(username);
      String query;
      Statement stmt = con.createStatement();
      ResultSet res;

      if (action == null) {
        // get the user info from the database
        query = "SELECT * FROM users WHERE username='" + username + "'";
        stmt = this.con.createStatement();
        res = stmt.executeQuery(query);
        // set the user info
        if (res.next()) {
          System.out.println(res.getString("nome"));

          adere = new Aderente(res.getString("nome"), res.getString("cognome"), res.getString("data_nascita"),
              res.getString("email"), res.getString("telefono"),
              res.getString("username"), res.getString("password"));
          request.setAttribute("user_nome", adere.name);
          request.setAttribute("user_cognome", adere.surname);
          request.setAttribute("user_data_nascita", adere.birthdate);
          request.setAttribute("user_email", adere.email);
          request.setAttribute("user_telefono", adere.phone);
          request.setAttribute("user_username", adere.username);
          request.setAttribute("user_password", adere.password);
        } else {
          System.out.println("errorino");
        }
        if (amount != null) {
          // add the donation in the database
          query = "INSERT INTO donations (date, amount, username) VALUES ('" + LocalDate.now() + "', " + amount + ", '"
              + username + "')";
          int r = stmt.executeUpdate(query);
          System.out.println("donazione effettuata - status code: " + r);
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

        RequestDispatcher rd = request.getRequestDispatcher("/aderente.jsp");
        rd.forward(request, response);
      } else if (action.equals("delete")) {
        // delete the user with username from database
        query = "DELETE FROM users WHERE username='" + username + "'";
        res = stmt.executeQuery(query);
        if (res.next()) {
          // if the user was deleted successfully, then logout
          request.getRequestDispatcher("/logout").forward(request, response);
        }
      }

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
  }

}