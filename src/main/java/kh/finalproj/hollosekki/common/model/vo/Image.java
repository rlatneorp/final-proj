package kh.finalproj.hollosekki.common.model.vo;

public class Image {
	private int imageNo;
	private int imageDivideNo;
	private int imageType;
	private String imageOriginalName;
	private String imageRenameName;
	private String imagePath;
	private int imageLevel;
	
	public Image() {}

	public Image(int imageNo, int imageDivideNo, int imageType, String imageOriginalName, String imageRenameName,
			String imagePath, int imageLevel) {
		super();
		this.imageNo = imageNo;
		this.imageDivideNo = imageDivideNo;
		this.imageType = imageType;
		this.imageOriginalName = imageOriginalName;
		this.imageRenameName = imageRenameName;
		this.imagePath = imagePath;
		this.imageLevel = imageLevel;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public int getImageDivideNo() {
		return imageDivideNo;
	}

	public void setImageDivideNo(int imageDivideNo) {
		this.imageDivideNo = imageDivideNo;
	}

	public int getImageType() {
		return imageType;
	}

	public void setImageType(int imageType) {
		this.imageType = imageType;
	}

	public String getImageOriginalName() {
		return imageOriginalName;
	}

	public void setImageOriginalName(String imageOriginalName) {
		this.imageOriginalName = imageOriginalName;
	}

	public String getImageRenameName() {
		return imageRenameName;
	}

	public void setImageRenameName(String imageRenameName) {
		this.imageRenameName = imageRenameName;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	public int getImageLevel() {
		return imageLevel;
	}
	
	public void setImageLevel(int imageLevel) {
		this.imageLevel = imageLevel;
	}

	public int getImageLevel() {
		return imageLevel;
	}

	public void setImageLevel(int imageLevel) {
		this.imageLevel = imageLevel;
	}

	@Override
	public String toString() {
		return "Image [imageNo=" + imageNo + ", imageDivideNo=" + imageDivideNo + ", imageType=" + imageType
				+ ", imageOriginalName=" + imageOriginalName + ", imageRenameName=" + imageRenameName + ", imagePath="
				+ imagePath + ", imageLevel=" + imageLevel + "]";
	}
	
}
