package kh.finalproj.hollosekki.enroll.model.vo;

public class SocialLogin {
	private String socialId;
	private String socialProfileImg;
	
	public SocialLogin() {}
	
	public SocialLogin(String socialId, String socialProfileImg) {
		super();
		this.socialId = socialId;
		this.socialProfileImg = socialProfileImg;
	}

	public String getSocialId() {
		return socialId;
	}

	public void setSocialId(String socialId) {
		this.socialId = socialId;
	}

	public String getSocialProfileImg() {
		return socialProfileImg;
	}

	public void setSocialProfileImg(String socialProfileImg) {
		this.socialProfileImg = socialProfileImg;
	}

	@Override
	public String toString() {
		return "SocialLogin [socialId=" + socialId + ", socialProfileImg=" + socialProfileImg + "]";
	}
	
	
	
	
}
