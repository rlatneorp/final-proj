package kh.finalproj.hollosekki.customer.model.vo;

import java.util.Date;

public class Customer {
	private int faqNo;
	private int usersNo;
	private String faqTitle;
	private String faqContent;
	private Date faqDate;
	private String faqStatus;
	private int faqType;
	
	
	public Customer() {}

	public Customer(int faqNo, int usersNo, String faqTitle, String faqContent, Date faqDate, String faqStatus,
			int faqType) {
		super();
		this.faqNo = faqNo;
		this.usersNo = usersNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqDate = faqDate;
		this.faqStatus = faqStatus;
		this.faqType = faqType;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public Date getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}

	public String getFaqStatus() {
		return faqStatus;
	}

	public void setFaqStatus(String faqStatus) {
		this.faqStatus = faqStatus;
	}

	public int getFaqType() {
		return faqType;
	}

	public void setFaqType(int faqType) {
		this.faqType = faqType;
	}

	@Override
	public String toString() {
		return "Customer [faqNo=" + faqNo + ", usersNo=" + usersNo + ", faqTitle=" + faqTitle + ", faqContent="
				+ faqContent + ", faqDate=" + faqDate + ", faqStatus=" + faqStatus + ", faqType=" + faqType + "]";
	}

	
	
}
