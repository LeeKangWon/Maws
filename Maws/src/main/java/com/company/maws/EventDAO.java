package com.company.maws;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EventDAO {

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

	public EventDAO() {

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
	
	public int eventInsert(EventVO vo) {
		int result = 0;

		try {
			// ����
			String sql = "INSERT INTO cal VALUES(?,?,?,?,?,?,?)";
			/*
			 * INSERT INTO ���̺�� VALUES(�÷�1 �ְ����ϴ� ������, �÷�2 �ְ����ϴ� ������ ...) �÷���
			 * �����Ͽ� ���� �������� �ִ�. ���������� �ֱ� ���ؼ��� INSERT ���̺�� VALUES �ְ����ϴ� ������
			 */
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getNum());
			ps.setInt(2, vo.getYear());
			ps.setInt(3, vo.getMonth());
			ps.setInt(4, vo.getDay());
			ps.setString(5, vo.getTitle());
			ps.setString(6, vo.getContent());
			ps.setInt(7, vo.getLevel());

			result = ps.executeUpdate();
			// executeUpdate()�� ������ �Ǽ��� ��ȯ

		} catch (Exception e) {

			System.out.println(e + "=> eventInsert fail");

		} finally {
			db_close();
		}

		return result;
	}// memberInsert
		// ȸ�� ���̵� , ��й�ȣ üũ
}
