
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WelcomeServlet
 */
@WebServlet(urlPatterns = { "/home" })
public class StarterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StarterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		boolean cookieFound = false;
		
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("username")) {
					request.getSession().setAttribute("username", c.getValue());
					cookieFound = true;
				}
				if(c.getName().equals("description")) {
					request.getSession().setAttribute("description", c.getValue());
				}
			}
		}
		
		if(!cookieFound) {
			response.sendRedirect("index.jsp");
		} else {
			request.getRequestDispatcher("photo_feed.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
