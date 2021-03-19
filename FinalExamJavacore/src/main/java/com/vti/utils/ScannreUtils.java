package com.vti.utils;

import java.util.Scanner;

import com.vti.frontend.Funtion;

public class ScannreUtils {
	public static void inputCandidate() throws Exception {
		Funtion funtion = new Funtion();
		Scanner scanner = new Scanner(System.in);
		System.out.println("Mời bạn nhập vào firstname: ");
		String firstname = scanner.next();
		System.out.println("Mời bạn nhập vào lastname: ");
		String lastname = scanner.next();
		System.out.println("Mời bạn nhập vào phone: ");
		String phone = scanner.next();
		String email = inputEmail();
		System.out.println("Mời bạn nhập vào password: ");
		String password = scanner.next();
		System.out.println("Mời bạn nhập vào role: ");
		String role = scanner.next();
		funtion.registerCandidate(firstname, lastname, phone, email, password, role);
		scanner.close();
	}

	public static String inputPhoneNumber() {
		Scanner scanner = new Scanner(System.in);
		System.out.println("Mời bạn nhập vào phone number: ");
		String phone = scanner.next();
		scanner.close();
		return phone;
	}

	public static boolean checkPhoneNumber(String phone) {
		if (phone.length() >= 6 && phone.length() <= 12) {
			return true;
		} else {
			System.out.println("Vui lòng nhập số phone từ 9 đến 12 số!");
			return false;
		}
	}

	public static String inputEmail() {
		while (true) {
			Scanner scanner = new Scanner(System.in);
			System.out.println("Mời bạn nhập vào Email: ");
			String email = scanner.next();
			checkEmail(email);
			scanner.close();
			return email;
		}
	}

	public static String inputPassword() {
		while (true) {
			Scanner scanner = new Scanner(System.in);
			System.out.println("Mời bạn nhập vào Email: ");
			String password = scanner.next();
			checkEmail(password);
			scanner.close();
			return password;
		}
	}

	public static boolean checkEmail(String email) {
		String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
		return email.matches(regex);
	}

	public static boolean checkpassword(String yourPassword) {
		String regex = "^.*(?=.{8,})(?=..*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$";
		return yourPassword.matches(regex);
	}

}
