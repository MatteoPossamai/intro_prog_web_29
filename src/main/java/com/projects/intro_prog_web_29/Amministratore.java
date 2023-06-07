package com.projects.intro_prog_web_29;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "Amministratore", urlPatterns = { "/admin" })
public class Amministratore extends HttpServlet {
  String dbURL = "jdbc:derby://localhost:1527/Mydb";
  String user = "App";
  String password = "pw";
  Connection con;
  ArrayList<String> simpatizzanti;
  ArrayList<String> aderenti;
  float[] donations = new float[12];
  Map<String, Integer> visits = new HashMap<String, Integer>();
  int totalVisits = 0;

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
      simpatizzanti = new ArrayList<String>();
      aderenti = new ArrayList<String>();
      while (res.next()) {
        if (res.getString(2).equals("SIMPA")) {
          //simpatizzanti[simpa-1]=
          simpatizzanti.add(res.getString(1));
        } else if (res.getString(2).equals("ADERE")) {
          aderenti.add(res.getString(1));
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

      query = "SELECT * FROM visit_counter ";
      stmt = con.createStatement();
      res = stmt.executeQuery(query);
      while (res.next()) {
        visits.put(res.getString(1), res.getInt(2));
        totalVisits += res.getInt(2);
      }

      // stampa di controllo per me -------------------------
      System.out.println("utenti: ");
      for (String user : simpatizzanti) {
        System.out.println("° " + user);
      }
      for (String user : aderenti) {
        System.out.println("° " + user);
      }
      // print all donation by month
      System.out.println("donazioni: ");  
      for (float donation : donations) {
        System.out.println("° " + donation);
      }

      System.out.println("visite: ");
      for (Map.Entry<String, Integer> entry : visits.entrySet()) {
        System.out.println("° " + entry.getKey() + " " + entry.getValue());
      }
      System.out.println("totale visite: " + totalVisits);
      
      // -----------------------------------------------------
      request.setAttribute("simpatizzanti", simpatizzanti);
      request.setAttribute("aderenti", aderenti);
      request.setAttribute("donations", donations);
      request.setAttribute("visitsPages", visits);
      request.setAttribute("totalVisits", totalVisits);
      RequestDispatcher rd = request.getRequestDispatcher("/amministratore.jsp");
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
