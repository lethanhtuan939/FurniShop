package Database;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Context.DBContext;
import Entity.Product;
import Entity.Users;

public class DAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public Users checkLogin(String username, String password) {
		String query = "SELECT * FROM Account\r\n"
				+ "WHERE username = ? and password = ?";
		
		try {
			new DBContext();
			conn = DBContext.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				return new Users(rs.getString("username"), 
									rs.getString("password"), 
									rs.getByte("isAdmin"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Users checkUsernameExist(String user) {
		String query = "SELECT * FROM Account\r\n"
				+ "WHERE username = ?";
		
		try {
			new DBContext();
			conn = DBContext.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);;
			rs = ps.executeQuery();
			
			while(rs.next()) {
				return new Users(rs.getString("username"), 
						rs.getString("password"), 
						rs.getByte("isAdmin"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public void signup(String user, String pass) {
		String query = "INSERT INTO Account\r\n"
				+ "VALUES (?, ?, 0, 0)";
		
		try {
			new DBContext();
			conn = DBContext.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);;
			ps.setString(2, pass);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Product> getAllProduct() {
		List<Product> list = new ArrayList<>();
		String query = "Select * from product";
		
		try {
			new DBContext();
			conn = DBContext.getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Product(rs.getInt(1), 
						rs.getString(2),
						rs.getString(3), 
						rs.getDouble(4), 
						rs.getString(5)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Product> getProductByCateID(String id) {
		List<Product> list = new ArrayList<>();
		String query = "select * from product where cateID = ?";
		
		try {
			new DBContext();
			conn = DBContext.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Product(rs.getInt(1), 
						rs.getString(2),
						rs.getString(3), 
						rs.getDouble(4), 
						rs.getString(5)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Product> searchByName(String txtSearch) {
		List<Product> list = new ArrayList<>();
		String query = "Select * from Product where [name] like ?";
		
		try {
			new DBContext();
			conn = DBContext.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + txtSearch + "%");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Product(rs.getInt(1), 
						rs.getString(2),
						rs.getString(3), 
						rs.getDouble(4), 
						rs.getString(5)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Product> getTop3LastestProduct() {
		List<Product> listP = new ArrayList<>();
		
		String query = "select top 3 * from product\r\n"
				+ "order by id DESC";
		
		try {
			new DBContext();
			conn = DBContext.getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				listP.add(new Product(rs.getInt(1), 
						rs.getString(2),
						rs.getString(3), 
						rs.getDouble(4), 
						rs.getString(5)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listP;
	}
	
	public Product getProductById(String id) {
		String query = "SELECT * FROM Product \r\n"
				+ "WHERE id = ?";
		try {
			new DBContext();
			conn = DBContext.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				return new Product(rs.getInt(1), 
						rs.getString(2),
						rs.getString(3), 
						rs.getDouble(4), 
						rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static void main(String[] args) {
		DAO dao = new DAO();
//		List<Product> list = dao.getAllProduct();
//		List<Product> list2 = dao.searchByName("Ghế");
//		for (Product o : list2) {
//			System.out.println(o);
//		}
		Product p = dao.getProductById("12");
		System.out.println(p);
	}
}
