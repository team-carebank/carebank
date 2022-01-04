package com.yee.carebank.model.dto;

import com.google.gson.JsonObject;

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
		this.title = title;
		this.brand = brand;
		this.maker = maker;
		this.link = link;
		this.image = image;
	}

	public ShoppingDto(JsonObject obj) {
		this.title = obj.get("title").getAsString().replace("<b>", "").replace("</b>", "");
		this.brand = obj.get("brand").getAsString();
		this.maker = obj.get("maker").getAsString();
		this.link = obj.get("link").getAsString();
		this.image = obj.get("image").getAsString();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
