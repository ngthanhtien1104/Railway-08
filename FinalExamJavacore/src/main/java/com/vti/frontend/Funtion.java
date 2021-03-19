package com.vti.frontend;

import java.sql.SQLException;
import java.util.Scanner;
import com.vti.utils.ScannreUtils;
import com.vti.backend.controller.CandidateController;

public class Funtion {
	private CandidateController candidateController;
	private ScannreUtils scannerUtils;

	public Funtion() {
		candidateController = new CandidateController();
		scannerUtils = new ScannreUtils();
	}

	public void registerCandidate(String firstName, String lastName, String phone, String email, String password,
			String role) throws ClassNotFoundException, SQLException {
		candidateController.registerCandidate(firstName, lastName, phone, email, password, role);
	}

	public void logginCandidate() throws ClassNotFoundException, SQLException {
		while (true) {
			Scanner scanner = new Scanner(System.in);
			String email = ScannreUtils.inputEmail();
			String password = ScannreUtils.inputPassword();
			candidateController.logginCandidate(email, password);
			scanner.close();
		}
	}
}
