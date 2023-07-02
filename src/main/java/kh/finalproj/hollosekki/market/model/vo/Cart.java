package kh.finalproj.hollosekki.market.model.vo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class Cart {
	private int cartNo;
	private int usersNo;
	private int productNo;
	private int productOption; //수정 
	private int productOption2; //수정 
	private int cartCount;
	private int preorderNo;
	
	private int sum;
	private String shippingPrice;
	private int productPrice;
	private int sale;
	private String productName;
	private String optionValue;
	private ArrayList<Options> optionName;
	private ArrayList<Cart> cartValue;
	private String selectedOpt;
	private String imgName;
	
	
	
	public Cart() {
		super();
	}
	
	

	public Cart(int cartNo, int usersNo, int productNo, int productOption, int productOption2, int cartCount,
			int preorderNo, int sum, String shippingPrice, int productPrice, int sale, String productName,
			String optionValue, Map<String, List<String>> optionName, ArrayList<Cart> cartValue, String selectedOpt,
			String imgName) {
		super();
		this.cartNo = cartNo;
		this.usersNo = usersNo;
		this.productNo = productNo;
		this.productOption = productOption;
		this.productOption2 = productOption2;
		this.cartCount = cartCount;
		this.preorderNo = preorderNo;
		this.sum = sum;
		this.shippingPrice = shippingPrice;
		this.productPrice = productPrice;
		this.sale = sale;
		this.productName = productName;
		this.optionValue = optionValue;
		this.optionName = (ArrayList<Options>) optionName;
		this.cartValue = cartValue;
		this.selectedOpt = selectedOpt;
		this.imgName = imgName;
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



	public int getProductOption2() {
		return productOption2;
	}



	public void setProductOption2(int productOption2) {
		this.productOption2 = productOption2;
	}



	public int getCartCount() {
		return cartCount;
	}



	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}



	public int getPreorderNo() {
		return preorderNo;
	}



	public void setPreorderNo(int preorderNo) {
		this.preorderNo = preorderNo;
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



	public int getSale() {
		return sale;
	}



	public void setSale(int sale) {
		this.sale = sale;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getOptionValue() {
		return optionValue;
	}



	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}



	public ArrayList<Options> getOptionName() {
		return optionName;
	}



	public void setOptionName(ArrayList<Options> o) {
		this.optionName = o;
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



	public String getImgName() {
		return imgName;
	}



	public void setImgName(String imgName) {
		this.imgName = imgName;
	}



	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", usersNo=" + usersNo + ", productNo=" + productNo + ", productOption="
				+ productOption + ", productOption2=" + productOption2 + ", cartCount=" + cartCount + ", preorderNo="
				+ preorderNo + ", sum=" + sum + ", shippingPrice=" + shippingPrice + ", productPrice=" + productPrice
				+ ", sale=" + sale + ", productName=" + productName + ", optionValue=" + optionValue + ", optionName="
				+ optionName + ", cartValue=" + cartValue + ", selectedOpt=" + selectedOpt + ", imgName=" + imgName
				+ "]";
	}

	
	

	
	
}
