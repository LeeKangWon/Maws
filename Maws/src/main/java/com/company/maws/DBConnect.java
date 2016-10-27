package com.company.maws;

import java.io.*;
import java.sql.*;
import java.text.*;
import java.util.*;

public class DBConnect {
	Connection dbconn = null;

	String driverName = new String();
	String dburl = new String();
	String dbuser = new String();
	String dbpass = new String();


	public DBConnect() {
		driverName = "com.mysql.jdbc.Driver";
		//�����Ǵ� �ٲ��ּ���
		dburl = "jdbc:mysql://localhost:3306/maws";
		//�����̸� ����
		dbuser = "jspbook";
		//�н����� ����
		dbpass = "1234";
	}


	public Connection getConnection() {
		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
		}

		try {
			dbconn = DriverManager.getConnection(dburl, dbuser, dbpass);
		} catch (SQLException e) {
		}

		return dbconn;
	}


	public void close() {
		try {
			if(!dbconn.isClosed()) {
				dbconn.close();
			}
		} catch (SQLException e) {
		}
	}

}