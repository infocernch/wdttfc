package wdtt.dto;

public class WdttDTO {
	private String userid;
	private String passwd;
	private String name;
	private String tel;
	private String mng;
	private String lv;
	private String sessionUserid; //세션확인용 아이디
	private String member;








	public WdttDTO(String userid, String passwd, String name, String tel, String mng, String lv, String sessionUserid,
			String member) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.tel = tel;
		this.mng = mng;
		this.lv = lv;
		this.sessionUserid = sessionUserid;
		this.member = member;
	}








	@Override
	public String toString() {
		return "WdttDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", tel=" + tel + ", mng=" + mng
				+ ", lv=" + lv + ", sessionUserid=" + sessionUserid + ", member=" + member + "]";
	}








	public String getUserid() {
		return userid;
	}








	public void setUserid(String userid) {
		this.userid = userid;
	}








	public String getPasswd() {
		return passwd;
	}








	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}








	public String getName() {
		return name;
	}








	public void setName(String name) {
		this.name = name;
	}








	public String getTel() {
		return tel;
	}








	public void setTel(String tel) {
		this.tel = tel;
	}








	public String getMng() {
		return mng;
	}








	public void setMng(String mng) {
		this.mng = mng;
	}








	public String getLv() {
		return lv;
	}








	public void setLv(String lv) {
		this.lv = lv;
	}








	public String getSessionUserid() {
		return sessionUserid;
	}








	public void setSessionUserid(String sessionUserid) {
		this.sessionUserid = sessionUserid;
	}








	public String getMember() {
		return member;
	}








	public void setMember(String member) {
		this.member = member;
	}








	public WdttDTO() {

	}






}
