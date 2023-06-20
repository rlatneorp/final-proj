package kh.finalproj.hollosekki.common.model.vo;

import java.util.Arrays;

public class Tool extends Product{
	private String toolName;
	private int toolType;
	private String toolContent; 
	private String toolTarget;
	private String[] optionTotal;
	
	public Tool() {
		super();
	}

	public Tool(String toolName, int toolType, String toolContent, String toolTarget, String[] optionTotal) {
		super();
		this.toolName = toolName;
		this.toolType = toolType;
		this.toolContent = toolContent;
		this.toolTarget = toolTarget;
		this.optionTotal = optionTotal;
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

	public String getToolTarget() {
		return toolTarget;
	}

	public void setToolTarget(String toolTarget) {
		this.toolTarget = toolTarget;
	}

	public String[] getOptionTotal() {
		return optionTotal;
	}

	public void setOptionTotal(String[] optionTotal) {
		this.optionTotal = optionTotal;
	}

	@Override
	public String toString() {
		return "Tool [toolName=" + toolName + ", toolType=" + toolType + ", toolContent=" + toolContent
				+ ", toolTarget=" + toolTarget + ", optionTotal=" + Arrays.toString(optionTotal) + "]";
	}
	
}
