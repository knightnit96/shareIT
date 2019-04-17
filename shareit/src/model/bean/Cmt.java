package model.bean;

import java.sql.Timestamp;

public class Cmt {
	private int id;
	private String content;
	private String name_cmt;
	private String email_cmt;
	private String web_cmt;
	private Timestamp date_create;
	private int parent_id;
	private int news_id;
	private int active;
	private String nname;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName_cmt() {
		return name_cmt;
	}
	public void setName_cmt(String name_cmt) {
		this.name_cmt = name_cmt;
	}
	public String getEmail_cmt() {
		return email_cmt;
	}
	public void setEmail_cmt(String email_cmt) {
		this.email_cmt = email_cmt;
	}
	public String getWeb_cmt() {
		return web_cmt;
	}
	public void setWeb_cmt(String web_cmt) {
		this.web_cmt = web_cmt;
	}
	public Timestamp getDate_create() {
		return date_create;
	}
	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}
	public int getNews_id() {
		return news_id;
	}
	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public String getNname() {
		return nname;
	}
	public void setNname(String nname) {
		this.nname = nname;
	}
	public Cmt(int id, String content, String name_cmt, String email_cmt,
			String web_cmt, Timestamp date_create, int parent_id, int news_id,
			int active, String nname) {
		super();
		this.id = id;
		this.content = content;
		this.name_cmt = name_cmt;
		this.email_cmt = email_cmt;
		this.web_cmt = web_cmt;
		this.date_create = date_create;
		this.parent_id = parent_id;
		this.news_id = news_id;
		this.active = active;
		this.nname = nname;
	}
	public Cmt() {
		super();
	}
	
}
