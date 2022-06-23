package vo;

import java.util.Date;

public class ReportVo {
	private int rnum, defendant, plaintiff;
	private String reason;
	private Date rdate;
	public ReportVo(int rnum, int defendant, int plaintiff, String reason, Date rdate) {
		super();
		this.rnum = rnum;
		this.defendant = defendant;
		this.plaintiff = plaintiff;
		this.reason = reason;
		this.rdate = rdate;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getDefendant() {
		return defendant;
	}
	public void setDefendant(int defendant) {
		this.defendant = defendant;
	}
	public int getPlaintiff() {
		return plaintiff;
	}
	public void setPlaintiff(int plaintiff) {
		this.plaintiff = plaintiff;
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
