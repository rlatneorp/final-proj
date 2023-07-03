package kh.finalproj.hollosekki.common.model.vo;

public class Likes {
	private int likeNo;
	private int usersNo;
	private int divisionNo;
	private int numberType;
	
	
	public Likes() {}
	
	public Likes(int likeNo, int usersNo, int divisionNo, int numberType) {
		super();
		this.likeNo = likeNo;
		this.usersNo = usersNo;
		this.divisionNo = divisionNo;
		this.numberType = numberType;
	}

	public int getLikeNo() {
		return likeNo;
	}


	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}



	public int getUsersNo() {
		return usersNo;
	}



	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}



	public int getDivisionNo() {
		return divisionNo;
	}



	public void setDivisionNo(int divisionNo) {
		this.divisionNo = divisionNo;
	}



	public int getNumberType() {
		return numberType;
	}



	public void setNumberType(int numberType) {
		this.numberType = numberType;
	}



	@Override
	public String toString() {
		return "Likes [likeNo=" + likeNo + ", usersNo=" + usersNo + ", divisionNo=" + divisionNo + ", numberType="
				+ numberType + "]";
	}
	
	
	
	
	
}
