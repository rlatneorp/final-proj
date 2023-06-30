package kh.finalproj.hollosekki.menu.model.vo;

public class MenuList {
	private int menuListNo;
	private int productNo;
	private int foodProductNo;
	private String foodName;
	private String foodContent;
	
	public MenuList() {
		super();
	}

	public MenuList(int menuListNo, int productNo, int foodProductNo, String foodName, String foodContent) {
		super();
		this.menuListNo = menuListNo;
		this.productNo = productNo;
		this.foodProductNo = foodProductNo;
		this.foodName = foodName;
		this.foodContent = foodContent;
	}

	public int getMenuListNo() {
		return menuListNo;
	}

	public void setMenuListNo(int menuListNo) {
		this.menuListNo = menuListNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getFoodProductNo() {
		return foodProductNo;
	}

	public void setFoodProductNo(int foodProductNo) {
		this.foodProductNo = foodProductNo;
	}
	
	public String getFoodName() {
		return foodName;
	}
	
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	
	public String getFoodContent() {
		return foodContent;
	}
	
	public void setFoodContent(String foodContent) {
		this.foodContent = foodContent;
	}

	@Override
	public String toString() {
		return "MenuList [menuListNo=" + menuListNo + ", productNo=" + productNo + ", foodProductNo=" + foodProductNo
				+ ", foodName=" + foodName + ", foodContent=" + foodContent +"]";
	}
	
	
}
