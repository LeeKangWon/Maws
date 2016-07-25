package com.company.maws;

public class GalleryVO {

	private int num;
	private String name;
	private String fileName;
	private String time;
	
	public GalleryVO() {
	}

	public GalleryVO(int num, String name, String fileName, String time) {

		this.num = num;
		this.name = name;
		this.fileName = fileName;
		this.time = time;

	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
