package vo;

import java.util.Date;

public class FreeCommVo {
	private int cnum;
	private int anum;
	private int mnum;
	private String nick;
	private String id;
	private String content;
	private Date regdate;
	private int ref;
	private int lev;
	private int step;

	public FreeCommVo() {
		super();
	}

	public FreeCommVo(int cnum, int anum, int mnum, String nick, String id, String content, Date regdate, int ref,
			int lev, int step) {
		super();
		this.cnum = cnum;
		this.anum = anum;
		this.mnum = mnum;
		this.nick = nick;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
		this.ref = ref;
		this.lev = lev;
		this.step = step;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	
	
	
	public int getAnum() {
		return anum;
	}

	public void setAnum(int anum) {
		this.anum = anum;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	@Override
	public String toString() {
		return "FreeCommVo [cnum=" + cnum + ", anum=" + anum + ", mnum=" + mnum + ", nick=" + nick + ", id=" + id
				+ ", content=" + content + ", regdate=" + regdate + ", ref=" + ref + ", lev=" + lev + ", step=" + step
				+ ", getCnum()=" + getCnum() + ", getAnum()=" + getAnum() + ", getMnum()=" + getMnum() + ", getNick()="
				+ getNick() + ", getId()=" + getId() + ", getContent()=" + getContent() + ", getRegdate()="
				+ getRegdate() + ", getRef()=" + getRef() + ", getLev()=" + getLev() + ", getStep()=" + getStep()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

}
