package com.yee.carebank.model.dto;

public class ShoppingDto {
	private String title;
	private String brand;
	private String maker;
	private String link;
	private String image;

	public ShoppingDto() {
		super();
	}

	public ShoppingDto(String title, String brand, String maker, String link, String image) {
		super();
		this.title = title.replace("<b>", "").replace("</b>", "");
		this.brand = brand;
		this.maker = maker;
		this.link = link;
		this.image = image;
	}

	public String getTitle() {
		return title.replace("<b>", "").replace("</b>", "");
	}

	public void setTitle(String title) {
		this.title = title.replace("<b>", "").replace("</b>", "");
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
