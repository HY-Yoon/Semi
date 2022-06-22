package vo.reviewboard;

import java.sql.Date;

public class ReviewCommVo {
	private int cnum;
	private int anum;
	private int mnum;
	private String content;
	private Date regdate;
	
	public ReviewCommVo() {
		super();
	}

	public ReviewCommVo(int cnum, int anum, int mnum, String content, Date regdate) {
		super();
		this.cnum = cnum;
		this.anum = anum;
		this.mnum = mnum;
		this.content = content;
		this.regdate = regdate;
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
	
}
