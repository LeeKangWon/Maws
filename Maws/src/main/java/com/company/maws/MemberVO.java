package com.company.maws;

public class MemberVO {
	/**
	 * 필요한 property 선언
	 */
	private String name;
	private int schoolnum;
	private String id;
	private String password;
	private String address;
	private int birth;
	private int phone;
	private int level;

	public MemberVO() {
	}

	public MemberVO(String name, int schoolnum, String id, String password, String address, int birth, int phone,
			int level) {

		this.name = name;
		this.schoolnum = schoolnum;
		this.id = id;
		this.password = password;
		this.address = address;
		this.birth = birth;
		this.phone = phone;
		this.level = level;

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSchoolnum() {
		return schoolnum;
	}

	public void setSchoolnum(int schoolnum) {
		this.schoolnum = schoolnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

}