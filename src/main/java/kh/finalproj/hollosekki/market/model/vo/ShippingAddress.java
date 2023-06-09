package kh.finalproj.hollosekki.market.model.vo;

import java.util.Arrays;

public class ShippingAddress {
	private int usersNo;
	private String recipient;
	private String address;
	private String homePhone;
	private String phone;
	private int shippingNo;
	private String shippingName;
	
	public ShippingAddress() {}


	public ShippingAddress(int usersNo, String recipient, String address, String homePhone, String phone,
			int shippingNo, String shippingName) {
		super();
		this.usersNo = usersNo;
		this.recipient = recipient;
		this.address = address;
		this.homePhone = homePhone;
		this.phone = phone;
		this.shippingNo = shippingNo;
		this.shippingName = shippingName;
	}


	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHomePhone() {
		return homePhone;
	}

	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getShippingNo() {
		return shippingNo;
	}

	public void setShippingNo(int shippingNo) {
		this.shippingNo = shippingNo;
	}

	public String getShippingName() {
		return shippingName;
	}

	public void setShippingName(String shippingName) {
		this.shippingName = shippingName;
	}

	@Override
	public String toString() {
		return "ShippingAddress [usersNo=" + usersNo + ", recipient=" + recipient + ", address=" + address
				+ ", homePhone=" + homePhone + ", phone=" + phone + ", shippingNo=" + shippingNo + ", shippingName="
				+ shippingName + "]";
	}
	
	
}
