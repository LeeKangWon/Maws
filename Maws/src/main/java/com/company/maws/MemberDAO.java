package com.company.maws;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import com.company.maws.MemberVO;;

/*JDBC�� �ڹ� ���α׷��� ������ ������ ������ ���� �������̽��̴�. 
 * JDBC ���̺귯���� ������ ������ ���̽��� �����ϰ�, SQL �������� �����ϴ� ����� �����Ѵ�.
 * 
 * JDBC ���̺귯���� 'java.sql' ��Ű���� ���� �����ǰ�, �� ��Ű���� ���� ������
 * ������ ���̽��� ������ �� �ִ�. 'java.sql' ��Ű���� ���� api�� �����ϴ� Ŭ������ 
 * �������̽��� �����̴�. */
public class MemberDAO {
	private static MemberDAO dao = new MemberDAO();

	public static MemberDAO getDAO() {
		return dao;
	}

	/**
	 * �ʿ��� property ����
	 */
	Connection con;
	/*
	 * Connection ��ü�� �����ϴ� ������ DriverManager�� ��ϵ� �� ����̹����� GetConnection(String
	 * url) �޼ҵ带 ����ؼ� �ĺ��Ѵ�. �̶� url �ĺ��ڿ� ���� ���� ã�Ƽ� �����Ѵ�. ã�� ���ϸ� no suitable error
	 * �� �߻�.
	 */
	Statement st;
	/*
	 * sql ������ ����/�����ϸ� ��ȯ�� ����� �������� �� �۾������� �����Ѵ�. Statement ��ü�� Connection ��ü��
	 * createStatement() �޼ҵ带 ����Ͽ� �����ȴ�.
	 */
	PreparedStatement ps;
	/*
	 * PreparedStatement = ���������� �� SQL ���� ��Ÿ���� ��ü�̴�. SQL����, ���������ϵǾ�
	 * PreparedStatement ��ü�� ���Եȴ�. �ű⼭ �� ��ü�� �� ������ ���� ���� ȿ�������� �����ϴ� �������� ����� ��
	 * �ִ�.
	 */
	ResultSet rs;
	/*
	 * executeQuery() �޼ҵ�� ����� ResultSet�� ��ȯ�Ѵ�. �� ResultSet���κ��� ���ϴ� �����͸� �����ϴ�
	 * ������ ���Ѵ�. �����͸� �����ϴ� ����� ResultSet ���� �� �྿ �̵��ϸ鼭 GetXxx()�� �̿��ؼ� ���ϴ� �ʵ� ����
	 * �����ϴµ�, �̶� rs.getString("name")Ȥ�� rs.getString(1)�� ���.
	 */

	// MySQL
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/maws";

	/*
	 * //ORACLE String driverName="oracle.jdbc.driver.OracleDriver"; String url
	 * = " jdbc:oracle:thin:@localhost:1521:ORCL";
	 */
	String id = "jspbook"; // mysql ���� ���̵�
	String pwd = "1234";// mysql ���� ��й�ȣ

	/**
	 * �ε�� ������ ���� ������ �ۼ�
	 */

	public MemberDAO() {

		try {
			// �ε�
			Class.forName(driverName);
			/*
			 * �������� Ŭ������ �����ϴ� �͵� ����������, �������� ������ �� DriverManager�� �ش� Ŭ������ ��Ͻ�Ű��
			 * ������ �ִ�. �׷��� DriverManager.getConnection �� ���� ��ϵ� Ŭ������ ã��,
			 * Connection�� �����ϴ� ���̴�.
			 */

			// ����
			con = DriverManager.getConnection(url, id, pwd);

		} catch (ClassNotFoundException e) {

			System.out.println(e + "=> �ε� ����");

		} catch (SQLException e) {

			System.out.println(e + "=> ���� ����");
		}
	}// JDBC_memberDAO()

	/**
	 * DB�ݱ� ��� �޼ҵ� �ۼ�
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
			System.out.println(e + "=> �ݱ� ����");
		}

	} // db_close

	// ������ ȸ�����Կ��θ� �Ǵ�
	public int userCheck(String uid, String pw) {
		con = null;
		ps = null;
		rs = null;
		String query = "select m_password from member where m_id =?";
		// http://stophyun.tistory.com/62 query�� ����
		int flag = -1; // ȸ�������� ���ߴٰ� ����.

		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url, id, pwd);
			ps = con.prepareStatement(query);
			// con�� ��Ƽ���� ������ ��Ÿ����.
			/*
			 * IN �Ķ����ġ�� �����ϴ� ���� ��� �޼ҵ�(setShort, setString �� ) �Է� �Ķ������ ���ǵ� SQL
			 * ���� ȣȯ�� �ִ� ���¸� �������� ������ �ȵȴ�.
			 */
			ps.setString(1, uid);
			rs = ps.executeQuery(); // ���� ����� ResultSet�� ��� ���� �޼ҵ�� �ַ� SELECT����
									// ���ȴ�.

