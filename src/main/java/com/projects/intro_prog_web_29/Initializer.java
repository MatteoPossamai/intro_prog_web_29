package com.projects.intro_prog_web_29;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.sql.*;

@WebServlet(name = "initializer", value = "/initializer", loadOnStartup = 1)
public class Initializer extends HttpServlet {

	@Override
	public void init() {
		Connection con;
		try {
			// Connect to the database, and check if the users table exists
			Class.forName("org.apache.derby.jdbc.ClientDriver");
			con = DriverManager.getConnection("jdbc:derby://localhost:1527/Mydb");

			// Check with a SQL query if the table of user exists, otherwise create it
			String query = "SELECT COUNT(*) FROM SYS.SYSTABLES WHERE TABLENAME = 'USERS'";
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery(query);

			// If the table doesn't exist, create it
			if (res.next() && res.getInt(1) == 0) {
				System.out.println("Creating table users");
				query = "CREATE TABLE users (\n" +
						"    username VARCHAR(255) PRIMARY KEY,\n" +
						"    nome VARCHAR(255),\n" +
						"    cognome VARCHAR(255),\n" +
						"    email VARCHAR(255),\n" +
						"    password VARCHAR(255),\n" +
						"    data_nascita DATE,\n" +
						"    telefono VARCHAR(255),\n" +
						"    userType VARCHAR(255)\n" +
						// lista dell attività a cui è iscritto (?)
						")";
				stmt.executeUpdate(query);

				// Insert the admin user
				query = "INSERT INTO users VALUES ('admin', '', '', 'admin@admin.com', '29Adm1n!', '2002-10-20 12:00:00', '000 0000 000',  'ADMIN')," +
						"('simpa1', 'Simpa', 'Simpatico', 'simpa@simpa.com', 'Vimd123!', '2002-10-20 12:00:00', '000 0000 000',  'SIMPA')," +
						"('ader1', 'Ader', 'Aderente', 'ader@ader.com', 'Vimd123!', '2002-10-20 12:00:00', '000 0000 000',  'ADERE')";
				stmt.executeUpdate(query);
			}

			// Check with a SQL query if the table of visits exists, otherwise create it
			query = "SELECT COUNT(*) FROM SYS.SYSTABLES WHERE TABLENAME = 'VISIT_COUNTER'";
			stmt = con.createStatement();
			res = stmt.executeQuery(query);

			// If the table doesn't exist, create it
			if (res.next() && res.getInt(1) == 0) {
				System.out.println("Creating table visit_counter");
				query = "	CREATE TABLE visit_counter (\n" +
						"    	pageName VARCHAR(255) PRIMARY KEY,\n" +
						"    	visits INTEGER\n)";
				stmt.executeUpdate(query);
				query = "INSERT INTO visit_counter VALUES ('Home', 0), ('Login', 0), ('Registrazione', 0), "+
						"('About', 0), ('Contatti', 0), ('Registrazione Confermata', 0), ('Simpatizzante', 0), ('Aderente', 0), "+
						"('Amministratore', 0), ('Attivita', 0), ('Mensa', 0), ('Edilizia', 0), ('Corsi di formazione', 0), "+
						"('Invio confermato', 0)";
				stmt.executeUpdate(query);
			}

			query = "SELECT COUNT(*) FROM SYS.SYSTABLES WHERE TABLENAME = 'DONATIONS'";
			res = stmt.executeQuery(query);
			// If the table doesn't exist, create it
			if (res.next() && res.getInt(1) == 0) {
				System.out.println("Creating table donations");
				query = "CREATE TABLE donations (\n" +
						"    date DATE,\n" +
						"    amount FLOAT,\n" +
						"    username VARCHAR(255)\n" +
						")";
				stmt.executeUpdate(query);
				// create a query thet inserts at 2 random donations per month in 2023 up to
				// june, put 0 for the other months
				query = "INSERT INTO donations VALUES " +
						"('2023-01-01', 100, ''), ('2023-01-21', 10, '')," + 		// gennaio
						"('2023-02-02', 25.4, ''), ('2023-02-22', 185.4, '')," + 	// febbraio
						"('2023-03-03', 12.5, ''), ('2023-03-23', 107.1, '')," + 	// marzo
						"('2023-04-04', 145.45, ''), ('2023-04-24', 15.6, '')," + 	// aprile
						"('2023-05-05', 243.1, ''), ('2023-05-25', 3.90, '')," + 	// maggio
						"('2023-06-06', 123.4, ''), ('2023-06-26', 82.4, '')," + 	// giugno
						"('2023-07-07', 0, ''), " + 								// luglio
						"('2023-08-08', 0, ''), " + 								// agosto
						"('2023-09-09', 0, ''), " + 								// settembre
						"('2023-10-10', 0, ''), " + 								// ottobre
						"('2023-11-11', 0, ''), " + 								// novembre
						"('2023-12-12', 0, '')"; 									// dicembre
				stmt.executeUpdate(query);
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
