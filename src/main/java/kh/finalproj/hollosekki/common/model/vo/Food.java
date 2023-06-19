package kh.finalproj.hollosekki.common.model.vo;

public class Food extends Product{
	private String foodName;
	private int foodKind;
	private int foodType;
	private String foodContent;
	private String foodTarget;
	private String foodTable;
	private String nutrient;
	
	public Food() {
		super();
	}

	public Food(String foodName, int foodKind, int foodType, String foodContent, String foodTarget, String foodTable,
			String nutrient) {
		super();
		this.foodName = foodName;
		this.foodKind = foodKind;
		this.foodType = foodType;
		this.foodContent = foodContent;
		this.foodTarget = foodTarget;
		this.foodTable = foodTable;
		this.nutrient = nutrient;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public int getFoodKind() {
		return foodKind;
	}

	public void setFoodKind(int foodKind) {
		this.foodKind = foodKind;
	}

	public int getFoodType() {
		return foodType;
	}

	public void setFoodType(int foodType) {
		this.foodType = foodType;
	}

	public String getFoodContent() {
		return foodContent;
	}

	public void setFoodContent(String foodContent) {
		this.foodContent = foodContent;
	}

	public String getFoodTarget() {
		return foodTarget;
	}

	public void setFoodTarget(String foodTarget) {
		this.foodTarget = foodTarget;
	}

	public String getFoodTable() {
		return foodTable;
	}

	public void setFoodTable(String foodTable) {
		this.foodTable = foodTable;
	}

	public String getNutrient() {
		return nutrient;
	}

	public void setNutrient(String nutrient) {
		this.nutrient = nutrient;
	}

	@Override
	public String toString() {
		return "Food [foodName=" + foodName + ", foodKind=" + foodKind + ", foodType=" + foodType + ", foodContent="
				+ foodContent + ", foodTarget=" + foodTarget + ", foodTable=" + foodTable + ", nutrient=" + nutrient
				+ "]";
	}

}
