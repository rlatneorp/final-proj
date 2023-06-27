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
	private String reviewcontent;
	private int productNo;
	private int orderNo;
	private Date reviewDate;
	private String reviewWriter;
	private char reviewStatus;
	private int boardCount;
	
	public Board() {}

	public Board(int boardNo, int usersNo, String nickName, String boardTitle, String boardContent, Date boardDate,
			char boardStatus, String boardType, String reviewcontent, int productNo, int orderNo, Date reviewDate,
			String reviewWriter, char reviewStatus, int boardCount) {
		super();
		this.boardNo = boardNo;
		this.usersNo = usersNo;
		this.nickName = nickName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.boardStatus = boardStatus;
		this.boardType = boardType;
		this.reviewcontent = reviewcontent;
		this.productNo = productNo;
		this.orderNo = orderNo;
		this.reviewDate = reviewDate;
		this.reviewWriter = reviewWriter;
		this.reviewStatus = reviewStatus;
		this.boardCount = boardCount;
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

	public String getReviewcontent() {
		return reviewcontent;
	}

	public void setReviewcontent(String reviewcontent) {
		this.reviewcontent = reviewcontent;
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

	public char getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(char reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", usersNo=" + usersNo + ", nickName=" + nickName + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardDate=" + boardDate + ", boardStatus="
				+ boardStatus + ", boardType=" + boardType + ", reviewcontent=" + reviewcontent + ", productNo="
				+ productNo + ", orderNo=" + orderNo + ", reviewDate=" + reviewDate + ", reviewWriter=" + reviewWriter
				+ ", reviewStatus=" + reviewStatus + ", boardCount=" + boardCount + "]";
	}
 
	
		
	
}
