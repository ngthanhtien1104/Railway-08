package com.vti.frontend;

import java.util.Scanner;

import com.vti.utils.ScannreUtils;

public class Program {
	public static void main(String[] args) throws Exception{
		Funtion funtion = new Funtion();
		Scanner scanner = new Scanner(System.in);
		System.out.println("Welcome to VTI Academy");
		System.out.println("----------------------------");
		while (true) {
			System.out.println("1. Register please!!!");
			System.out.println("2. If you already have an Account, so please Loggin!");
			int choose = scanner.nextInt();
			switch (choose) {
			case 1:
				ScannreUtils.inputCandidate();
				break;
			case 2:
				funtion.logginCandidate();
				break;
			default:
				break;
			}
		}
		
	}
}
