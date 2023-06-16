package kh.finalproj.hollosekki.common.model.vo;

public class Menu extends Product{
	private String menuName;
	private int menuType;	
// 1: 다이어트 2: 육류 3: 해산물
	private String menuContent;
	private String foodProductNo;
	private String menuTarget;
	private String nutrient;
	
	public Menu() {
		super();
	}

	public Menu(String menuName, int menuType, String menuContent, String foodProductNo, String menuTarget,
			String nutrient) {
		super();
		this.menuName = menuName;
		this.menuType = menuType;
		this.menuContent = menuContent;
		this.foodProductNo = foodProductNo;
		this.menuTarget = menuTarget;
		this.nutrient = nutrient;
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

	@Override
	public String toString() {
		return "Menu [menuName=" + menuName + ", menuType=" + menuType + ", menuContent=" + menuContent
				+ ", foodProductNo=" + foodProductNo + ", menuTarget=" + menuTarget + ", nutrient=" + nutrient + "]";
	}

}
