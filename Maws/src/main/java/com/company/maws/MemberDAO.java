package com.company.maws;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import com.company.maws.MemberVO;;

/*JDBC는 자바 프로그램과 관계형 데이터 원본에 대한 인터페이스이다. 
 * JDBC 라이브러리는 관계형 데이터 베이스에 접근하고, SQL 쿼리문을 실행하는 방법을 제공한다.
 * 
 * JDBC 라이브러리는 'java.sql' 패키지에 의해 구현되고, 이 패키지는 여러 종류의
 * 데이터 베이스에 접근할 수 있다. 'java.sql' 패키지는 단일 api를 제공하는 클래스와 
 * 인터페이스의 집합이다. */
public class MemberDAO {
	private static MemberDAO dao = new MemberDAO();

	public static MemberDAO getDAO() {
		return dao;
	}

	/**
	 * 필요한 property 선언
	 */
	Connection con;
	/*
	 * Connection 객체를 연결하는 것으로 DriverManager에 등록된 각 드라이버들을 GetConnection(String
	 * url) 메소드를 사용해서 식별한다. 이때 url 식별자와 같은 것을 찾아서 매핑한다. 찾지 못하면 no suitable error
	 * 가 발생.
	 */
	Statement st;
	/*
	 * sql 쿼리를 생성/실행하며 반환된 결과를 가져오게 할 작업영역을 제공한다. Statement 객체는 Connection 객체의
	 * createStatement() 메소드를 사용하여 생성된다.
	 */
	PreparedStatement ps;
	/*
	 * PreparedStatement = 프리컴파일 된 SQL 문을 나타내는 객체이다. SQL문은, 프리컴파일되어
	 * PreparedStatement 객체에 포함된다. 거기서 이 객체는 이 문장을 여러 차례 효율적으로 실행하는 목적으로 사용할 수
	 * 있다.
	 */
	ResultSet rs;
	/*
	 * executeQuery() 메소드는 결과로 ResultSet을 반환한다. 이 ResultSet으로부터 원하는 데이터를 추출하는
	 * 과정을 말한다. 데이터를 추출하는 방법은 ResultSet 에서 한 행씩 이동하면서 GetXxx()를 이용해서 원하는 필드 값을
	 * 추출하는데, 이때 rs.getString("name")혹은 rs.getString(1)을 사용.
	 */

	// MySQL
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/maws";

	/*
	 * //ORACLE String driverName="oracle.jdbc.driver.OracleDriver"; String url
	 * = " jdbc:oracle:thin:@localhost:1521:ORCL";
	 */
	String id = "jspbook"; // mysql 계정 아이디
	String pwd = "1234";// mysql 계정 비밀번호

	/**
	 * 로드와 연결을 위한 생성자 작성
	 */

	public MemberDAO() {

		try {
			// 로드
			Class.forName(driverName);
			/*
			 * 동적으로 클래스를 생성하는 것도 목적이지만, 동적으로 생성될 때 DriverManager에 해당 클래스를 등록시키는
			 * 목적도 있다. 그래서 DriverManager.getConnection 을 통해 등록된 클래스를 찾고,
			 * Connection을 리턴하는 것이다.
			 */

			// 연결
			con = DriverManager.getConnection(url, id, pwd);

		} catch (ClassNotFoundException e) {

			System.out.println(e + "=> 로드 실패");

		} catch (SQLException e) {

			System.out.println(e + "=> 연결 실패");
		}
	}// JDBC_memberDAO()

	/**
	 * DB닫기 기능 메소드 작성
	 */
	public void db_close() {

		try {

			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (st != null)
				st.close();

		} catch (SQLException e) {
			System.out.println(e + "=> 닫기 오류");
		}

	} // db_close

