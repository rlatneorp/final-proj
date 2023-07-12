package kh.finalproj.hollosekki.market.model.vo;

public class Food {
	private int productNo;
	private String foodName;
	private int foodKind;
	private int foodType;
	private String foodContent;
	private int qnaNo; 
	
	public Food() {}

	public Food(int productNo, String foodName, int foodKind, int foodType, String foodContent, int qnaNo) {
		super();
		this.productNo = productNo;
		this.foodName = foodName;
		this.foodKind = foodKind;
		this.foodType = foodType;
		this.foodContent = foodContent;
		this.qnaNo = qnaNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
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

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	@Override
	public String toString() {
		return "Food [productNo=" + productNo + ", foodName=" + foodName + ", foodKind=" + foodKind + ", foodType="
				+ foodType + ", foodContent=" + foodContent + ", qnaNo=" + qnaNo + "]";
	}


}
