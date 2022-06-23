package vo;

import java.util.Date;

//신고목록 회원번호X -> 아이디로 보여주기
public class ReportVo22 {
	private int rnum;
	private String def,pla,reason;
	private Date rdate;
	public ReportVo22(int rnum, String def, String pla, String reason, Date rdate) {
		super();
		this.rnum = rnum;
		this.def = def;
		this.pla = pla;
		this.reason = reason;
		this.rdate = rdate;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getDef() {
		return def;
	}
	public void setDef(String def) {
		this.def = def;
	}
	public String getPla() {
		return pla;
	}
	public void setPla(String pla) {
		this.pla = pla;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	 
}
