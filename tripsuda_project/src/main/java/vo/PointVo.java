package vo;

import java.util.Date;

public class PointVo {
	private int pnum,mnum,point;
	private Date pdate;
	private String content;
	public PointVo(int pnum, int mnum, int point, Date pdate, String content) {
		super();
		this.pnum = pnum;
		this.mnum = mnum;
		this.point = point;
		this.pdate = pdate;
		this.content = content;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
