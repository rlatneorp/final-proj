package kh.finalproj.hollosekki.menu.model.vo;

public class MenuList {
	private int menuListNo;
	private int productNo;
	private int foodProductNo;
	
	public MenuList() {
		super();
	}

	public MenuList(int menuListNo, int productNo, int foodProductNo) {
		super();
		this.menuListNo = menuListNo;
		this.productNo = productNo;
		this.foodProductNo = foodProductNo;
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

	@Override
	public String toString() {
		return "MenuList [menuListNo=" + menuListNo + ", productNo=" + productNo + ", foodProductNo=" + foodProductNo
				+ "]";
	}
	
	
}
