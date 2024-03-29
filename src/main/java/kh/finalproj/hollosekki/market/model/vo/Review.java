package kh.finalproj.hollosekki.market.model.vo;

import java.sql.Date;

import kh.finalproj.hollosekki.common.model.vo.Image;

public class Review extends Image{

	private int productNo;
	private int orderNo;
	private int reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private int reviewScore;
	private String reviewStatus;
	private Date reviewDate;
	private String reviewWriter;
	private String reviewStar;
	private int usersNo;
	
	public Review() {
		super();
	}

	public Review(int productNo, int orderNo, int reviewNo, String reviewTitle, String reviewContent, int reviewScore,
			String reviewStatus, Date reviewDate, String reviewWriter, String reviewStar, int usersNo) {
		super();
		this.productNo = productNo;
		this.orderNo = orderNo;
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewScore = reviewScore;
		this.reviewStatus = reviewStatus;
		this.reviewDate = reviewDate;
		this.reviewWriter = reviewWriter;
		this.reviewStar = reviewStar;
		this.usersNo = usersNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}

	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	@Override
	public String toString() {
		return "Review [productNo=" + productNo + ", orderNo=" + orderNo + ", reviewNo=" + reviewNo + ", reviewTitle="
				+ reviewTitle + ", reviewContent=" + reviewContent + ", reviewScore=" + reviewScore + ", reviewStatus="
				+ reviewStatus + ", reviewDate=" + reviewDate + ", reviewWriter=" + reviewWriter + ", reviewStar="
				+ reviewStar + ", usersNo=" + usersNo + "]";
	}
	
	

	
	
}
