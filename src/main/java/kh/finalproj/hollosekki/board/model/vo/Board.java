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
	private String boardComment;
	private int boardCommentNo;
	private Date boardCommentDate;
	private String boardCommentNickName;
	private char boardCommentStatus;
	private int boardCount;
	
	public Board() {}

	public Board(int boardNo, int usersNo, String nickName, String boardTitle, String boardContent, Date boardDate,
			char boardStatus, String boardType, String boardComment, int boardCommentNo, Date boardCommentDate,
			String boardCommentNickName, char boardCommentStatus, int boardCount) {
		super();
		this.boardNo = boardNo;
		this.usersNo = usersNo;
		this.nickName = nickName;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.boardStatus = boardStatus;
		this.boardType = boardType;
		this.boardComment = boardComment;
		this.boardCommentNo = boardCommentNo;
		this.boardCommentDate = boardCommentDate;
		this.boardCommentNickName = boardCommentNickName;
		this.boardCommentStatus = boardCommentStatus;
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

	public String getBoardComment() {
		return boardComment;
	}

	public void setBoardComment(String boardComment) {
		this.boardComment = boardComment;
	}

	public int getBoardCommentNo() {
		return boardCommentNo;
	}

	public void setBoardCommentNo(int boardCommentNo) {
		this.boardCommentNo = boardCommentNo;
	}

	public Date getBoardCommentDate() {
		return boardCommentDate;
	}

	public void setBoardCommentDate(Date boardCommentDate) {
		this.boardCommentDate = boardCommentDate;
	}

	public String getBoardCommentNickName() {
		return boardCommentNickName;
	}

	public void setBoardCommentNickName(String boardCommentNickName) {
		this.boardCommentNickName = boardCommentNickName;
	}

	public char getBoardCommentStatus() {
		return boardCommentStatus;
	}

	public void setBoardCommentStatus(char boardCommentStatus) {
		this.boardCommentStatus = boardCommentStatus;
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
				+ boardStatus + ", boardType=" + boardType + ", boardComment=" + boardComment + ", boardCommentNo="
				+ boardCommentNo + ", boardCommentDate=" + boardCommentDate + ", boardCommentNickName="
				+ boardCommentNickName + ", boardCommentStatus=" + boardCommentStatus + ", boardCount=" + boardCount
				+ "]";
	}

	
		
	
}
