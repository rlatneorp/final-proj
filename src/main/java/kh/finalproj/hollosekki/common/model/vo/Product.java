package kh.finalproj.hollosekki.common.model.vo;

import java.util.Date;

public class Product {
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
	
	public Product() {}

	public Product(int productNo, int productType, int productPrice, String productOption, int productStock,
			Date productCreateDate, Date productModifyDate, Double productSale, int productCount,
			String productStatus) {
		super();
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

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productType=" + productType + ", productPrice=" + productPrice
				+ ", productOption=" + productOption + ", productStock=" + productStock + ", productCreateDate="
				+ productCreateDate + ", productModifyDate=" + productModifyDate + ", productSale=" + productSale
				+ ", productCount=" + productCount + ", productStatus=" + productStatus + "]";
	}
	
}
