package com.projects.intro_prog_web_29;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
@WebServlet(name = "VisitCounterServlet", urlPatterns = { "/visits" })
public class VisitCounterServlet extends HttpServlet {
  VisitCounter visitCounter;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    String pageName = request.getParameter("pageName");
    Connection con = null;
    try{
      // Connect to derby database, to check if the user exists
      Class.forName("org.apache.derby.jdbc.ClientDriver");
      con = DriverManager.getConnection("jdbc:derby://localhost:1527/Mydb");

      // Check if the username already exists
      String query = "SELECT visits FROM visit_counter WHERE pageName = '" + pageName + "'";
      Statement stmt = con.createStatement();
      ResultSet res = stmt.executeQuery(query);
      visitCounter.count=res.getInt("visits"); // TODO aggiustare, dà errore runtime
      if( ! res.next() ){
        visitCounter.count=0;
        query = "INSERT INTO visit_counter VALUES ('" + pageName + "', '" + visitCounter.count + "' )";
        stmt.executeUpdate(query);
      }
    }catch (SQLException | ClassNotFoundException e){
      e.printStackTrace();
    }
    // TODO incremento counter
    //
    // TODO salvare dato nel db
    //
    PrintWriter out = response.getWriter();
    out.println("Entro in doGet*********************************************************************************************************************");
    System.out.println("Entro in doGet*********************************************************************************************************************");
  }
}
