package Control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.DAO;
import Entity.Product;

@WebServlet("/SearchByAjax")
public class SearchByAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String txtSearch = request.getParameter("searchTxt");
		DAO dao = new DAO();
		List<Product> listSearch = dao.searchByName(txtSearch);
		
		PrintWriter out = response.getWriter();
		for (Product o : listSearch) {
			out.println("<div class=\"col-12 col-md-4 col-lg-3 mb-5\">\r\n"
					+ "						<a class=\"product-item\" href=\"#\">\r\n"
					+ "							<img src=\""+o.getImage()+"\" class=\"img-fluid product-thumbnail\">\r\n"
					+ "							<h3 class=\"product-title\">"+o.getName()+"</h3>\r\n"
					+ "							<strong class=\"product-price\">"+o.getPrice()+"</strong>\r\n"
					+ "	\r\n"
					+ "							<span class=\"icon-cross\">\r\n"
					+ "								<img src=\"images/cross.svg\" class=\"img-fluid\">\r\n"
					+ "							</span>\r\n"
					+ "						</a>\r\n"
					+ "					</div>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
