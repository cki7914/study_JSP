package model2;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class MVCBoardDAO extends DBConnPool {
	public MVCBoardDAO() {
		super();
	}
	
	// 게시물의 개수
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		try {
			String query = "SELECT COUNT(*) FROM MVCBOARD ";
			if(map.get("searchWord") != null)
				query += "WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch(Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	} // selectCount()
	
	// 게시물 목록 반환(페이징 기능)
	public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {
		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();
		
		try {
			String query = "SELECT * FROM ("
						 + "SELECT TB.*, ROWNUM RNUM FROM ("
						 + "SELECT * FROM MVCBOARD ";
			if(map.get("searchWord") != null)
				query += "WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
				  query += "ORDER BY IDX DESC"
						 + ") TB"
						 + ") "
						 + "WHERE RNUM BETWEEN ? AND ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				dto.setIdx(rs.getString("IDX"));
				dto.setName(rs.getString("NAME"));
				dto.setTitle(rs.getString("TITLE"));
				dto.setContent(rs.getString("CONTENT"));
				dto.setPostdate(rs.getDate("POSTDATE"));
				dto.setOfile(rs.getString("OFILE"));
				dto.setSfile(rs.getString("SFILE"));
				dto.setDowncount(rs.getInt("DOWNCOUNT"));
				dto.setPass(rs.getString("PASS"));
				dto.setVisitcount(rs.getInt("VISITCOUNT"));
				
				board.add(dto);
			}
		} catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return board;
	} // selectListPage()
	
	// 게시글을 DB에 추가
	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;
		
		try	{
			String query = "INSERT INTO MVCBOARD(IDX, NAME, TITLE, CONTENT, OFILE, SFILE, PASS) "
						 + "VALUES(SEQ_BOARD_NUM.NEXTVAL, ?, ?, ?, ?, ?, ?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	} // insertWrite()
	
	public MVCBoardDTO selectView(String idx) {
		MVCBoardDTO dto = new MVCBoardDTO();
		
		try {
			String query = "SELECT * FROM MVCBOARD WHERE IDX=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
			}
		} catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	} // selectView()
	
	public void updateVisitcount(String idx) {
		try {
			String query = "UPDATE MVCBOARD "
						 + "SET VISITCOUNT = VISITCOUNT + 1 "
						 + "WHERE IDX = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
		} catch(Exception e) {
			System.out.println("게시글 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	} // updateVisitcount()
	
	public void downCountPlus(String idx) {
		try {
			String query = "UPDATE MVCBOARD "
						 + "SET DOWNCOUNT = DOWNCOUNT + 1 "
						 + "WHERE IDX = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("다운로드수 증가 중 예외 발생");
			e.printStackTrace();
		}
	} // downCountPlus()
	
	// 입력한 비밀번호가 게시글의 비밀번호와 동일한지 확인
	public boolean confirmPassword(String pass, String idx) {
		boolean isCorr = true;
		
		try {
			String query = "SELECT COUNT(*) "
						 + "FROM MVCBOARD "
						 + "WHERE PASS=? AND IDX=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			
			rs.next();
			
			if(rs.getInt(1) == 0)
				isCorr = false;
		} catch(Exception e) {
			isCorr = false;
			e.printStackTrace();
		}
		
		return isCorr;
	}
	
	// 지정된 일련번호의 게시물을 삭제
	public int deletePost(String idx) {
		int result = 0;
		
		try {
			String query = "DELETE FROM MVCBOARD WHERE IDX = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("게시글 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 게시글 데이터를 받아 DB에 저장된 내용을 수정
	public int updatePost(MVCBoardDTO dto) {
		int result = 0;
		
		try {
			String query = "UPDATE MVCBOARD "
						 + "SET TITLE=?, NAME=?, CONTENT=?, OFILE=?, SFILE=? "
						 + "WHERE IDX=? AND PASS=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getIdx());
			psmt.setString(7, dto.getPass());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("게시글 수정 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
} // class
