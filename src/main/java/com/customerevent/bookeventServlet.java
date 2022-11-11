package com.customerevent;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/bookeventServlet")
public class bookeventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("serDetails") == null) {
			
			
			
			String type = request.getParameter("type");
			System.out.println(type);
			
			
			HashMap<String,String> hm = new HashMap<>();
			
			
					try {
					
					
						List<services> serDetails = EventDBUtil.getServices(type);
					
						for(services s: serDetails) {
						
							hm.put(s.getService(), "");
						}
					
						request.setAttribute("serDetails", hm);
						session = request.getSession();
						session.setAttribute("serDetails", hm);
					}
					catch(Exception e) {
						e.printStackTrace();
					}
					
				
		}
		
		else {
			
			System.out.println( "hi" );
			
			HashMap<String,String> hm1 =  (HashMap<String, String>) session.getAttribute("serDetails");
			request.setAttribute("serDetails", hm1);
		}	
		
		
		
		
		RequestDispatcher dis = request.getRequestDispatcher("JSP/bookEvent2.jsp");
		dis.forward(request, response);
		
		
				
			
			
			
				
	}
			
			
			
			
			

		
		
		
	
	

}
