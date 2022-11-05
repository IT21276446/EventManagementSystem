package com.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Settings")
public class Settings extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String first_name = request.getParameter("firstname");
		String last_name = request.getParameter("lastname");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String contact = request.getParameter("phone");
		String password = request.getParameter("inputPassword4");
		
        boolean isSuccess = false;
		
		try
		{
			isSuccess = CustomerDBUtil.updateCustomer(first_name, last_name, username, email, contact, password);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	
		if ( isSuccess == true)
		{
			
			RequestDispatcher dis = request.getRequestDispatcher( "/InitialSettings");
			dis.forward(request, response);
		}
		else if ( isSuccess == false)
		{
			response.setContentType("text/html");
			PrintWriter pw=response.getWriter();
			pw.println("<script type=\"text/javascript\">");
			pw.println("alert('Incorrect details have been entered!!! Please try again');");
			pw.println("</script>");
			RequestDispatcher rd=request.getRequestDispatcher("JSP/Cust_Settings.jsp");
			rd.include(request, response);
		}
		
	}

}
