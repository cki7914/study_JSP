package fileupload;

import java.util.List;
import java.util.Vector;

import common.DBConnPool;

public class MyfileDAO extends DBConnPool {
	public int insertFile(MyfileDTO dto) {
		int applyResult = 0;
		
		try {
			String query = "INSERT INTO MYFILE(IDX, NAME, TITLE, CATE, OFILE, SFILE) "
						 + "VALUES(SEQ_BOARD_NUM.NEXTVAL, ?, ?, ?, ?, ?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			applyResult = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("INSERT중 예외 발생");
			e.printStackTrace();
		}
		
		return applyResult;
	}
	
	// 목록 표시하기
	public List<MyfileDTO> myFileList() {
		List<MyfileDTO> fileList = new Vector<>();
		
		try {
			String query = "SELECT * FROM MYFILE ORDER BY IDX DESC";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MyfileDTO dto = new MyfileDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getString("cate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getString("postdate"));
				
				fileList.add(dto);
			}
		} catch(Exception e) {
			System.out.println("목록 표시중 예외 발생");
			e.printStackTrace();
		}
		
		return fileList;
	}
} // class
