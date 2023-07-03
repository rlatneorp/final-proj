package kh.finalproj.hollosekki.market.model.vo;

import java.util.Date;

public class Orders {
	private int orderNo;
	private int productNo;
	private int usersNo;
	private String usersId;
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
	private String shipPrice;
	private String options;
	
	private String productName;
	private String imgName;
	
	public Orders() {}

	public Orders(int orderNo, int productNo, int usersNo, String usersId, int productType, int orderCount,
			int totalPrice, Date orderDate, String orderStatus, String orderAddress, Date orderDeliveryDate,
			String orderStock, String orderDeliveryComment, String orderInfo, String shipPrice, String options,
			String productName, String imgName) {
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.usersNo = usersNo;
		this.usersId = usersId;
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
		this.shipPrice = shipPrice;
		this.options = options;
		this.productName = productName;
		this.imgName = imgName;
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

	public String getUsersId() {
		return usersId;
	}

	public void setUsersId(String usersId) {
		this.usersId = usersId;
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

	public String getShipPrice() {
		return shipPrice;
	}

	public void setShipPrice(String shipPrice) {
		this.shipPrice = shipPrice;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	@Override
	public String toString() {
		return "Orders [orderNo=" + orderNo + ", productNo=" + productNo + ", usersNo=" + usersNo + ", usersId="
				+ usersId + ", productType=" + productType + ", orderCount=" + orderCount + ", totalPrice=" + totalPrice
				+ ", orderDate=" + orderDate + ", orderStatus=" + orderStatus + ", orderAddress=" + orderAddress
				+ ", orderDeliveryDate=" + orderDeliveryDate + ", orderStock=" + orderStock + ", orderDeliveryComment="
				+ orderDeliveryComment + ", orderInfo=" + orderInfo + ", shipPrice=" + shipPrice + ", options="
				+ options + ", productName=" + productName + ", imgName=" + imgName + "]";
	}
	
}
