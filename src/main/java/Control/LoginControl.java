package Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.DAO;
import Entity.Users;

@WebServlet("/login")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie cookie[] = request.getCookies();
		if(cookie != null) {
			for(Cookie o : cookie) {
				if(o.getName().equals("user")) {
					request.setAttribute("user", o.getValue());
				}
				if(o.getName().equals("pass")) {
					request.setAttribute("password", o.getValue());
				}
			}
		}
		
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String pass = request.getParameter("password");
		String remember = request.getParameter("remember");
		
		DAO dao = new DAO();
		Users user = dao.checkLogin(username, pass);
		if(user == null) {
			request.setAttribute("user", username);
			request.setAttribute("message", "User or password is invalid");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
//			dung requestDipatcher khi chuyen trang co kem theo du lieu
//			request.getRequestDispatcher("HomeServlet").forward(request, response);
			
			HttpSession session = request.getSession();
			session.setAttribute("acc", user);
			session.setMaxInactiveInterval(1000);
			
			// luu len cookie
			Cookie u = new Cookie("user", username);
			Cookie p = new Cookie("pass", pass);
			
			u.setMaxAge(1000);
			
			if(remember != null) {				
				p.setMaxAge(1000);
			} else {
				p.setMaxAge(0);
			}
			response.addCookie(u);
			response.addCookie(p);
			
			response.sendRedirect("home");
		}
	}

}
