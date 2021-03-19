package com.vti.backend.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.vti.backend.entity.Role;
import com.vti.utils.JDBCUtils;

public class CandidateRepository {
	// registerCandidate
	public void registerCandidate(String firstName, String lastName, String phone, String email, String password,
			String role) throws ClassNotFoundException, SQLException {
		// Step 1: Create connection
		Connection connection = JDBCUtils.getConnection();

		// Create query
		String query = "INSERT INTO Candidate	( firstName, lastName, phone, email,`password`, `role`)\r\n"
				+ "VALUES 			   		(    ?     ,   ?     ,   ?  ,   ?  ,    ?  	 ,   ?   )";

		PreparedStatement preStatement = connection.prepareStatement(query);
		// Create id parameter
		preStatement.setString(1, firstName);
		preStatement.setString(2, lastName);
		preStatement.setString(3, phone);
		preStatement.setString(4, email);
		preStatement.setString(5, password);
		preStatement.setString(6, role);

		// execute query
		preStatement.executeUpdate();
	}

	public void logginCandidate(String email, String password) throws ClassNotFoundException, SQLException {
		// Step 1: Create connection
		Connection connection = JDBCUtils.getConnection();

		// Create query
		String query = "SELECT `role` FROM Candidate\r\n" + "WHERE email = ?" + "AND `password` = ?";
		PreparedStatement preStatement = connection.prepareStatement(query);

		// Create id parameter
		preStatement.setString(1, email);
		preStatement.setString(2, password);

		// Execute the query
		ResultSet resultSet = preStatement.executeQuery();

		// Handing result

		while (resultSet.next()) {
			Role role = Role.valueOf(resultSet.getString("role").toUpperCase());
			if(role == null) {
				System.out.println("Tài khoản hoặc mật khẩu chưa đúng!");
			}
			connection.close();
		}
		connection.close();
	}
}
