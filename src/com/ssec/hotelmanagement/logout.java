package com.ssec.hotelmanagement;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/html");  
        PrintWriter out=response.getWriter();  
        RequestDispatcher dis =request.getRequestDispatcher("index.jsp");
        dis.include(request, response);
        
       
          
        HttpSession session=request.getSession();  
        session.setAttribute("id", null);  
          
        out.print("You are successfully logged out!");  
          
        out.close();  
		
		
		
		
		
		
		
		
		
	}

	
	
	
	
	
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

}
}