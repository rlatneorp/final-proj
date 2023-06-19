package kh.finalproj.hollosekki.common.model.vo;

import java.sql.Date;

public class Follow {
	private int followNo;
	private int followingUsersNo;
	private Date followCreateDate;
	private int usersNo;
	
	public Follow() {}

	public Follow(int followNo, int followingUsersNo, Date followCreateDate, int usersNo) {
		super();
		this.followNo = followNo;
		this.followingUsersNo = followingUsersNo;
		this.followCreateDate = followCreateDate;
		this.usersNo = usersNo;
	}

	public int getFollowNo() {
		return followNo;
	}

	public void setFollowNo(int followNo) {
		this.followNo = followNo;
	}

	public int getFollowingUsersNo() {
		return followingUsersNo;
	}

	public void setFollowingUsersNo(int followingUsersNo) {
		this.followingUsersNo = followingUsersNo;
	}

	public Date getFollowCreateDate() {
		return followCreateDate;
	}

	public void setFollowCreateDate(Date followCreateDate) {
		this.followCreateDate = followCreateDate;
	}

	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	@Override
	public String toString() {
		return "Follow [followNo=" + followNo + ", followingUsersNo=" + followingUsersNo + ", followCreateDate="
				+ followCreateDate + ", usersNo=" + usersNo + "]";
	}
	
}
