package kh.finalproj.hollosekki.recipe.model.vo;

public class RecipeOrder {
	private int orderNo;
	private int foodNo;
	private String recipeOrder;
	private String orderStatus;
	private int recipeProcedure;
	private String recipeOriginalName;
	private String recipeRenameName;
	private String recipeImagePath;
	
	public RecipeOrder() {
		super();
	}

	public RecipeOrder(int orderNo, int foodNo, String recipeOrder, String orderStatus, int recipeProcedure,
			String recipeOriginalName, String recipeRenameName, String recipeImagePath) {
		super();
		this.orderNo = orderNo;
		this.foodNo = foodNo;
		this.recipeOrder = recipeOrder;
		this.orderStatus = orderStatus;
		this.recipeProcedure = recipeProcedure;
		this.recipeOriginalName = recipeOriginalName;
		this.recipeRenameName = recipeRenameName;
		this.recipeImagePath = recipeImagePath;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getFoodNo() {
		return foodNo;
	}

	public void setFoodNo(int foodNo) {
		this.foodNo = foodNo;
	}

	public String getRecipeOrder() {
		return recipeOrder;
	}

	public void setRecipeOrder(String recipeOrder) {
		this.recipeOrder = recipeOrder;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	public int getRecipeProcedure() {
		return recipeProcedure;
	}
	
	public void setRecipeProcedure(int recipeProcedure) {
		this.recipeProcedure = recipeProcedure;
	}

	public String getRecipeOriginalName() {
		return recipeOriginalName;
	}

	public void setRecipeOriginalName(String recipeOriginalName) {
		this.recipeOriginalName = recipeOriginalName;
	}
	
	public String getRecipeRenameName() {
		return recipeRenameName;
	}

	public void setRecipeRenameName(String recipeRenameName) {
		this.recipeRenameName = recipeRenameName;
	}
	
	public String getRecipeImagePath() {
		return recipeImagePath;
	}

	public void setRecipeImagePath(String recipeImagePath) {
		this.recipeImagePath = recipeImagePath;
	}

	@Override
	public String toString() {
		return "RecipeOrder [orderNo=" + orderNo + ", foodNo=" + foodNo + ", recipeOrder=" + recipeOrder
				+ ", orderStatus=" + orderStatus + ", recipeProcedure=" + recipeProcedure + ", recipeOriginalName="
				+ recipeOriginalName + ", recipeRenameName=" + recipeRenameName + ", recipeImagePath=" + recipeImagePath
				+ "]";
	}
}
