package kh.finalproj.hollosekki.market.model.vo;

public class Tool {
	private int productNo;
	private String toolName;
	private int toolType;
	private String toolContent;
	
	public Tool() {}
	public Tool(int productNo, String toolName, int toolType, String toolContent) {
		super();
		this.productNo = productNo;
		this.toolName = toolName;
		this.toolType = toolType;
		this.toolContent = toolContent;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public String getToolName() {
		return toolName;
	}


	public void setToolName(String toolName) {
		this.toolName = toolName;
	}


	public int getToolType() {
		return toolType;
	}


	public void setToolType(int toolType) {
		this.toolType = toolType;
	}


	public String getToolContent() {
		return toolContent;
	}


	public void setToolContent(String toolContent) {
		this.toolContent = toolContent;
	}


	@Override
	public String toString() {
		return "Tool [productNo=" + productNo + ", toolName=" + toolName + ", toolType=" + toolType + ", toolContent="
				+ toolContent + "]";
	}
	
	
	
	
	
	
}
