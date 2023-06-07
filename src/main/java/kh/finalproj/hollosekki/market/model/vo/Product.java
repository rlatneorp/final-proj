package kh.finalproj.hollosekki.market.model.vo;

import java.sql.Date;

public class Product {
	private int productNo;
	private String ProductName;
	private int productType;
	private int productPrice;
	private String productOption;
	private int productStock;
	private Date productCreateDate;
	private Date ProductModifyDate;
	private int productSale;
	private int productCount;
	private String productStatus;
	private String productImg;
	
	public Product() {
		super();
	}

	public Product(int productNo, String productName, int productType, int productPrice, String productOption,
			int productStock, Date productCreateDate, Date productModifyDate, int productSale, int productCount,
			String productStatus, String productImg) {
		super();
		this.productNo = productNo;
		ProductName = productName;
		this.productType = productType;
		this.productPrice = productPrice;
		this.productOption = productOption;
		this.productStock = productStock;
		this.productCreateDate = productCreateDate;
		ProductModifyDate = productModifyDate;
		this.productSale = productSale;
		this.productCount = productCount;
		this.productStatus = productStatus;
		this.productImg = productImg;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return ProductName;
	}

	public void setProductName(String productName) {
		ProductName = productName;
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
		return ProductModifyDate;
	}

	public void setProductModifyDate(Date productModifyDate) {
		ProductModifyDate = productModifyDate;
	}

	public int getProductSale() {
		return productSale;
	}

	public void setProductSale(int productSale) {
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

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", ProductName=" + ProductName + ", productType=" + productType
				+ ", productPrice=" + productPrice + ", productOption=" + productOption + ", productStock="
				+ productStock + ", productCreateDate=" + productCreateDate + ", ProductModifyDate=" + ProductModifyDate
				+ ", productSale=" + productSale + ", productCount=" + productCount + ", productStatus=" + productStatus
				+ ", productImg=" + productImg + "]";
	}

	
}
