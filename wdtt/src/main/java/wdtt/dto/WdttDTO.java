package wdtt.dto;

public class WdttDTO {
	private String userid;
	private String passwd;
	private String name;
	private String tel;
	private String mng;
	private String lv;
	
	
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
	@Override
	public String toString() {
		return "WdttDAO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", tel=" + tel + ", mng=" + mng
				+ ", lv=" + lv + "]";
	}
	public WdttDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WdttDTO(String userid, String passwd, String name, String tel, String mng, String lv) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.tel = tel;
		this.mng = mng;
		this.lv = lv;
	}

	
	
}
