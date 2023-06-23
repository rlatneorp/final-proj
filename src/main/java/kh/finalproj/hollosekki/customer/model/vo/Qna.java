package kh.finalproj.hollosekki.customer.model.vo;

import java.util.Date;

public class Qna {
	private int qnaNo;
	private int usersNo;
	private Date qnaDate;
	private String qnaTitle;
	private String qnaContent;
	private int adminNo;
	private Date answerDate;
	private String answerContent;
	private char qnaStatus;
	
	public Qna() {}

	public Qna(int qnaNo, int usersNo, Date qnaDate, String qnaTitle, String qnaContent, int adminNo, Date answerDate,
			String answerContent, char qnaStatus) {
		super();
		this.qnaNo = qnaNo;
		this.usersNo = usersNo;
		this.qnaDate = qnaDate;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.adminNo = adminNo;
		this.answerDate = answerDate;
		this.answerContent = answerContent;
		this.qnaStatus = qnaStatus;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public Date getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public char getQnaStatus() {
		return qnaStatus;
	}

	public void setQnaStatus(char qnaStatus) {
		this.qnaStatus = qnaStatus;
	}

	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", usersNo=" + usersNo + ", qnaDate=" + qnaDate + ", qnaTitle=" + qnaTitle
				+ ", qnaContent=" + qnaContent + ", adminNo=" + adminNo + ", answerDate=" + answerDate
				+ ", answerContent=" + answerContent + ", qnaStatus=" + qnaStatus + "]";
	}
	
}
