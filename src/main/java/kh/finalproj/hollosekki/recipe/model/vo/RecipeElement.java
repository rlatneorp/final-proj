package kh.finalproj.hollosekki.recipe.model.vo;

public class RecipeElement {
	private int foodNo;
	private int elementNo;
	private String elementQuantity;
	private String elementName;
	
	public RecipeElement() {
		super();
	}

	public RecipeElement(int foodNo, int elementNo, String elementQuantity, String elementName) {
		super();
		this.foodNo = foodNo;
		this.elementNo = elementNo;
		this.elementQuantity = elementQuantity;
		this.elementName = elementName;
	}

	public int getFoodNo() {
		return foodNo;
	}

	public void setFoodNo(int foodNo) {
		this.foodNo = foodNo;
	}

	public int getElementNo() {
		return elementNo;
	}

	public void setElementNo(int elementNo) {
		this.elementNo = elementNo;
	}

	public String getElementQuantity() {
		return elementQuantity;
	}

	public void setElementQuantity(String elementQuantity) {
		this.elementQuantity = elementQuantity;
	}
	
	public String getElementName() {
		return elementName;
	}
	
	public void setElementName(String elementName) {
		this.elementName = elementName;
	}

	@Override
	public String toString() {
		return "RecipeElement [foodNo=" + foodNo + ", elementNo=" + elementNo + ", elementQuantity=" + elementQuantity
				 + ", elementName=" + elementName + "]";
	}
}
