package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
	public Connection con; // DB와 연결을 담당
	public Statement stmt; // 인파라미터가 없는 정적 쿼리문을 담당
	public PreparedStatement psmt; // 인파라미터가 있는 동적 쿼리문을 담당
	public ResultSet rs; // SELECT 쿼리문의 결과를 저장
	
	public DBConnPool() {
		try {
			// Context : 자바 네이밍 서비스(JNDI)에서 이름과 실제 객체를 연결해주는 개념
			// InitialContext() : Context를 다루기 위한 시작점
			Context initCtx = new InitialContext();
			
			// "java:comp/env"라는 이름을 인수로 Context객체를 얻음
			// "java:comp/env" : 현재 웹 어플리케이션의 루트 디렉토리
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			
			// "java:comp/env"에 위치한 dbcp_myoracle 자원을 가져옴
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");
			
			// 데이터소스를 통해 풀에 생성되어있는 연결객체를 얻어와서 맴버 변수에 저장
			con = source.getConnection();
			
			System.out.println("DB 커넥션 풀 연결 성공");
		} catch(Exception e) {
			System.out.println("DB 커넥션 풀 연결 실패");
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			
			System.out.println("DB 커넥션 풀 연결 해제");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
