package kh.finalproj.hollosekki.common.model.vo;

import java.util.Date;

public class Ingredient {
	private int ingredientNo;
	private String ingredientName; 
	private String ingredientType;
	private String ingredientContent;
	private String ingredientStatus;
	private String isAccept;
	private int usersNo;
	
	private int productNo;
	private int productType;
	private int productPrice;
	private int productStock;
	private Date productCreateDate;
	private Date productModifyDate;
	private double productSale;
	private int productCount;
	private String productStatus;
	
	public Ingredient() {}

	public Ingredient(int ingredientNo, String ingredientName, String ingredientType, String ingredientContent,
			String ingredientStatus, String isAccept, int usersNo, int productNo, int productType, int productPrice,
			int productStock, Date productCreateDate, Date productModifyDate, double productSale, int productCount,
			String productStatus) {
		super();
		this.ingredientNo = ingredientNo;
		this.ingredientName = ingredientName;
		this.ingredientType = ingredientType;
		this.ingredientContent = ingredientContent;
		this.ingredientStatus = ingredientStatus;
		this.isAccept = isAccept;
		this.usersNo = usersNo;
		this.productNo = productNo;
		this.productType = productType;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.productCreateDate = productCreateDate;
		this.productModifyDate = productModifyDate;
		this.productSale = productSale;
		this.productCount = productCount;
		this.productStatus = productStatus;
	}

	public int getIngredientNo() {
		return ingredientNo;
	}

	public void setIngredientNo(int ingredientNo) {
		this.ingredientNo = ingredientNo;
	}

	public String getIngredientName() {
		return ingredientName;
	}

	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}

	public String getIngredientType() {
		return ingredientType;
	}

	public void setIngredientType(String ingredientType) {
		this.ingredientType = ingredientType;
	}

	public String getIngredientContent() {
		return ingredientContent;
	}

	public void setIngredientContent(String ingredientContent) {
		this.ingredientContent = ingredientContent;
	}

	public String getIngredientStatus() {
		return ingredientStatus;
	}

	public void setIngredientStatus(String ingredientStatus) {
		this.ingredientStatus = ingredientStatus;
	}

	public String getIsAccept() {
		return isAccept;
	}

	public void setIsAccept(String isAccept) {
		this.isAccept = isAccept;
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

	public int getProductType() {
		return productType;
	}

	public void setProductType(int productType) {
		this.productType = productType;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductStock() {
		return productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public Date getProductCreateDate() {
		return productCreateDate;
	}

	public void setProductCreateDate(Date productCreateDate) {
		this.productCreateDate = productCreateDate;
	}

	public Date getProductModifyDate() {
		return productModifyDate;
	}

	public void setProductModifyDate(Date productModifyDate) {
		this.productModifyDate = productModifyDate;
	}

	public double getProductSale() {
		return productSale;
	}

	public void setProductSale(double productSale) {
		this.productSale = productSale;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	@Override
	public String toString() {
		return "Ingredient [ingredientNo=" + ingredientNo + ", ingredientName=" + ingredientName + ", ingredientType="
				+ ingredientType + ", ingredientContent=" + ingredientContent + ", ingredientStatus=" + ingredientStatus
				+ ", isAccept=" + isAccept + ", usersNo=" + usersNo + ", productNo=" + productNo + ", productType="
				+ productType + ", productPrice=" + productPrice + ", productStock=" + productStock
				+ ", productCreateDate=" + productCreateDate + ", productModifyDate=" + productModifyDate
				+ ", productSale=" + productSale + ", productCount=" + productCount + ", productStatus=" + productStatus
				+ "]";
	}
	
}