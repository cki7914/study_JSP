package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection con; // DB와 연결을 담당
	public Statement stmt; // 인파라미터가 없는 정적 쿼리문을 담당
	public PreparedStatement psmt; // 인파라미터가 있는 동적 쿼리문을 담당
	public ResultSet rs; // SELECT 쿼리문의 결과를 저장
	
	// 1. 기본생성자
	public JDBConnect() {
		try {
			// forName() : new 키워드 대신 클래스명을 통해 직접 객체를 생성하여 메모리에 로드하는 메서드.
			// 인수로는 오라클 드라이버의 이름을 넣으면 됨
			Class.forName("oracle.jdbc.OracleDriver");
			
			// jdbc:oracle:thin: : 오라클 프로토콜
			// localhost : 호스트명(IP주소)
			// 1521 : 포트번호 / xe : sid(오라클 식별자)
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "green";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공! (1. 기본생성자)");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 2. 생성자(with 매개변수)
	public JDBConnect(String driver, String url, String id, String pw) {
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공! (2. 생성자 with 매개변수)");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 3. 생성자
	// ServletContext : servlet 구성에 필요한 Bean 설정을 가져옴
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("OracleDriver");
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pw = application.getInitParameter("OraclePw");
			
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공! (3. 생성자)");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 연결 해제
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			
			System.out.println("JDBC 자원 해제");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
