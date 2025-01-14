package com.myelective.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession; 

import beans.User;

import com.myelective.controllers.ElectiveController;
import com.myelective.controllers.RatingController;
import com.myelective.jbdc.Security;

/**
 * Gets the updated user information from the page, updates
 * the users information in the database and also updates the
 * user in the session with the updates information.
 * 
 * @version 1.0
 *
 */

public class EditUserServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	RatingController rc = new RatingController();
	ElectiveController ec = new ElectiveController();	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		
		session.setAttribute("error", null);
		User user = (User)session.getAttribute("user");
		
		String firstName = (String) request.getParameter("editUserFirstName");
		String lastName = (String) request.getParameter("editUserLastName");
		String program = (String) request.getParameter("editUserProgram");
		String password = Security.encrypt((String) request.getParameter("editUserPassword"));
		String confirmPassword = Security.encrypt((String) request.getParameter("editUserConfirmPassword"));
		String email = (String) request.getParameter("editUserEmail");
		
		if (firstName.intern() != "") {
			try {
				rc.editUserFirstName(firstName, email);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			user.setFirstName(firstName);
		}
		
		if (lastName.intern() != "") {
			try {
				rc.editUserLastName(lastName, email);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			user.setLastName(lastName);
		}
		
		if (program.intern() != "") {
			try {
				rc.editUserProgram(program, email);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			user.setProgram(program);
		}
		
		if (password.intern() == confirmPassword.intern() && password.intern() != "") {
			try {
				rc.editUserPassword(password, email);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			user.setPassword(password);
		}
		else if(password.intern() == "" || confirmPassword.intern() == ""){
			if(password.intern() == confirmPassword.intern()){
				session.setAttribute("error", null);
			}
			else{
				if(password.intern() != confirmPassword.intern()){
					session.setAttribute("error", "Error. Passwords do not match");
				}
			}
		}
		else if(password.intern() != confirmPassword.intern()){
			session.setAttribute("error", "Error. Passwords do not match");
		}
		
		
		
		
		session.setAttribute("user", user);
        
		response.sendRedirect("EditUser.jsp");
		out.close();
	}
}
