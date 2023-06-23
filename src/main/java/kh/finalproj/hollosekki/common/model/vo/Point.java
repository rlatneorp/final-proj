package kh.finalproj.hollosekki.common.model.vo;

import java.util.Date;

public class Point {
	private int pointNo;
	private int usersNo;
	private int pointType;
	private int pointBefore;
	private int pointChange;
	private int point;
	private Date modifyDate;
	
	public Point() {
		super();
	}
	public Point(int pointNo, int usersNo, int pointType, int pointBefore, int pointChange, int point,
			Date modifyDate) {
		super();
		this.pointNo = pointNo;
		this.usersNo = usersNo;
		this.pointType = pointType;
		this.pointBefore = pointBefore;
		this.pointChange = pointChange;
		this.point = point;
		this.modifyDate = modifyDate;
	}
	public int getPointNo() {
		return pointNo;
	}
	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}
	public int getUsersNo() {
		return usersNo;
	}
	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}
	public int getPointType() {
		return pointType;
	}
	public void setPointType(int pointType) {
		this.pointType = pointType;
	}
	public int getPointBefore() {
		return pointBefore;
	}
	public void setPointBefore(int pointBefore) {
		this.pointBefore = pointBefore;
	}
	public int getPointChange() {
		return pointChange;
	}
	public void setPointChange(int pointChange) {
		this.pointChange = pointChange;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	@Override
	public String toString() {
		return "Point [pointNo=" + pointNo + ", usersNo=" + usersNo + ", pointType=" + pointType + ", pointBefore="
				+ pointBefore + ", pointChange=" + pointChange + ", point=" + point + ", modifyDate=" + modifyDate
				+ "]";
	}
	
}
