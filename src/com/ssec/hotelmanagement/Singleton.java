package com.ssec.hotelmanagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Singleton {
	private Connection con;
	private static final Singleton st=new Singleton();
	
	public  Singleton()
	{
		try {
			Class.forName(Default.Driver);
			try {
				con=DriverManager.getConnection(Default.URL,Default.user,"");
			
			
			
			} catch (SQLException e) {

				System.out.println("sql exception in singleton class");
			}	
		} catch (ClassNotFoundException e) {
			
			System.out.println("class not found exception in singleton class");
		}
		
	}
	public static Singleton getsingleton()
	{
		return st;
		
	}
	public Connection getCon() {
		return con;
	}
	public void setCon(Connection con) {
		this.con = con;
	}
	

}
