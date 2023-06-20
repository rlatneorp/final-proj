package kh.finalproj.hollosekki.common.model.vo;

public class BookMark {
	private int bookmarkNo;
	private int usersNo;
	private int divisionNo;
	private int numberType;
	
	public BookMark() {}
	
	public BookMark(int bookmarkNo, int usersNo, int divisionNo, int numberType) {
		this.bookmarkNo = bookmarkNo;
		this.usersNo = usersNo;
		this.divisionNo = divisionNo;
		this.numberType = numberType;
	}

	public int getBookmarkNo() {
		return bookmarkNo;
	}

	public void setBookmarkNo(int bookmarkNo) {
		this.bookmarkNo = bookmarkNo;
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
		return "BookMark [bookmarkNo=" + bookmarkNo + ", usersNo=" + usersNo + ", divisionNo=" + divisionNo
				+ ", numberType=" + numberType + "]";
	}
	
	
	
}
