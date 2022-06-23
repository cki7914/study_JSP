package model1;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	// 게시글 개수 세기
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0; // 결과값 저장
		
		String query = "SELECT COUNT(*) FROM BOARD";
		if(map.get("searchWord") != null)
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch(Exception e) {
			System.out.println("게시물의 개수를 계산하는 중에 예외가 발생하였음");
			e.printStackTrace();
		}
		
		return totalCount;
	} // selectCount()
	
	// 게시글 목록 반환
	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		String query = "SELECT * FROM BOARD";
		if(map.get("searchWord") != null)
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
		query += " ORDER BY NUM DESC";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num")); // 번호
				dto.setTitle(rs.getString("title")); // 제목
				dto.setContent(rs.getString("content")); // 내용
				dto.setPostdate(rs.getDate("postdate")); // 작성일
				dto.setId(rs.getString("id")); // 작성자 아이디
				dto.setVisitCount(rs.getString("visitcount")); // 조회수
				
				bbs.add(dto); // 결과를 List에 저장
			}
		} catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	} // selectList()
	
	// 게시글 데이터를 받아 DB에 추가
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO BOARD(NUM, TITLE, CONTENT, ID, VISITCOUNT) "
						 + "VALUES(SEQ_BOARD_NUM.NEXTVAL, ?, ?, ?, 0)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
		}
		
		return result;
	} // insertWrite()
	
	// 게시글 확인하기
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		
		try {
			String query = "SELECT B.*, M.NAME "
						 + "FROM BOARD B INNER JOIN MEMBER M "
						 + "ON B.ID = M.ID "
						 + "WHERE NUM = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitCount(rs.getString("visitCount"));
				dto.setName(rs.getString("name"));
			}
		} catch(Exception e) {
			System.out.println("게시글 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	} // selectView()
	
	// 조회수 증가 메서드
	public void updateVisitCount(String num) {
		try {
			String query = "UPDATE BOARD "
						 + "SET VISITCOUNT = VISITCOUNT + 1 "
						 + "WHERE NUM = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		} catch(Exception e) {
			System.out.println("조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
}
