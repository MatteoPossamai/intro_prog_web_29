package com.projects.intro_prog_web_29;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.io.FileWriter;
import org.json.simple.JSONObject;

@WebServlet(name = "Amministratore", urlPatterns = { "/admin" })
public class Amministratore extends HttpServlet {
  String dbURL = "jdbc:derby://localhost:1527/Mydb";
  String user = "App";
  String password = "pw";
  Connection con;
  ArrayList<String> simpatizzanti; // to store simpatizzanti usernames
  ArrayList<String> aderenti; // to store aderenti usernames

  int totalVisits;
  // to store donations and visits
  JSONObject visits = new JSONObject();
  JSONObject donations = new JSONObject();

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
    // get the action from the request
    String action = request.getParameter("action");
    // initializes the action if it is null
    if (action==null){
      action="";
    }
    // declares variables for the database queries
    Statement stmt;
    String query;
    try {
      stmt = con.createStatement();
      // if the acion is reset, sets the visits for each page to 0
      if (action.equals("reset")) {
        query = "UPDATE visit_counter SET visits = 0";
        stmt.executeUpdate(query);
      }
      // Check if there are users in the database
      query = "SELECT username, userType FROM users WHERE userType!='ADMIN'";
      stmt = con.createStatement();
      ResultSet res = stmt.executeQuery(query);
      // initialize arraylists
      simpatizzanti = new ArrayList<String>();
      aderenti = new ArrayList<String>();

      // gets users from database and saves them by type
      while (res.next()) {
        if (res.getString(2).equals("SIMPA")) {
          simpatizzanti.add(res.getString(1));
        } else if (res.getString(2).equals("ADERE")) {
          aderenti.add(res.getString(1));
        }
      }

      // gets donations from database and saves them by month in a json file
      query = "SELECT MONTH(date) AS month, SUM(amount) AS monthly_sum " +
          "FROM donations GROUP BY MONTH(date)" +
          "ORDER BY month";
      stmt = con.createStatement();
      res = stmt.executeQuery(query);
      // saves donations in the json file
      while (res.next()) {
        donations.put(res.getInt(1), res.getFloat(2));
      }
      String donationsString = donations.toJSONString();
      String contextPath = getServletContext().getRealPath("/");
      contextPath = contextPath.replace("\\", "/");
      String donationsPath = contextPath + "donations.json";
      File donationsFile = new File(donationsPath);
      if (!donationsFile.exists()) {
        donationsFile.createNewFile();
      }
      FileWriter donationsWriter = new FileWriter(donationsFile);
      donationsWriter.write(donationsString);
      donationsWriter.close();

      // gets visits from database and saves them by page and in total in a json file
      query = "SELECT * FROM visit_counter ";
      stmt = con.createStatement();
      res = stmt.executeQuery(query);
      String page;
      int count;
      totalVisits = 0;
      while (res.next()) {
        page = res.getString(1);
        count = res.getInt(2);
        if (page.equals("Amministratore")) {
          count++;
        }
        visits.put(page, count);
        totalVisits += count;
      }
      visits.put("TotalVisits", totalVisits);
      String visitsString = visits.toJSONString();
      String visitsPath = contextPath + "visits.json";
      FileWriter visitsWriter = new FileWriter(visitsPath);
      visitsWriter.write(visitsString);
      visitsWriter.close();

      // sets attributes for the jsp page
      request.setAttribute("simpatizzanti", simpatizzanti);
      request.setAttribute("aderenti", aderenti);
      request.setAttribute("donationsPath", donationsPath);
      request.setAttribute("visitsPath", visitsPath);
      RequestDispatcher rd = request.getRequestDispatcher("/amministratore.jsp");
      rd.forward(request, response);

    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public void destroy() {
    try {
      //closes the connection to the database
      con.close();
    } catch (SQLException ex) {
      ex.printStackTrace();
    }
  }

}
