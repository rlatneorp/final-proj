package kh.finalproj.hollosekki.market.model.vo;

import java.util.ArrayList;
import java.util.Arrays;

public class Cart {
	private int cartNo;
	private int usersNo;
	private int productNo;
	private int productOption; //수정 
	private int cartCount;
	
	private int sum;
	private String shippingPrice;
	private int productPrice;
	private String productName;
	private ArrayList<Options> optionValue;
	private ArrayList<Cart> cartValue;
	private String selectedOpt;
	
	public Cart() {
		super();
	}

	public Cart(int cartNo, int usersNo, int productNo, int productOption, int cartCount, int sum, String shippingPrice,
			int productPrice, String productName, ArrayList<Options> optionValue, ArrayList<Cart> cartValue,
			String selectedOpt) {
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
		this.optionValue = optionValue;
		this.cartValue = cartValue;
		this.selectedOpt = selectedOpt;
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

	public int getProductOption() {
		return productOption;
	}

	public void setProductOption(int productOption) {
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

	public ArrayList<Options> getOptionValue() {
		return optionValue;
	}

	public void setOptionValue(ArrayList<Options> optionValue) {
		this.optionValue = optionValue;
	}

	public ArrayList<Cart> getCartValue() {
		return cartValue;
	}

	public void setCartValue(ArrayList<Cart> cartValue) {
		this.cartValue = cartValue;
	}

	public String getSelectedOpt() {
		return selectedOpt;
	}

	public void setSelectedOpt(String selectedOpt) {
		this.selectedOpt = selectedOpt;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", usersNo=" + usersNo + ", productNo=" + productNo + ", productOption="
				+ productOption + ", cartCount=" + cartCount + ", sum=" + sum + ", shippingPrice=" + shippingPrice
				+ ", productPrice=" + productPrice + ", productName=" + productName + ", optionValue=" + optionValue
				+ ", cartValue=" + cartValue + ", selectedOpt=" + selectedOpt + "]";
	}
		
}
