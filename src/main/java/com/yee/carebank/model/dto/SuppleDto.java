package com.yee.carebank.model.dto;

public class SuppleDto {
	private int supple_id;
	private String supple_name;
	private String description;
	private int subcat_id;
	private String src;

	public int getSupple_id() {
		return supple_id;
	}

	public void setSupple_id(int supple_id) {
		this.supple_id = supple_id;
	}

	public String getSupple_name() {
		return supple_name;
	}

	public void setSupple_name(String supple_name) {
		this.supple_name = supple_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getSubcat_id() {
		return subcat_id;
	}

	public void setSubcat_id(int subcat_id) {
		this.subcat_id = subcat_id;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public SuppleDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SuppleDto(int supple_id, String supple_name, String description, int subcat_id, String src) {
		super();
		this.supple_id = supple_id;
		this.supple_name = supple_name;
		this.description = description;
		this.subcat_id = subcat_id;
		this.src = src;
	}

}
