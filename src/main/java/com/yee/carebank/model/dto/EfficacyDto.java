package com.yee.carebank.model.dto;

import java.util.List;

public class EfficacyDto {
	private SuppleDto supple;
	private List<SuppleDto> efficacy;

	public EfficacyDto() {
		super();
	}

	public EfficacyDto(SuppleDto supple, List<SuppleDto> efficacy) {
		super();
		this.supple = supple;
		this.efficacy = efficacy;
	}

	public SuppleDto getSupple() {
		return supple;
	}

	public void setSupple(SuppleDto supple) {
		this.supple = supple;
	}

	public List<SuppleDto> getEfficacy() {
		return efficacy;
	}

	public void setEfficacy(List<SuppleDto> efficacy) {
		this.efficacy = efficacy;
	}

	@Override
	public String toString() {
		return "EfficacyDto [supple=" + supple + ", efficacy=" + efficacy + "]";
	}
}