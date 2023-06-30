package kh.finalproj.hollosekki.common.model.vo;

import java.util.Date;

public class FAQ {
	private int faqNo;
	private int usersNo;
	private String faqTitle;
	private String faqContent;
	private String faqAnswer;
	private Date faqDate;
	private String faqStatus;
	private Integer faqType;
	public FAQ() {
	}
	public FAQ(int faqNo, int usersNo, String faqTitle, String faqContent, String faqAnswer, Date faqDate,
			String faqStatus, Integer faqType) {
		this.faqNo = faqNo;
		this.usersNo = usersNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqAnswer = faqAnswer;
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
	public String getFaqAnswer() {
		return faqAnswer;
	}
	public void setFaqAnswer(String faqAnswer) {
		this.faqAnswer = faqAnswer;
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
	public Integer getFaqType() {
		return faqType;
	}
	public void setFaqType(Integer faqType) {
		this.faqType = faqType;
	}
	@Override
	public String toString() {
		return "FAQ [faqNo=" + faqNo + ", usersNo=" + usersNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent
				+ ", faqAnswer=" + faqAnswer + ", faqDate=" + faqDate + ", faqStatus=" + faqStatus + ", faqType="
				+ faqType + "]";
	}
	
	
}
