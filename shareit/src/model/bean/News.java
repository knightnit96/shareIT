package model.bean;

import java.sql.Timestamp;

public class News {
	private int id;
	private String name;
	private String preview;
	private String detail;
	private Timestamp date_create;
	private int created_by;
	private String picture;
	private int active;
	private int is_slide;
	private int cat_id;
	private String cname;
	private int view;
	private String fullname;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPreview() {
		return preview;
	}
	public void setPreview(String preview) {
		this.preview = preview;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Timestamp getDate_create() {
		return date_create;
	}
	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public int getIs_slide() {
		return is_slide;
	}
	public void setIs_slide(int is_slide) {
		this.is_slide = is_slide;
	}
	public int getCat_id() {
		return cat_id;
	}
	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public News(int id, String name, String preview, String detail,
			Timestamp date_create, int created_by, String picture, int active,
			int is_slide, int cat_id, String cname, int view, String fullname) {
		super();
		this.id = id;
		this.name = name;
		this.preview = preview;
		this.detail = detail;
		this.date_create = date_create;
		this.created_by = created_by;
		this.picture = picture;
		this.active = active;
		this.is_slide = is_slide;
		this.cat_id = cat_id;
		this.cname = cname;
		this.view = view;
		this.fullname = fullname;
	}
	public News() {
		super();
	}
	
}
