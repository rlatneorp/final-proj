package kh.finalproj.hollosekki.market.model.vo;

public class Options {
	private int optionNo;
	private int productNo;
	private String optionName;
	private String optionValue;
	
	
	public Options() {}
	
	public Options(int optionNo, int productNo, String optionName, String optionValue) {
		super();
		this.optionNo = optionNo;
		this.productNo = productNo;
		this.optionName = optionName;
		this.optionValue = optionValue;
	}




	public int getOptionNo() {
		return optionNo;
	}




	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}




	public int getProductNo() {
		return productNo;
	}




	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}




	public String getOptionName() {
		return optionName;
	}




	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}




	public String getOptionValue() {
		return optionValue;
	}




	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}




	@Override
	public String toString() {
		return "Options [optionNo=" + optionNo + ", productNo=" + productNo + ", optionName=" + optionName
				+ ", optionValue=" + optionValue + "]";
	}
	
	
}
