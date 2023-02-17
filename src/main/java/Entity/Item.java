package Entity;

public class Item {
	private Product product;
	private int qty;
	
	public Item(Product product, int qty) {
		this.product = product;
		this.qty = qty;
	}
	
	public Item() {
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "Item [product=" + product + ", qty=" + qty + "]";
	}
}
