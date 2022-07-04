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
	}
} // class
