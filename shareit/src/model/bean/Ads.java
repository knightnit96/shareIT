package model.bean;

public class Ads {
	private int id;
	private String name;
	private String picture;
	private String link;
	private int is_slide;
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
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getIs_slide() {
		return is_slide;
	}
	public void setIs_slide(int is_slide) {
		this.is_slide = is_slide;
	}
	public Ads(int id, String name, String picture, String link, int is_slide) {
		super();
		this.id = id;
		this.name = name;
		this.picture = picture;
		this.link = link;
		this.is_slide = is_slide;
	}
	public Ads() {
		super();
		// TODO Auto-generated constructor stub
	}
}	
