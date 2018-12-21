package General;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
	String databaseName;
	MyConnection(){
		
	}
	MyConnection(String databaseName) throws SQLException{
		this.databaseName = databaseName;
	}
	Connection getMyConnection() {
	    String url = "jdbc:mysql://localhost:3306/";
	    String user = "3906";
	    String pass = "Pankaj@3906";
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Connection con=null;
		try {
			con = DriverManager.getConnection(url+databaseName,user,pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
