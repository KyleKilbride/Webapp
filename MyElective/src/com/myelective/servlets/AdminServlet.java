package com.myelective.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession; 

public class AdminServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if (request.getParameter("editElective") != null) {
			session.setAttribute("adminAction", "editElective");
		    // Invoke FirstServlet's job here.
		} else if (request.getParameter("removeElective") != null) {
			session.setAttribute("adminAction", "removeElective");
		    // Invoke SecondServlet's job here.
		} else if (request.getParameter("addElective") != null) {
			session.setAttribute("adminAction", "addElective");
		    // Invoke SecondServlet's job here.
		} else if (request.getParameter("editComment") != null) {
			session.setAttribute("adminAction", "editComment");
		    // Invoke SecondServlet's job here.
		} else if (request.getParameter("removeComment") != null) {
			session.setAttribute("adminAction", "removeComment");
		    // Invoke SecondServlet's job here.
		} else if (request.getParameter("editUser") != null) {
			session.setAttribute("adminAction", "editUser");
		    // Invoke SecondServlet's job here.
		} else if (request.getParameter("removeUser") != null) {
			session.setAttribute("adminAction", "removeUser");
		    // Invoke SecondServlet's job here.
		}
		response.sendRedirect("Admin.jsp");
	}
}
