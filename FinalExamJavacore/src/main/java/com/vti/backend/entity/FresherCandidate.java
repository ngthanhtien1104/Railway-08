package com.vti.backend.entity;

public class FresherCandidate {
	private GraduationRank graduationRank;

	public FresherCandidate() {
		super();
	}

	public FresherCandidate(GraduationRank graduationRank) {
		super();
		this.graduationRank = graduationRank;
	}

	public GraduationRank getGraduationRank() {
		return graduationRank;
	}

	public void setGraduationRank(GraduationRank graduationRank) {
		this.graduationRank = graduationRank;
	}

	@Override
	public String toString() {
		return "FresherCandidate [graduationRank=" + graduationRank + "]";
	}

}
