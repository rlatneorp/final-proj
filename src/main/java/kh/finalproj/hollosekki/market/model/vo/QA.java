package kh.finalproj.hollosekki.market.model.vo;

import java.sql.Date;

import kh.finalproj.hollosekki.users.model.vo.Users;

public class QA extends Users{
	private int qnaNo;
	private int usersNo;
	private Date qnaDate;
	private String qnaTitle;
	private String qnaContent;
	private int adminNo;
	private Date answerDate;
	private String answerContent;
	private String qnaStatus;
	private int qnaType;
	private String nickName;
	private String qnaCategory;
	
	public QA() {
		super();
	}

	public QA(int qnaNo, int usersNo, Date qnaDate, String qnaTitle, String qnaContent, int adminNo, Date answerDate,
			String answerContent, String qnaStatus, int qnaType, String nickName, String qnaCategory) {
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
		this.qnaType = qnaType;
		this.nickName = nickName;
		this.qnaCategory = qnaCategory;
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

	public String getQnaStatus() {
		return qnaStatus;
	}

	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}

	public int getQnaType() {
		return qnaType;
	}

	public void setQnaType(int qnaType) {
		this.qnaType = qnaType;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getQnaCategory() {
		return qnaCategory;
	}

	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}

	@Override
	public String toString() {
		return "QA [qnaNo=" + qnaNo + ", usersNo=" + usersNo + ", qnaDate=" + qnaDate + ", qnaTitle=" + qnaTitle
				+ ", qnaContent=" + qnaContent + ", adminNo=" + adminNo + ", answerDate=" + answerDate
				+ ", answerContent=" + answerContent + ", qnaStatus=" + qnaStatus + ", qnaType=" + qnaType
				+ ", nickName=" + nickName + ", qnaCategory=" + qnaCategory + "]";
	}

}
