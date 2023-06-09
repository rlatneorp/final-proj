package kh.finalproj.hollosekki.market.model.vo;

public class Cart {
	private int cartNo;
	private int usersNo;
	private int productNo;
	private String productOption;
	private int cartCount;
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cart(int cartNo, int usersNo, int productNo, String productOption, int cartCount) {
		super();
		this.cartNo = cartNo;
		this.usersNo = usersNo;
		this.productNo = productNo;
		this.productOption = productOption;
		this.cartCount = cartCount;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getUsersNo() {
		return usersNo;
	}
	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductOption() {
		return productOption;
	}
	public void setProductOption(String productOption) {
		this.productOption = productOption;
	}
	public int getCartCount() {
		return cartCount;
	}
	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}
	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", usersNo=" + usersNo + ", productNo=" + productNo + ", productOption="
				+ productOption + ", cartCount=" + cartCount + "]";
	}
	
	
}
