package kh.finalproj.hollosekki.common.model.vo;

public class Healther {
	private int usersNo;
	private String name;
	private String title;
	private String career;
	private String imageChange;
	
	public Healther() {
	}

	public Healther(int usersNo, String name, String title, String career, String imageChange) {
		this.usersNo = usersNo;
		this.name = name;
		this.title = title;
		this.career = career;
		this.imageChange = imageChange;
	}

	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getImageChange() {
		return imageChange;
	}

	public void setImageChange(String imageChange) {
		this.imageChange = imageChange;
	}

	@Override
	public String toString() {
		return "Healther [usersNo=" + usersNo + ", name=" + name + ", title=" + title + ", career=" + career
				+ ", imageChange=" + imageChange + "]";
	}
		
}
