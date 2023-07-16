package hrd01.DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class ConnectionDB {
public static Connection getConnection() {
	Connection conn = null;
	try {
		Class.forName("org.gjt.mm.mysql.Driver");
	} catch (ClassNotFoundException e) {
		System.out.println("클래스 로드 문제");
	}
	try {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:포트번호/아이디","아이디","비밀번호");
	} catch (SQLException e) {
		System.out.println("db 접속 문제");
	}
	return conn;
}
public static void closeAll(Connection conn,PreparedStatement pstmt,ResultSet rs) throws Exception {
	if(conn!=null) {conn.close();}
	if(pstmt!=null) {pstmt.close();}
	if(rs!=null) {rs.close();}
}

}
