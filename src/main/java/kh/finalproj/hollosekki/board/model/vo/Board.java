package kh.finalproj.hollosekki.board.model.vo;

import java.util.Date;

public class Board {
	
	private int boardNo;
	private int usersNo;
	private String nickName;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private char boardStatus;
	private String boardType;
	private int boardCount;
	private int productNo;
	private int orderNo;
	private int reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private int reviewScore;
	private char reviewStatus;
	private Date reviewDate;
	private String reviewWriter;
	
	public Board() {}

	public Board(int boardNo, int usersNo, String nickName, String boardTitle, String boardContent, Date boardDate,
			char boardStatus, String boardType, int boardCount, int productNo, int orderNo, int reviewNo,
			String reviewTitle, String reviewContent, int reviewScore, char reviewStatus, Date reviewDate,
			String reviewWriter) {
		super();
		this.boardNo = boardNo;
		this.usersNo = usersNo;
		this.nickName = nickName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.boardStatus = boardStatus;
		this.boardType = boardType;
		this.boardCount = boardCount;
		this.productNo = productNo;
		this.orderNo = orderNo;
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewScore = reviewScore;
		this.reviewStatus = reviewStatus;
		this.reviewDate = reviewDate;
		this.reviewWriter = reviewWriter;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public char getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(char boardStatus) {
		this.boardStatus = boardStatus;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
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

	public char getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(char reviewStatus) {
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

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", usersNo=" + usersNo + ", nickName=" + nickName + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardDate=" + boardDate + ", boardStatus="
				+ boardStatus + ", boardType=" + boardType + ", boardCount=" + boardCount + ", productNo=" + productNo
				+ ", orderNo=" + orderNo + ", reviewNo=" + reviewNo + ", reviewTitle=" + reviewTitle
				+ ", reviewContent=" + reviewContent + ", reviewScore=" + reviewScore + ", reviewStatus=" + reviewStatus
				+ ", reviewDate=" + reviewDate + ", reviewWriter=" + reviewWriter + "]";
	}

	
		
	
}
