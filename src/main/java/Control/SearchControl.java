package Control;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.DAO;
import Entity.Product;

@WebServlet("/search")
public class SearchControl extends HttpServlet {
	private static final long serialVersionUID = 1L; 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String txtSearch = request.getParameter("searchTxt");
		DAO dao = new DAO();
		List<Product> listSearch = dao.searchByName(txtSearch);
		
		request.setAttribute("listP", listSearch);
		request.setAttribute("txtSearch", txtSearch);
		request.getRequestDispatcher("shop.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
