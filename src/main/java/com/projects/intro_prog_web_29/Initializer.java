package com.projects.intro_prog_web_29;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.sql.*;

@WebServlet(name = "initializer", value = "/initializer", loadOnStartup = 1)
public class Initializer extends HttpServlet {

    @Override
    public void init() {
        Connection con;
        try{
            // Connect to the database, and check if the users table exists
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/rubbish");

            // Check with a SQL query if the table of user exists, otherwise create it
            String query = "SELECT COUNT(*) FROM SYS.SYSTABLES WHERE TABLENAME = 'USERS'";
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(query);

            // If the table doesn't exist, create it
            if (res.next() && res.getInt(1) == 0) {
                query = "CREATE TABLE users (\n" +
                        "    username VARCHAR(255) PRIMARY KEY,\n" +
                        "    password VARCHAR(255),\n" +
                        "    userType VARCHAR(255)\n" +
                        ")";
                stmt.executeUpdate(query);

                // Insert the admin user
                query = "INSERT INTO users VALUES ('admin', '29Adm1n!', 'ADMIN')";
                stmt.executeUpdate(query);
            }


        }catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
    }
}
