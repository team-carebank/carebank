package com.yee.carebank.model.dto;

public class CategoryDto {
	private int subcat_id;
	private String subcat_name;
	private int supercat_id;

	public CategoryDto() {
		super();
	}

	public CategoryDto(int subcat_id, String subcat_name, int supercat_id) {
		super();
		this.subcat_id = subcat_id;
		this.subcat_name = subcat_name;
		this.supercat_id = supercat_id;
	}

	public int getSubcat_id() {
		return subcat_id;
	}

	public void setSubcat_id(int subcat_id) {
		this.subcat_id = subcat_id;
	}

	public String getSubcat_name() {
		return subcat_name;
	}

	public void setSubcat_name(String subcat_name) {
		this.subcat_name = subcat_name;
	}

	public int getSupercat_id() {
		return supercat_id;
	}

	public void setSupercat_id(int supercat_id) {
		this.supercat_id = supercat_id;
	}

}
