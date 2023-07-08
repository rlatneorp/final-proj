package kh.finalproj.hollosekki.common.model.vo;

import java.util.Date;

public class Review {
	private int productNo;
	private int orderNo;
	private int reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private int reviewScore;
	private String reviewStatus;
	private Date reviewDate;
	private String reviewWriter;
	private int usersNo;
	
	private int foodNo;
	private String recipeName;
	
	private int boardNo;
	private String boardTitle;
	
	private int productType;
	private String productName;

	public Review() {
		super();
	}

	public Review(int productNo, int orderNo, int reviewNo, String reviewTitle, String reviewContent, int reviewScore,
			String reviewStatus, Date reviewDate, String reviewWriter, int foodNo, String recipeName, int boardNo,
			String boardTitle, int productType, String productName, int usersNo) {
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
		this.foodNo = foodNo;
		this.recipeName = recipeName;
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.productType = productType;
		this.productName = productName;
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

	public int getFoodNo() {
		return foodNo;
	}

	public void setFoodNo(int foodNo) {
		this.foodNo = foodNo;
	}

	public String getRecipeName() {
		return recipeName;
	}

	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public int getProductType() {
		return productType;
	}

	public void setProductType(int productType) {
		this.productType = productType;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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
				+ reviewStatus + ", reviewDate=" + reviewDate + ", reviewWriter=" + reviewWriter + ", usersNo="
				+ usersNo + ", foodNo=" + foodNo + ", recipeName=" + recipeName + ", boardNo=" + boardNo
				+ ", boardTitle=" + boardTitle + ", productType=" + productType + ", productName=" + productName + "]";
	}

}
