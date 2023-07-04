package kh.finalproj.hollosekki.common.model.vo;

import java.util.Date;

public class QNA {
	private int qnaNo;
	private int usersNo;
	private String usersId;
	private Date qnaDate;
	private String qnaTitle;
	private String qnaContent;
	private Integer adminNo;
	private Date answerDate;
	private String answerContent;
	private String qnaStatus;
	private int qnaType;
	
	public QNA() {
		super();
	}

	public QNA(int qnaNo, int usersNo, String usersId, Date qnaDate, String qnaTitle, String qnaContent,
			Integer adminNo, Date answerDate, String answerContent, String qnaStatus, int qnaType) {
		this.qnaNo = qnaNo;
		this.usersNo = usersNo;
		this.usersId = usersId;
		this.qnaDate = qnaDate;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.adminNo = adminNo;
		this.answerDate = answerDate;
		this.answerContent = answerContent;
		this.qnaStatus = qnaStatus;
		this.qnaType = qnaType;
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

	public String getUsersId() {
		return usersId;
	}

	public void setUsersId(String usersId) {
		this.usersId = usersId;
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

	public Integer getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(Integer adminNo) {
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

	@Override
	public String toString() {
		return "QNA [qnaNo=" + qnaNo + ", usersNo=" + usersNo + ", usersId=" + usersId + ", qnaDate=" + qnaDate
				+ ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", adminNo=" + adminNo + ", answerDate="
				+ answerDate + ", answerContent=" + answerContent + ", qnaStatus=" + qnaStatus + ", qnaType=" + qnaType
				+ "]";
	}
	
}
