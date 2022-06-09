package vo;

import java.sql.Date;

/**
 * @author 주현
 * 동행 신청 게시판 VO
 */
public class PartyboardVo
{
	private long anum;
	private long memCnt;
	private String dest;
	private Date startDate;
	private Date endDate;
	private String gender;
	private long age;
	private String yn;
	
	public PartyboardVo(long anum, long memCnt, String dest, Date startDate, Date endDate, String gender, long age,
			String yn) {
		super();
		this.anum = anum;
		this.memCnt = memCnt;
		this.dest = dest;
		this.startDate = startDate;
		this.endDate = endDate;
		this.gender = gender;
		this.age = age;
		this.yn = yn;
	}
	
	public long getAnum() {
		return anum;
	}
	public void setAnum(long anum) {
		this.anum = anum;
	}
	public long getMemCnt() {
		return memCnt;
	}
	public void setMemCnt(long memCnt) {
		this.memCnt = memCnt;
	}
	public String getDest() {
		return dest;
	}
	public void setDest(String dest) {
		this.dest = dest;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public long getAge() {
		return age;
	}
	public void setAge(long age) {
		this.age = age;
	}
	public String getYn() {
		return yn;
	}
	public void setYn(String yn) {
		this.yn = yn;
	}
	
	

}
