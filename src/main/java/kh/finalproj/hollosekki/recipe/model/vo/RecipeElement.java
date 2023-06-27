package kh.finalproj.hollosekki.recipe.model.vo;

public class RecipeElement {
	private int foodNo;
	private int elementNo;
	private String elementQuantity;
	
	public RecipeElement() {
		super();
	}

	public RecipeElement(int foodNo, int elementNo, String elementQuantity) {
		super();
		this.foodNo = foodNo;
		this.elementNo = elementNo;
		this.elementQuantity = elementQuantity;
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

	@Override
	public String toString() {
		return "RecipeElement [foodNo=" + foodNo + ", elementNo=" + elementNo + ", elementQuantity=" + elementQuantity
				+ "]";
	}
}
