package com.vti.backend.service;

import java.sql.SQLException;

import com.vti.backend.repository.CandidateRepository;

public class CandidateService {
	private CandidateRepository candidateRepository;

	public CandidateService() {
		candidateRepository = new CandidateRepository();
	}
	
	public void registerCandidate(String firstName, String lastName, String phone, String email,String password, String role)
			throws ClassNotFoundException, SQLException {
		candidateRepository.registerCandidate(firstName, lastName, phone, email, password, role);
	}
	
	public void logginCandidate(String email, String password) throws ClassNotFoundException, SQLException {
		candidateRepository.logginCandidate(email, password);
	}
	
}