	// 기존의 회원가입여부를 판단
	public int userCheck(String uid, String pw) {
		con = null;
		ps = null;
		rs = null;
		String query = "select m_password from member where m_id =?";
		// http://stophyun.tistory.com/62 query문 정리
		int flag = -1; // 회원가입을 안했다고 가정.

		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url, id, pwd);
			ps = con.prepareStatement(query);
			// con은 액티브한 접속을 나타낸다.
			/*
			 * IN 파라미터치를 설정하는 설정 기능 메소드(setShort, setString 등 ) 입력 파라미터의 정의된 SQL
			 * 형과 호환이 있는 형태를 지정하지 않으면 안된다.
			 */
			ps.setString(1, uid);
			rs = ps.executeQuery(); // 쿼리 결과를 ResultSet을 얻기 위한 메소드로 주로 SELECT문에
									// 사용된다.

			if (rs.next()) {
				/*
				 * ResultSet의 속성 rs.first() -> 커서를 처음으로 rs.last() -> 커서를 제일 뒤로
				 * rs.next() -> 커서를 다음으로 rs.previous() -> 커서를 이전으로 rs.getRow()
				 * -> 현재 커서가 가리키고 있는 row 번호 rs.isFirst() -> 커서가 처음인지 rs.isLast()
				 * -> 커서가 마지막인지 rs.beforeFirst() -> 커서를 제일 뒤로(빈공간임)
				 * rs.afterLast()-> 커서를 제일 뒤로(빈 공간임)
				 */
				
				if (pw.equals(rs.getString("m_password"))) {
					flag = 1;// 아이디와 패스워드 일치
					
				} else {
					flag = 0; // 패스워드불일치
				}
			} else {
				flag = -1; // 아이디가 틀리거나 없다.
			}
		} catch (Exception e) {
			e.printStackTrace();
			/*
			 * 이 슬로우 기능 오브젝트 및 그 백 트레이스를 표준으로 에러 스트림에 출력한다. 출력의 선두행에는 이 오브젝트에 대한
			 * toString() 메소드의 결과가 포함된다. 나머지행은 이전에 fillInStackTrace() 메소드에 의해
			 * 기록된 데이터를 나타낸다.
			 */
		} finally {
			/*
			 * finally 블록은 필수 블록은 아니다. finally 블록이 사용되면 finally 블록의 내용은 예외 발생
			 * 유무나 예외 catch 유무와 상관 없이 무조건 수행된다. 따라서, 데이터베이스나 파일을 사용한 후 닫는 기능과 같이
			 * 항상 수행해야 할 필요가 있는 경우에 사용한다.
			 */
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}

		}

		return flag;
	}

	// id 중복
	public int idConfirm(String uid) {
		int flag = 1;
		con = null;
		ps = null;
		rs = null;
		String query = "Select m_id from member where m_id = ?";
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url, id, pwd);
			ps = con.prepareStatement(query);
			ps.setString(1, uid);
			rs = ps.executeQuery();

			if (rs.next()) {
				// 기존 사용자가 존재
				flag = -1;
			} else {
				// id 사용가능
				flag = 1;
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public int SchnumConfirm(String uid) {
		int flag = 1;
		con = null;
		ps = null;
		rs = null;
		String query = "Select m_school_num from member where m_school_num = ?";
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url, id, pwd);
			ps = con.prepareStatement(query);
			ps.setString(1, uid);
			rs = ps.executeQuery();

			if (rs.next()) {
				// 기존 사용자가 존재
				flag = -1;
			} else {
				// id 사용가능
				flag = 1;
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * member테이블에 insert하는 메소드 작성
	 */
	public int memberInsert(MemberVO vo) {
		int result = 0;

		try {
			// 실행
			String sql = "INSERT INTO member VALUES(?,?,?,?,?,?,?,'0',?)";
			/*
			 * INSERT INTO 테이블명 VALUES(컬럼1 넣고자하는 데이터, 컬럼2 넣고자하는 데이터 ...) 컬럼을
			 * 선택하여 값을 넣을수도 있다. 선택적으로 넣기 위해서는 INSERT 테이블명 VALUES 넣고자하는 데이터
			 */
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setInt(2, vo.getSchoolnum());
			ps.setString(3, vo.getId());
			ps.setString(4, vo.getPassword());
			ps.setString(5, vo.getAddress());
			ps.setInt(6, vo.getBirth());
			ps.setString(7, vo.getPhone());
			ps.setString(8, vo.getFilename());

			result = ps.executeUpdate();
			// executeUpdate()는 업뎃한 건수를 반환

		} catch (Exception e) {
			

			System.out.println(e + "=> memberInsert fail");

		} finally {
			db_close();
		}

		return result;
	}// memberInsert
		// 회원 아이디 , 비밀번호 체크

	/**
	 * member테이블의 모든 레코드 검색하(Select)는 메서드 작성
	 */
	public ArrayList<MemberVO> getMemberlist(String keyField, String keyWord) {

		ArrayList<MemberVO> list = new ArrayList<MemberVO>(); // List 생성

		try {// 실행
			String sql = "select * from member ";
			// SELECT * FROM 테이블명 = 모든 칼럼 불러오기

			if (keyWord != null && !keyWord.equals("")) {
				sql += "WHERE " + keyField.trim() + " LIKE '%" + keyWord.trim() + "%' order by m_id";
				// ??? 위에코드 이해안감
			} else {// 모든 레코드 검색
				sql += "order by m_id";
				// SELECT * FROM member ORDER BY 칼럼 : 칼럼을 오름차순으로 재배열
			}
			System.out.println("sql = " + sql);
			st = con.createStatement();
			rs = st.executeQuery(sql);

			while (rs.next()) {
				MemberVO vo = new MemberVO();// 새로운 vo객체 생성

				
				vo.setName(rs.getString(1));
				vo.setSchoolnum(rs.getInt(2));
				vo.setId(rs.getString(3));
				vo.setPassword(rs.getString(4));
				vo.setAddress(rs.getString(5));
				vo.setBirth(rs.getInt(6));
				vo.setPhone(rs.getString(7));
				vo.setLevel(rs.getInt(8));
				vo.setFilename(rs.getString(9));

				// vo.set???(rs.???()) : 새로운 객체인 vo 변수들을 설정해준다.
				// rs.get???(숫자) : 각 타입에 맞도록 rs.getInt(), rs.getString()으로 데이터를
				// 꺼내오고
				// ()안에는 칼럼의 index번호 또는 컬럼명이 들어간다. Index는 1부터 시작한다.
				list.add(vo); // 리스트에 vo모두 껴넣기
			}
		} catch (Exception e) {
			System.out.println(e + "=> getMemberlist fail");
		} finally {
			db_close();
		}
		return list; // 리스트 반환 : id~License까지
	}// getMemberlist 회원 리스트 조회

	public MemberVO getMember(String uid) {
		con = null;
		ps = null;
		rs = null;
		String query = "select * from member where m_id =?";
		MemberVO vo = null;

		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url, id, pwd);
			ps = con.prepareStatement(query);
			ps.setString(1, uid);
			rs = ps.executeQuery();

			if (rs.next()) {
				
				
				vo = new MemberVO(); // 새로운 vo객체 생성
				
				vo.setName(rs.getString("m_name"));
				vo.setSchoolnum(rs.getInt("m_school_num"));
				vo.setId(rs.getString("m_id"));
				vo.setPassword(rs.getString("m_password"));
				vo.setAddress(rs.getString("m_address"));
				vo.setBirth(rs.getInt("m_birth"));
				vo.setPhone(rs.getString("m_phone"));
				vo.setLevel(rs.getInt("m_level"));
				vo.setFilename(rs.getString("m_filename"));

			}
			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}// 회원수정으로 인해 회원정보를 가져옴
	
	public int getLevel(String uid) {
		
		
		return 0;
		
	}

	public int updateMember(MemberVO vo) {
		System.out.print("test");
		con = null;
		ps = null;
		int result = 0;
		String sql = "update member set m_name=?, m_school_num=?, m_password=?, m_address=?, m_birth=?, m_phone=?, m_filename=?"
				+ " where m_id=?";
		

		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url, id, pwd);
			ps = con.prepareStatement(sql);
			
			ps.setString(1, vo.getName());
			ps.setInt(2, vo.getSchoolnum());
			ps.setString(3, vo.getPassword());
			ps.setString(4, vo.getAddress());
			ps.setInt(5, vo.getBirth());
			ps.setString(6, vo.getPhone());
			ps.setString(7, vo.getId());
			ps.setString(8, vo.getFilename());


			// vo객체의 id ~ License 모두 가져옴.

			result = ps.executeUpdate();
			
			System.out.print(result);

			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}// 업데이트

	public int deleteMember(String uid, String pw) {
		con = null;
		ps = null;
		int result = 0;
		String query = "select m_password from member where m_id =?";
		rs = null;

		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url, id, pwd);
			ps = con.prepareStatement(query);
			ps.setString(1, uid);
			rs = ps.executeQuery();
			if (rs.next()) {
				String dbpw = rs.getString("m_password");
				if (dbpw.equalsIgnoreCase(pw)) {
					// 아이디와 암호 모두 같으므로 삭제
					query = "delete from member where m_id=?";
					ps = con.prepareStatement(query);
					ps.setString(1, uid);
					result = ps.executeUpdate();
				}
			} else {
				result = -1; // 아이디는 맞으나 암호가 틀림
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public int delMemberlist(String id) { // 관리자가 회원 삭제
		int result = 0;
		try {// 실행

			ps = con.prepareStatement("delete from member where id = ?");
			// ?개수만큼 값 지정
			ps.setString(1, id.trim());
			// String.trim : 현재 String 개체에서 지정된 문자 집합의 선행 항목과
			// 후행 항목이 모두 제거되는 새 문자열을 반환한다.
			// Trim() : 현재 String 개체에서 선행 공백과 후행 공백을 모두 제거한다.
			result = ps.executeUpdate(); // 쿼리실행으로 삭제된 레코드 수 반환

		} catch (Exception e) {
			System.out.println(e + "=> delMemberlist fail");
		} finally {
			db_close();
		}

		return result;
	}

	
	public ArrayList<MemberVO> getMemberIntrolist() {

		ArrayList<MemberVO> list = new ArrayList<MemberVO>(); // List 생성

		try {// 실행
			String sql = "select * from member ";
			// SELECT * FROM 테이블명 = 모든 칼럼 불러오기

			System.out.println("sql = " + sql);
			st = con.createStatement();
			rs = st.executeQuery(sql);

			while (rs.next()) {
				MemberVO vo = new MemberVO();// 새로운 vo객체 생성

				vo.setName(rs.getString(1));
				vo.setSchoolnum(rs.getInt(2));
				vo.setId(rs.getString(3));
				vo.setPassword(rs.getString(4));
				vo.setAddress(rs.getString(5));
				vo.setBirth(rs.getInt(6));
				vo.setPhone(rs.getString(7));
				vo.setLevel(rs.getInt(8));
				vo.setFilename(rs.getString(9));

				// vo.set???(rs.???()) : 새로운 객체인 vo 변수들을 설정해준다.
				// rs.get???(숫자) : 각 타입에 맞도록 rs.getInt(), rs.getString()으로 데이터를
				// 꺼내오고
				// ()안에는 칼럼의 index번호 또는 컬럼명이 들어간다. Index는 1부터 시작한다.
				list.add(vo); // 리스트에 vo모두 껴넣기
			}
		} catch (Exception e) {
			System.out.println(e + "=> getMemberIntrolist fail");
		} finally {
			db_close();
		}
		return list; // 리스트 반환 : id~License까지
	}// getMemberlist 회원 리스트 조회

}