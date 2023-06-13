package kh.finalproj.hollosekki.recipe.model.vo;

import java.sql.Date;

public class Recipe {
	private int foodNo;
	private int usersNo;
	private String recipeName;
	private String categoryIngredient;
	private String categorySituation;
	private String categoryType;
	private int recipeDifficulty;
	private int recipeTime;
	private String recipeContent;
	private String recipeOrder;
	private int recipeCount;
	private Date recipeCreateDate;
	private Date recipeModifyDate;
	private int recipeStatus;
	private String usersId;
	private String nickName;
	
	public Recipe() {
		super();
	}

	public Recipe(int foodNo, int usersNo, String recipeName, String categoryIngredient, String categorySituation,
			String categoryType, int recipeDifficulty, int recipeTime, String recipeContent, String recipeOrder,
			int recipeCount, Date recipeCreateDate, Date recipeModifyDate, int recipeStatus, String usersId, String nickName) {
		super();
		this.foodNo = foodNo;
		this.usersNo = usersNo;
		this.recipeName = recipeName;
		this.categoryIngredient = categoryIngredient;
		this.categorySituation = categorySituation;
		this.categoryType = categoryType;
		this.recipeDifficulty = recipeDifficulty;
		this.recipeTime = recipeTime;
		this.recipeContent = recipeContent;
		this.recipeOrder = recipeOrder;
		this.recipeCount = recipeCount;
		this.recipeCreateDate = recipeCreateDate;
		this.recipeModifyDate = recipeModifyDate;
		this.recipeStatus = recipeStatus;
		this.usersId = usersId;
		this.nickName = nickName;
		
	}

	public int getFoodNo() {
		return foodNo;
	}

	public void setFoodNo(int foodNo) {
		this.foodNo = foodNo;
	}

	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	public String getRecipeName() {
		return recipeName;
	}

	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}

	public String getCategoryIngredient() {
		return categoryIngredient;
	}

	public void setCategoryIngredient(String categoryIngredient) {
		this.categoryIngredient = categoryIngredient;
	}

	public String getCategorySituation() {
		return categorySituation;
	}

	public void setCategorySituation(String categorySituation) {
		this.categorySituation = categorySituation;
	}

	public String getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}

	public int getRecipeDifficulty() {
		return recipeDifficulty;
	}

	public void setRecipeDifficulty(int recipeDifficulty) {
		this.recipeDifficulty = recipeDifficulty;
	}

	public int getRecipeTime() {
		return recipeTime;
	}

	public void setRecipeTime(int recipeTime) {
		this.recipeTime = recipeTime;
	}

	public String getRecipeContent() {
		return recipeContent;
	}

	public void setRecipeContent(String recipeContent) {
		this.recipeContent = recipeContent;
	}

	public String getRecipeOrder() {
		return recipeOrder;
	}

	public void setRecipeOrder(String recipeOrder) {
		this.recipeOrder = recipeOrder;
	}

	public int getRecipeCount() {
		return recipeCount;
	}

	public void setRecipeCount(int recipeCount) {
		this.recipeCount = recipeCount;
	}

	public Date getRecipeCreateDate() {
		return recipeCreateDate;
	}

	public void setRecipeCreateDate(Date recipeCreateDate) {
		this.recipeCreateDate = recipeCreateDate;
	}

	public Date getRecipeModifyDate() {
		return recipeModifyDate;
	}

	public void setRecipeModifyDate(Date recipeModifyDate) {
		this.recipeModifyDate = recipeModifyDate;
	}

	public int getRecipeStatus() {
		return recipeStatus;
	}

	public void setRecipeStatus(int recipeStatus) {
		this.recipeStatus = recipeStatus;
	}
	
	public String getUsersId() {
		return usersId;
	}
	
	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}
	
	public String getNickName() {
		return nickName;
	}
	
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "Recipe [foodNo=" + foodNo + ", usersNo=" + usersNo + ", recipeName=" + recipeName
				+ ", categoryIngredient=" + categoryIngredient + ", categorySituation=" + categorySituation
				+ ", categoryType=" + categoryType + ", recipeDifficulty=" + recipeDifficulty + ", recipeTime="
				+ recipeTime + ", recipeContent=" + recipeContent + ", recipeOrder=" + recipeOrder + ", recipeCount="
				+ recipeCount + ", recipeCreateDate=" + recipeCreateDate + ", recipeModifyDate=" + recipeModifyDate
				+ ", recipeStatus=" + recipeStatus + ", usersId=" + usersId + ", nickName=" + nickName +"]";
	}
	
	
}
