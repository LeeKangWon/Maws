package com.company.maws;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.company.maws.GalleryVO;

/*JDBC�� �ڹ� ���α׷��� ������ ������ ������ ���� �������̽��̴�. 
 * JDBC ���̺귯���� ������ ������ ���̽��� �����ϰ�, SQL �������� �����ϴ� ����� �����Ѵ�.
 * 
 * JDBC ���̺귯���� 'java.sql' ��Ű���� ���� �����ǰ�, �� ��Ű���� ���� ������
 * ������ ���̽��� ������ �� �ִ�. 'java.sql' ��Ű���� ���� api�� �����ϴ� Ŭ������ 
 * �������̽��� �����̴�. */
public class GalleryDAO {
	private static GalleryDAO dao = new GalleryDAO();

	public static GalleryDAO getDAO() {
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

	public GalleryDAO() {

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

			System.out.println(e + "=> �̹������� �ε� ����");

		} catch (SQLException e) {

			System.out.println(e + "=> �̹��� ���� ����");
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

	public ArrayList<GalleryVO> getFileNamelist() {

		ArrayList<GalleryVO> list = new ArrayList<GalleryVO>(); // List ����

		try {// ����
			String sql = "select * from gallery ";
			// SELECT * FROM ���̺�� = ��� Į�� �ҷ�����

			System.out.println("sql = " + sql);
			st = con.createStatement();
			rs = st.executeQuery(sql);

			while (rs.next()) {
				GalleryVO vo = new GalleryVO();// ���ο� vo��ü ����

				vo.setNum(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setFileName(rs.getString(3));
				vo.setTime(rs.getString(4));

				// vo.set???(rs.???()) : ���ο� ��ü�� vo �������� �������ش�.
				// rs.get???(����) : �� Ÿ�Կ� �µ��� rs.getInt(), rs.getString()���� �����͸�
				// ��������
				// ()�ȿ��� Į���� index��ȣ �Ǵ� �÷����� ����. Index�� 1���� �����Ѵ�.
				list.add(vo); // ����Ʈ�� vo��� ���ֱ�
			}
		} catch (Exception e) {
			System.out.println(e + "=> getFileNamelist fail");
		} finally {
			db_close();
		}
		return list; // ����Ʈ ��ȯ : id~License����
	}// getMemberlist ȸ�� ����Ʈ ��ȸ

}