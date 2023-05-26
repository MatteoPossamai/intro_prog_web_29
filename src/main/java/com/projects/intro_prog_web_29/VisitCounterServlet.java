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

  public void init() {
    // codice per prendere i dati del counter per ogni pagina dal database derby
    // e metterli in visitCounter

    /*
     * if (esiste gia roba nel database derby) {
     * try {
     * //prendere dal db
     * } catch (IOException e) {
     * }
     * 
     * } else {
     *  visitCounter = new VisitCounter();
     * }
     */
    //fatto dal nulla ogni volta solo finchè non abbiamo db
    //visitCounter = new VisitCounter();
   /* Connection con = null;
    String createTableCoffee = "CREATE TABLE visitCounter " + "(PageName VARCHAR(32), " + "visits INTEGER)";
    Statement stmt = con.createStatement();
    stmt.executeUpdate(createTableCoffee);
*/
    System.out.println("Entro in init******************************************************************************************************************");
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    String pageName = request.getParameter("pageName");
    Connection con = null;
    try{
      // Connect to derby database, to check if the user exists
      Class.forName("org.apache.derby.jdbc.ClientDriver");
      con = DriverManager.getConnection("jdbc:derby://localhost:1527/rubbish");
      //Check if the Visits table exists in db

      // Else creates it
      String createVisitsTable = "CREATE TABLE visitCounter " + "(PageName VARCHAR(32), " + "visits INTEGER)";
      Statement stmt = con.createStatement();
      stmt.executeUpdate(createVisitsTable);
      // Check if the username already exists
      String query = "SELECT visits FROM visitCounter WHERE PageName = '" + pageName + "'";
      ResultSet res = stmt.executeQuery(query);
      visitCounter.count=res.getInt("visit");
      if( ! res.next() ){
        visitCounter.count=0;
        query = "INSERT INTO visitCounter VALUES ('" + pageName + "', '" + visitCounter.count + "' )";
        stmt.executeUpdate(query);
      }
    }catch (SQLException | ClassNotFoundException e){
      e.printStackTrace();
    }
    PrintWriter out = response.getWriter();
    out.println("Entro in doGet*********************************************************************************************************************");
    System.out.println("Entro in doGet*********************************************************************************************************************");
  }

  public void destroy() {
    // salva il nuovo dato nel db
    System.out.println("Entro in destroy*******************************************************************************************************************************");
  }
}
