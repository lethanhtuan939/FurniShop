package Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.DAO;
import Entity.Users;

@WebServlet("/signup")
public class SignupControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirm_password = request.getParameter("confirm_password");
		
		if(!(password.equals(confirm_password))) {
			request.setAttribute("errorPassword", "Confirm password is false");
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		} else {
			DAO dao = new DAO();
			Users user = dao.checkUsernameExist(username);
			if(user == null) {
				// acept sign up
				dao.signup(username, password);
				response.sendRedirect("login");
			} else {
				request.setAttribute("errorUser", "Username is existed");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
