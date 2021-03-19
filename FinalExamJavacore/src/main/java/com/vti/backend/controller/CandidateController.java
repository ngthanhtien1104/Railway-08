package com.vti.backend.controller;

import java.sql.SQLException;

import com.vti.backend.service.CandidateService;

public class CandidateController {
	private CandidateService candidateService;

	public CandidateController() {
		candidateService = new CandidateService();
	}
	
	public void registerCandidate(String firstName, String lastName, String phone, String email,String password, String role)
			throws ClassNotFoundException, SQLException {
		candidateService.registerCandidate(firstName, lastName, phone, email, password, role);
	}
	
	public void logginCandidate(String email, String password) throws ClassNotFoundException, SQLException {
		candidateService.logginCandidate(email, password);
	}
}
