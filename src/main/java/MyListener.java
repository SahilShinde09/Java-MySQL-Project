import jakarta.servlet.*;
import java.sql.*;

public class MyListener implements ServletContextListener {
	public void contextInitialized(ServletContextEvent event) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Drivers Load Success");
			Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/java1051", "root", "");
			System.out.println("Connection Success");
			
			// storing connection object as an attribute in ServletContext
			ServletContext ctx = event.getServletContext();
			ctx.setAttribute("mycon", con);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void contextDestroyed(ServletContextEvent arg0) {
	}
}
