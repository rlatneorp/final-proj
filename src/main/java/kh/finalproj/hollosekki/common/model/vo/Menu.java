package kh.finalproj.hollosekki.common.model.vo;

public class Menu extends Product{
	private String menuName;
	private int menuType;	
// 1: 다이어트 2: 육류 3: 해산물
	private String menuContent;
	private String foodProductNo;
	private String menuTarget;
	private String nutrient;
	private int menuKind;
	private int menuNo;
	private int productPrice;
	
	public Menu() {
		super();
	}

	public Menu(String menuName, int menuType, String menuContent, String foodProductNo, String menuTarget,
			String nutrient, int menuKind, int menuNo, int productPrice) {
		super();
		this.menuName = menuName;
		this.menuType = menuType;
		this.menuContent = menuContent;
		this.foodProductNo = foodProductNo;
		this.menuTarget = menuTarget;
		this.nutrient = nutrient;
		this.menuKind= menuKind;
		this.menuNo = menuNo;
		this.productPrice = productPrice;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getMenuType() {
		return menuType;
	}

	public void setMenuType(int menuType) {
		this.menuType = menuType;
	}

	public String getMenuContent() {
		return menuContent;
	}

	public void setMenuContent(String menuContent) {
		this.menuContent = menuContent;
	}

	public String getFoodProductNo() {
		return foodProductNo;
	}

	public void setFoodProductNo(String foodProductNo) {
		this.foodProductNo = foodProductNo;
	}

	public String getMenuTarget() {
		return menuTarget;
	}

	public void setMenuTarget(String menuTarget) {
		this.menuTarget = menuTarget;
	}

	public String getNutrient() {
		return nutrient;
	}

	public void setNutrient(String nutrient) {
		this.nutrient = nutrient;
	}
	
	public int getProductPrice() {
		return productPrice;
	}
	
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	
	public int getMenuKind() {
		return menuKind;
	}
	
	public void setMenuKind(int menuKind) {
		this.menuKind = menuKind;
	}
	
	public int getMenuNo() {
		return menuNo;
	}
	
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}

	@Override
	public String toString() {
		return "Menu [menuName=" + menuName + ", menuType=" + menuType + ", menuContent=" + menuContent
				+ ", foodProductNo=" + foodProductNo + ", menuTarget=" + menuTarget + ", nutrient=" + nutrient
				+ ", menuKind=" + menuKind + ", menuNo=" + menuNo + ", productPrice=" + productPrice + "]";
	}
}
