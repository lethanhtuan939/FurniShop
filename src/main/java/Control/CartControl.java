package Control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.DAO;
import Entity.Item;
import Entity.Product;

@WebServlet("/cart")
public class CartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		DAO dao = new DAO();
		PrintWriter out = response.getWriter();
		List<Item> itemList = new ArrayList<>();
		String id = request.getParameter("id");
		Product product = dao.getProductById("id");
		Item item = new Item(product, 1);
		
		HttpSession session = request.getSession();
		List<Item> listItemSession = (List<Item>) session.getAttribute("cart-list");
		
		if(listItemSession == null) {
			itemList.add(item);
//			out.println("added");
		} else {
			
			for (Item i : listItemSession) {
				if(i.getProduct().getId() == Integer.parseInt(id) ) {
					i.setQty(i.getQty() + 1);
				}
			}
			
			itemList = listItemSession;
		}
		session.setAttribute("cart-list", itemList);
		response.sendRedirect("allProduct");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
