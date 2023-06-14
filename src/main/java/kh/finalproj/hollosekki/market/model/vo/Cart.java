package kh.finalproj.hollosekki.market.model.vo;

import java.util.Arrays;

public class Cart {
	private int cartNo;
	private int usersNo;
	private int productNo;
	private String productOption;
	private int cartCount;
	
	private int sum;
	private String shippingPrice;
	private int productPrice;
	private String productName;
	
	
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Cart(int cartNo, int usersNo, int productNo, String productOption, int cartCount, int sum,
			String shippingPrice, int productPrice, String productName) {
		super();
		this.cartNo = cartNo;
		this.usersNo = usersNo;
		this.productNo = productNo;
		this.productOption = productOption;
		this.cartCount = cartCount;
		this.sum = sum;
		this.shippingPrice = shippingPrice;
		this.productPrice = productPrice;
		this.productName = productName;
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



	public int getSum() {
		return sum;
	}



	public void setSum(int sum) {
		this.sum = sum;
	}



	public String getShippingPrice() {
		return shippingPrice;
	}



	public void setShippingPrice(String shippingPrice) {
		this.shippingPrice = shippingPrice;
	}



	public int getProductPrice() {
		return productPrice;
	}



	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", usersNo=" + usersNo + ", productNo=" + productNo + ", productOption="
				+ productOption + ", cartCount=" + cartCount + ", sum=" + sum + ", shippingPrice=" + shippingPrice
				+ ", productPrice=" + productPrice + ", productName=" + productName + "]";
	}



	
	
	
	
	
}
