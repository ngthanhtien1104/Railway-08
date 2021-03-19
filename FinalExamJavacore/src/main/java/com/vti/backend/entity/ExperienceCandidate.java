package com.vti.backend.entity;

public class ExperienceCandidate {
	private int expInYear;
	private ProSkill proSkill;

	public ExperienceCandidate() {
		super();
	}

	public ExperienceCandidate(int expInYear, ProSkill proSkill) {
		super();
		this.expInYear = expInYear;
		this.proSkill = proSkill;
	}

	public int getExpInYear() {
		return expInYear;
	}

	public void setExpInYear(int expInYear) {
		this.expInYear = expInYear;
	}

	public ProSkill getProSkill() {
		return proSkill;
	}

	public void setProSkill(ProSkill proSkill) {
		this.proSkill = proSkill;
	}

	@Override
	public String toString() {
		return "ExperienceCandidate [expInYear=" + expInYear + ", proSkill=" + proSkill + "]";
	}

}
