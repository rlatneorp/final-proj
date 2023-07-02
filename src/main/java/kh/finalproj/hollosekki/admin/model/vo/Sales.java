package kh.finalproj.hollosekki.admin.model.vo;

public class Sales {
	private String dateKind;
	private int sales;
	private int orderCount;
	public Sales() {
		super();
	}
	public Sales(String dateKind, int sales, int orderCount) {
		super();
		this.dateKind = dateKind;
		this.sales = sales;
		this.orderCount = orderCount;
	}
	public String getDateKind() {
		return dateKind;
	}
	public void setDateKind(String dateKind) {
		this.dateKind = dateKind;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	@Override
	public String toString() {
		return "Sales [dateKind=" + dateKind + ", sales=" + sales + ", orderCount=" + orderCount + "]";
	}
	
}
