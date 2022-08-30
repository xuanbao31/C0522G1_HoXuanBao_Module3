package reponsitory;

import com.mysql.cj.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private static final String URL = "jdbc:mysql://localhost:3306/demo";
    private static final String USER = "root";
    private static final String PASS = "12345678";

    public static Connection getConnectionDB() {
        Connection connection = null;
      try {
Class.forName("com.mysql.cj.jdbc.Driver");
connection= DriverManager.getConnection(URL,USER,PASS);
      } catch (ClassNotFoundException e) {
          e.printStackTrace();
      } catch (SQLException e) {
          e.printStackTrace();
      }
      return connection;
    }


}