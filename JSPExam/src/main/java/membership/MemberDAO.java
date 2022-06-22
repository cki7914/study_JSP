package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	// DB 연결과 CRUD에 해당하는 SQL쿼리문을 실행하고 그 결과를 DTO 객체에 담아서 반환하는 작업 수행
	
	// 데이터베이스로의 연결이 완료된 MemberDAO 객체를 생성
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	// 작성한 아이디, 패스워드와 일치하는 회원 정보를 반환
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		
		try {
			String query = "SELECT * FROM MEMBER WHERE ID=? AND PASS=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString("regidate"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	} // getMemberDTO()
} // class
