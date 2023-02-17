package Context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
	public static Connection getConnection()
	{
		Connection c = null;
		try {
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			String url = "jdbc:sqlserver://localhost:1433;DatabaseName=FurniData;encrypt=true;trustServerCertificate=true";
			String username = "sa";
			String password = "123";
			
			c = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return c;
	}
	
	public static void disConnect(Connection c) {
		try
		{
			if(c != null) {
				c.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
