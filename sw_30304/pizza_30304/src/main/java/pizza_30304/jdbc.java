package pizza_30304;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class jdbc {
    public static Connection getConnection() throws Exception {
        // JDBC 드라이버 로드
        Class.forName("oracle.jdbc.OracleDriver");
        
        // 데이터베이스 연결
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
        return con;
    }
}
