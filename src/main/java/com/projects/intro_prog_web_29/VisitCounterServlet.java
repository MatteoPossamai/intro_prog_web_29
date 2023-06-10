package com.projects.intro_prog_web_29;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "VisitCounterServlet", urlPatterns = { "/visits" })
public class VisitCounterServlet extends HttpServlet {
  String dbURL = "jdbc:derby://localhost:1527/Mydb";
  String user = "App";
  String password = "pw";
  Connection con;
  VisitCounter visitCounter = new VisitCounter();

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
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    
    // Gets the name of the page from the request body
    String pageName = request.getParameter("body");

    try {
      // Check if the page row already exists
      String query = "SELECT visits FROM visit_counter WHERE pageName = '" + pageName + "'";
      Statement stmt = con.createStatement();
      ResultSet res = stmt.executeQuery(query);

      // if the page row does not exist, create it
      if (!res.next()) {
        visitCounter.count = 0;
        query = "INSERT INTO visit_counter (pageName, visits) VALUES ('" + pageName + "', 0 )";
        stmt.executeUpdate(query);
        
      } else {
        // get the current count
        visitCounter.count = res.getInt(1);
      }
      // increments counter
      visitCounter.increase();

      // stampa di controllo per me
      //System.out.println("visite " + pageName + ": " + visitCounter.count);

      // saves the new count in the database
      query = "UPDATE visit_counter SET visits = " + visitCounter.count + " WHERE pageName = " + "'" + pageName + "'";
      stmt.executeUpdate(query);

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
    //System.out.println("destroy---------------------------------------------------------------------");
  }

}
