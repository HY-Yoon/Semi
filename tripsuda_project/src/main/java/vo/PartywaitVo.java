package vo;

/**
 * @author 주현
 * 동행 참가 신청 VO
 */
public class PartywaitVo
{
	private long anum;
	private long mnum;
	private String yn;
	public PartywaitVo(long anum, long mnum, String yn) {
		super();
		this.anum = anum;
		this.mnum = mnum;
		this.yn = yn;
	}
	public long getAnum() {
		return anum;
	}
	public void setAnum(long anum) {
		this.anum = anum;
	}
	public long getMnum() {
		return mnum;
	}
	public void setMnum(long mnum) {
		this.mnum = mnum;
	}
	public String getYn() {
		return yn;
	}
	public void setYn(String yn) {
		this.yn = yn;
	}

	
}
