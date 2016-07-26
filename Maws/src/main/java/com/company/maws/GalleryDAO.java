package com.company.maws;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.company.maws.GalleryVO;

/*JDBC는 자바 프로그램과 관계형 데이터 원본에 대한 인터페이스이다. 
 * JDBC 라이브러리는 관계형 데이터 베이스에 접근하고, SQL 쿼리문을 실행하는 방법을 제공한다.
 * 
 * JDBC 라이브러리는 'java.sql' 패키지에 의해 구현되고, 이 패키지는 여러 종류의
 * 데이터 베이스에 접근할 수 있다. 'java.sql' 패키지는 단일 api를 제공하는 클래스와 
 * 인터페이스의 집합이다. */
public class GalleryDAO {
	private static GalleryDAO dao = new GalleryDAO();

	public static GalleryDAO getDAO() {
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

	public GalleryDAO() {

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

			System.out.println(e + "=> 이미지연결 로드 실패");

		} catch (SQLException e) {

			System.out.println(e + "=> 이미지 연결 실패");
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

	public ArrayList<GalleryVO> getFileNamelist() {

		ArrayList<GalleryVO> list = new ArrayList<GalleryVO>(); // List 생성

		try {// 실행
			String sql = "select * from gallery ";
			// SELECT * FROM 테이블명 = 모든 칼럼 불러오기

			System.out.println("sql = " + sql);
			st = con.createStatement();
			rs = st.executeQuery(sql);

			while (rs.next()) {
				GalleryVO vo = new GalleryVO();// 새로운 vo객체 생성

				vo.setNum(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setFileName(rs.getString(3));
				vo.setTime(rs.getString(4));

				// vo.set???(rs.???()) : 새로운 객체인 vo 변수들을 설정해준다.
				// rs.get???(숫자) : 각 타입에 맞도록 rs.getInt(), rs.getString()으로 데이터를
				// 꺼내오고
				// ()안에는 칼럼의 index번호 또는 컬럼명이 들어간다. Index는 1부터 시작한다.
				list.add(vo); // 리스트에 vo모두 껴넣기
			}
		} catch (Exception e) {
			System.out.println(e + "=> getFileNamelist fail");
		} finally {
			db_close();
		}
		return list; // 리스트 반환 : id~License까지
	}// getMemberlist 회원 리스트 조회

}