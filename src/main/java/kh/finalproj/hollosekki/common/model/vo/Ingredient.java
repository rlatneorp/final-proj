package kh.finalproj.hollosekki.common.model.vo;

import java.util.Date;

public class Ingredient extends Product {
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
	private String productOption;
	private int productStock;
	private Date productCreateDate;
	private Date productModifyDate;
	private Double productSale;
	private int productCount;
	private String productStatus;
	
	private int orderCount;
	private int viewCount;
	private int likeCount;
	
	public Ingredient() {}

	public Ingredient(int ingredientNo, String ingredientName, String ingredientType, String ingredientContent,
			String ingredientStatus, String isAccept, int usersNo, int productNo, int productType, int productPrice,
			String productOption, int productStock, Date productCreateDate, Date productModifyDate, Double productSale,
			int productCount, String productStatus, int orderCount, int viewCount, int likeCount) {
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
		this.productOption = productOption;
		this.productStock = productStock;
		this.productCreateDate = productCreateDate;
		this.productModifyDate = productModifyDate;
		this.productSale = productSale;
		this.productCount = productCount;
		this.productStatus = productStatus;
		this.orderCount = orderCount;
		this.viewCount = viewCount;
		this.likeCount = likeCount;
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

	public String getProductOption() {
		return productOption;
	}

	public void setProductOption(String productOption) {
		this.productOption = productOption;
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

	public Double getProductSale() {
		return productSale;
	}

	public void setProductSale(Double productSale) {
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

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	@Override
	public String toString() {
		return "Ingredient [ingredientNo=" + ingredientNo + ", ingredientName=" + ingredientName + ", ingredientType="
				+ ingredientType + ", ingredientContent=" + ingredientContent + ", ingredientStatus=" + ingredientStatus
				+ ", isAccept=" + isAccept + ", usersNo=" + usersNo + ", productNo=" + productNo + ", productType="
				+ productType + ", productPrice=" + productPrice + ", productOption=" + productOption
				+ ", productStock=" + productStock + ", productCreateDate=" + productCreateDate + ", productModifyDate="
				+ productModifyDate + ", productSale=" + productSale + ", productCount=" + productCount
				+ ", productStatus=" + productStatus + ", orderCount=" + orderCount + ", viewCount=" + viewCount
				+ ", likeCount=" + likeCount + "]";
	}

}
