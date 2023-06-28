package kh.finalproj.hollosekki.market.model.vo;

import java.sql.Date;

public class Orders {
	private int orderNo;
	private int productNo;
	private int usersNo;
	private int productType;
	private int orderCount;
	private int totalPrice;
	private Date orderDate;
	private String orderStatus;
	private String orderAddress;
	private Date orderDeliveryDate;
	private String orderStock;
	private String orderDeliveryComment;
	private String orderInfo;
	
	
	public Orders() {}


	public Orders(int orderNo, int productNo, int usersNo, int productType, int orderCount, int totalPrice,
			Date orderDate, String orderStatus, String orderAddress, Date orderDeliveryDate, String orderStock,
			String orderDeliveryComment, String orderInfo) {
		super();
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.usersNo = usersNo;
		this.productType = productType;
		this.orderCount = orderCount;
		this.totalPrice = totalPrice;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.orderAddress = orderAddress;
		this.orderDeliveryDate = orderDeliveryDate;
		this.orderStock = orderStock;
		this.orderDeliveryComment = orderDeliveryComment;
		this.orderInfo = orderInfo;
	}


	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public int getUsersNo() {
		return usersNo;
	}


	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}


	public int getProductType() {
		return productType;
	}


	public void setProductType(int productType) {
		this.productType = productType;
	}


	public int getOrderCount() {
		return orderCount;
	}


	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public Date getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}


	public String getOrderStatus() {
		return orderStatus;
	}


	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}


	public String getOrderAddress() {
		return orderAddress;
	}


	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}


	public Date getOrderDeliveryDate() {
		return orderDeliveryDate;
	}


	public void setOrderDeliveryDate(Date orderDeliveryDate) {
		this.orderDeliveryDate = orderDeliveryDate;
	}


	public String getOrderStock() {
		return orderStock;
	}


	public void setOrderStock(String orderStock) {
		this.orderStock = orderStock;
	}


	public String getOrderDeliveryComment() {
		return orderDeliveryComment;
	}


	public void setOrderDeliveryComment(String orderDeliveryComment) {
		this.orderDeliveryComment = orderDeliveryComment;
	}


	public String getOrderInfo() {
		return orderInfo;
	}


	public void setOrderInfo(String orderInfo) {
		this.orderInfo = orderInfo;
	}


	@Override
	public String toString() {
		return "Orders [orderNo=" + orderNo + ", productNo=" + productNo + ", usersNo=" + usersNo + ", productType="
				+ productType + ", orderCount=" + orderCount + ", totalPrice=" + totalPrice + ", orderDate=" + orderDate
				+ ", orderStatus=" + orderStatus + ", orderAddress=" + orderAddress + ", orderDeliveryDate="
				+ orderDeliveryDate + ", orderStock=" + orderStock + ", orderDeliveryComment=" + orderDeliveryComment
				+ ", orderInfo=" + orderInfo + "]";
	}
	
	
	
}
