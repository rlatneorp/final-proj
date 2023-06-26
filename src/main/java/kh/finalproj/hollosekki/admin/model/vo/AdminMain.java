package kh.finalproj.hollosekki.admin.model.vo;

import java.util.Date;

public class AdminMain {
	private Date day;
	private int orderDayCount;
	private int orderDaySales;
	private int orderMonthCount;
	private int orderMonthSales;
	
	private int recipeDayCount;
	private int recipeMonthCount;
	private int recipeTotalCount;
	
	private int enrollDayCount;
	private int enrollMonthCount;
	private int enrollTotalCount;
	
	private int menuDayCount;
	private int menuDaySales;
	private int menuMonthCount;
	private int menuMonthSales;
	
	public AdminMain() {
		super();
	}
	public AdminMain(Date day, int orderDayCount, int orderDaySales, int orderMonthCount, int orderMonthSales,
			int recipeDayCount, int recipeMonthCount, int recipeTotalCount, int enrollDayCount, int enrollMonthCount,
			int enrollTotalCount, int menuDayCount, int menuDaySales, int menuMonthCount, int menuMonthSales) {
		super();
		this.day = day;
		this.orderDayCount = orderDayCount;
		this.orderDaySales = orderDaySales;
		this.orderMonthCount = orderMonthCount;
		this.orderMonthSales = orderMonthSales;
		this.recipeDayCount = recipeDayCount;
		this.recipeMonthCount = recipeMonthCount;
		this.recipeTotalCount = recipeTotalCount;
		this.enrollDayCount = enrollDayCount;
		this.enrollMonthCount = enrollMonthCount;
		this.enrollTotalCount = enrollTotalCount;
		this.menuDayCount = menuDayCount;
		this.menuDaySales = menuDaySales;
		this.menuMonthCount = menuMonthCount;
		this.menuMonthSales = menuMonthSales;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public int getOrderDayCount() {
		return orderDayCount;
	}
	public void setOrderDayCount(int orderDayCount) {
		this.orderDayCount = orderDayCount;
	}
	public int getOrderDaySales() {
		return orderDaySales;
	}
	public void setOrderDaySales(int orderDaySales) {
		this.orderDaySales = orderDaySales;
	}
	public int getOrderMonthCount() {
		return orderMonthCount;
	}
	public void setOrderMonthCount(int orderMonthCount) {
		this.orderMonthCount = orderMonthCount;
	}
	public int getOrderMonthSales() {
		return orderMonthSales;
	}
	public void setOrderMonthSales(int orderMonthSales) {
		this.orderMonthSales = orderMonthSales;
	}
	public int getRecipeDayCount() {
		return recipeDayCount;
	}
	public void setRecipeDayCount(int recipeDayCount) {
		this.recipeDayCount = recipeDayCount;
	}
	public int getRecipeMonthCount() {
		return recipeMonthCount;
	}
	public void setRecipeMonthCount(int recipeMonthCount) {
		this.recipeMonthCount = recipeMonthCount;
	}
	public int getRecipeTotalCount() {
		return recipeTotalCount;
	}
	public void setRecipeTotalCount(int recipeTotalCount) {
		this.recipeTotalCount = recipeTotalCount;
	}
	public int getEnrollDayCount() {
		return enrollDayCount;
	}
	public void setEnrollDayCount(int enrollDayCount) {
		this.enrollDayCount = enrollDayCount;
	}
	public int getEnrollMonthCount() {
		return enrollMonthCount;
	}
	public void setEnrollMonthCount(int enrollMonthCount) {
		this.enrollMonthCount = enrollMonthCount;
	}
	public int getEnrollTotalCount() {
		return enrollTotalCount;
	}
	public void setEnrollTotalCount(int enrollTotalCount) {
		this.enrollTotalCount = enrollTotalCount;
	}
	public int getMenuDayCount() {
		return menuDayCount;
	}
	public void setMenuDayCount(int menuDayCount) {
		this.menuDayCount = menuDayCount;
	}
	public int getMenuDaySales() {
		return menuDaySales;
	}
	public void setMenuDaySales(int menuDaySales) {
		this.menuDaySales = menuDaySales;
	}
	public int getMenuMonthCount() {
		return menuMonthCount;
	}
	public void setMenuMonthCount(int menuMonthCount) {
		this.menuMonthCount = menuMonthCount;
	}
	public int getMenuMonthSales() {
		return menuMonthSales;
	}
	public void setMenuMonthSales(int menuMonthSales) {
		this.menuMonthSales = menuMonthSales;
	}
	@Override
	public String toString() {
		return "AdminMain [day=" + day + ", orderDayCount=" + orderDayCount + ", orderDaySales=" + orderDaySales
				+ ", orderMonthCount=" + orderMonthCount + ", orderMonthSales=" + orderMonthSales + ", recipeDayCount="
				+ recipeDayCount + ", recipeMonthCount=" + recipeMonthCount + ", recipeTotalCount=" + recipeTotalCount
				+ ", enrollDayCount=" + enrollDayCount + ", enrollMonthCount=" + enrollMonthCount
				+ ", enrollTotalCount=" + enrollTotalCount + ", menuDayCount=" + menuDayCount + ", menuDaySales="
				+ menuDaySales + ", menuMonthCount=" + menuMonthCount + ", menuMonthSales=" + menuMonthSales + "]";
	}
}
