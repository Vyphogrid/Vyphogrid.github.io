

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Controller
 */
@WebServlet(urlPatterns={"/login", "/register", "/logout"})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String urlpattern = request.getServletPath();
		
		switch(urlpattern) {
			case "/logout":
				Cookie[] cookies = request.getCookies();
				for(Cookie c : cookies) {
					if(c.getName().equals("username")) {
						c.setMaxAge(0);
						response.addCookie(c);
					}
					if(c.getName().equals("description")) {
						c.setMaxAge(0);
						response.addCookie(c);
					}
				}

				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
				break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String urlpattern = request.getServletPath();
		String username, password, description;
		
		switch(urlpattern) {
			case "/login":
				username = request.getParameter("username");
				password = request.getParameter("password");
				
				if(username.equals("julius") && password.equals("1234")) {
					description = "ball.is.life";
					
					HttpSession session = request.getSession();
					session.setAttribute("username", username);
					session.setAttribute("description", description);

					Cookie usernameCookie = new Cookie("username", username);
					usernameCookie.setMaxAge(60 * 60 * 24 * 21);
					response.addCookie(usernameCookie);

					Cookie descCookie = new Cookie("description", description);
					descCookie.setMaxAge(60 * 60 * 24 * 21);
					response.addCookie(descCookie);
					
					RequestDispatcher rd = request.getRequestDispatcher("photo_feed.jsp");
					rd.forward(request, response);
				} else {
					// redirect to same login page
					response.sendRedirect("login.jsp");
				}
				break;
			case "/register":
				username = request.getParameter("username");
				password = request.getParameter("password");
				description = request.getParameter("description");
				
				if(username.trim() != "" && password.trim() != "") {
					response.sendRedirect("login.jsp");
				} else {
					response.sendRedirect("register.jsp");
				}
				break;
		}
		
		
		/*
		//create new user
		System.out.println("New user:");
		System.out.println("username is " + username);
		System.out.println("password is" + password);
		
		request.setAttribute("un", username);
		
		RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
		rd.forward(request, response);
		*/
	}

}