			if (rs.next()) {
				/*
				 * ResultSet�� �Ӽ� rs.first() -> Ŀ���� ó������ rs.last() -> Ŀ���� ���� �ڷ�
				 * rs.next() -> Ŀ���� �������� rs.previous() -> Ŀ���� �������� rs.getRow()
				 * -> ���� Ŀ���� ����Ű�� �ִ� row ��ȣ rs.isFirst() -> Ŀ���� ó������ rs.isLast()
				 * -> Ŀ���� ���������� rs.beforeFirst() -> Ŀ���� ���� �ڷ�(�������)
				 * rs.afterLast()-> Ŀ���� ���� �ڷ�(�� ������)
				 */
				
				if (pw.equals(rs.getString("m_password"))) {
					flag = 1;// ���̵�� �н����� ��ġ
					
				} else {
					flag = 0; // �н��������ġ
				}
			} else {
				flag = -1; // ���̵� Ʋ���ų� ����.
			}
		} catch (Exception e) {
			e.printStackTrace();
			/*
			 * �� ���ο� ��� ������Ʈ �� �� �� Ʈ���̽��� ǥ������ ���� ��Ʈ���� ����Ѵ�. ����� �����࿡�� �� ������Ʈ�� ����
			 * toString() �޼ҵ��� ����� ���Եȴ�. ���������� ������ fillInStackTrace() �޼ҵ忡 ����
			 * ��ϵ� �����͸� ��Ÿ����.
			 */
		} finally {
			/*
			 * finally ����� �ʼ� ����� �ƴϴ�. finally ����� ���Ǹ� finally ����� ������ ���� �߻�
			 * ������ ���� catch ������ ��� ���� ������ ����ȴ�. ����, �����ͺ��̽��� ������ ����� �� �ݴ� ��ɰ� ����
			 * �׻� �����ؾ� �� �ʿ䰡 �ִ� ��쿡 ����Ѵ�.
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

	// id �ߺ�
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
				// ���� ����ڰ� ����
				flag = -1;
			} else {
				// id ��밡��
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
				// ���� ����ڰ� ����
				flag = -1;
			} else {
				// id ��밡��
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
	 * member���̺� insert�ϴ� �޼ҵ� �ۼ�
	 */
	public int memberInsert(MemberVO vo) {
		int result = 0;

		try {
			// ����
			String sql = "INSERT INTO member VALUES(?,?,?,?,?,?,?,'0',?)";
			/*
			 * INSERT INTO ���̺�� VALUES(�÷�1 �ְ����ϴ� ������, �÷�2 �ְ����ϴ� ������ ...) �÷���
			 * �����Ͽ� ���� �������� �ִ�. ���������� �ֱ� ���ؼ��� INSERT ���̺�� VALUES �ְ����ϴ� ������
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
			// executeUpdate()�� ������ �Ǽ��� ��ȯ

		} catch (Exception e) {
			

			System.out.println(e + "=> memberInsert fail");

		} finally {
			db_close();
		}

		return result;
	}// memberInsert
		// ȸ�� ���̵� , ��й�ȣ üũ

	/**
	 * member���̺��� ��� ���ڵ� �˻���(Select)�� �޼��� �ۼ�
	 */
	public ArrayList<MemberVO> getMemberlist(String keyField, String keyWord) {

		ArrayList<MemberVO> list = new ArrayList<MemberVO>(); // List ����

		try {// ����
			String sql = "select * from member ";
			// SELECT * FROM ���̺�� = ��� Į�� �ҷ�����

			if (keyWord != null && !keyWord.equals("")) {
				sql += "WHERE " + keyField.trim() + " LIKE '%" + keyWord.trim() + "%' order by m_id";
				// ??? �����ڵ� ���ؾȰ�
			} else {// ��� ���ڵ� �˻�
				sql += "order by m_id";
				// SELECT * FROM member ORDER BY Į�� : Į���� ������������ ��迭
			}
			System.out.println("sql = " + sql);
			st = con.createStatement();
			rs = st.executeQuery(sql);

			while (rs.next()) {
				MemberVO vo = new MemberVO();// ���ο� vo��ü ����

				
				vo.setName(rs.getString(1));
				vo.setSchoolnum(rs.getInt(2));
				vo.setId(rs.getString(3));
				vo.setPassword(rs.getString(4));
				vo.setAddress(rs.getString(5));
				vo.setBirth(rs.getInt(6));
				vo.setPhone(rs.getString(7));
				vo.setLevel(rs.getInt(8));
				vo.setFilename(rs.getString(9));

				// vo.set???(rs.???()) : ���ο� ��ü�� vo �������� �������ش�.
				// rs.get???(����) : �� Ÿ�Կ� �µ��� rs.getInt(), rs.getString()���� �����͸�
				// ��������
				// ()�ȿ��� Į���� index��ȣ �Ǵ� �÷����� ����. Index�� 1���� �����Ѵ�.
				list.add(vo); // ����Ʈ�� vo��� ���ֱ�
			}
		} catch (Exception e) {
			System.out.println(e + "=> getMemberlist fail");
		} finally {
			db_close();
		}
		return list; // ����Ʈ ��ȯ : id~License����
	}// getMemberlist ȸ�� ����Ʈ ��ȸ

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
				
				
				vo = new MemberVO(); // ���ο� vo��ü ����
				
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
	}// ȸ���������� ���� ȸ�������� ������
	
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


			// vo��ü�� id ~ License ��� ������.

			result = ps.executeUpdate();
			
			System.out.print(result);

			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}// ������Ʈ

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
					// ���̵�� ��ȣ ��� �����Ƿ� ����
					query = "delete from member where m_id=?";
					ps = con.prepareStatement(query);
					ps.setString(1, uid);
					result = ps.executeUpdate();
				}
			} else {
				result = -1; // ���̵�� ������ ��ȣ�� Ʋ��
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public int delMemberlist(String id) { // �����ڰ� ȸ�� ����
		int result = 0;
		try {// ����

			ps = con.prepareStatement("delete from member where id = ?");
			// ?������ŭ �� ����
			ps.setString(1, id.trim());
			// String.trim : ���� String ��ü���� ������ ���� ������ ���� �׸��
			// ���� �׸��� ��� ���ŵǴ� �� ���ڿ��� ��ȯ�Ѵ�.
			// Trim() : ���� String ��ü���� ���� ����� ���� ������ ��� �����Ѵ�.
			result = ps.executeUpdate(); // ������������ ������ ���ڵ� �� ��ȯ

		} catch (Exception e) {
			System.out.println(e + "=> delMemberlist fail");
		} finally {
			db_close();
		}

		return result;
	}

	
	public ArrayList<MemberVO> getMemberIntrolist() {

		ArrayList<MemberVO> list = new ArrayList<MemberVO>(); // List ����

		try {// ����
			String sql = "select * from member ";
			// SELECT * FROM ���̺�� = ��� Į�� �ҷ�����

			System.out.println("sql = " + sql);
			st = con.createStatement();
			rs = st.executeQuery(sql);

			while (rs.next()) {
				MemberVO vo = new MemberVO();// ���ο� vo��ü ����

				vo.setName(rs.getString(1));
				vo.setSchoolnum(rs.getInt(2));
				vo.setId(rs.getString(3));
				vo.setPassword(rs.getString(4));
				vo.setAddress(rs.getString(5));
				vo.setBirth(rs.getInt(6));
				vo.setPhone(rs.getString(7));
				vo.setLevel(rs.getInt(8));
				vo.setFilename(rs.getString(9));

				// vo.set???(rs.???()) : ���ο� ��ü�� vo �������� �������ش�.
				// rs.get???(����) : �� Ÿ�Կ� �µ��� rs.getInt(), rs.getString()���� �����͸�
				// ��������
				// ()�ȿ��� Į���� index��ȣ �Ǵ� �÷����� ����. Index�� 1���� �����Ѵ�.
				list.add(vo); // ����Ʈ�� vo��� ���ֱ�
			}
		} catch (Exception e) {
			System.out.println(e + "=> getMemberIntrolist fail");
		} finally {
			db_close();
		}
		return list; // ����Ʈ ��ȯ : id~License����
	}// getMemberlist ȸ�� ����Ʈ ��ȸ

}