package com.wanghuadi.beans;

public class Hero {
	private Integer id;
	private String name;
	private Double price;
	private Integer cid;
	private String uptime;
	private Integer status;
	private String picurl;
	
	
	//临时字段
	private String cname;
	
	
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getUptime() {
		return uptime;
	}
	public void setUptime(String uptime) {
		this.uptime = uptime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getPicurl() {
		return picurl;
	}
	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}
	@Override
	public String toString() {
		return "Hero [id=" + id + ", name=" + name + ", price=" + price + ", cid=" + cid + ", uptime=" + uptime
				+ ", status=" + status + ", picurl=" + picurl + "]";
	}
	
}
