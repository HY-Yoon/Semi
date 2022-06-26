package vo;

import java.sql.Date;
import java.util.Calendar;

import dao.PartyWaitDao;

/**
 * @author 주현
 * 동행 신청 게시판 VO
 */
public class PartyboardVo
{
	private long anum;
	private long mnum;
	private String nick;

	private String dest;
	private String gender;
	private long age_min;
	private long age_max;
	private long memcnt;
	private Date startDate;
	private Date endDate;

	private String backimg;

	private String title;
	private String content;
	private String tags;

	private long views;
	private Date regDate;
	private String expired;
	
	

	//kj 
	public PartyboardVo(long anum, long mnum, String title, Date regDate) {
		super();
		this.anum = anum;
		this.mnum = mnum;
		this.title = title;
		this.regDate = regDate;
	}

	public PartyboardVo(long mnum, String nick,
			String dest, String gender, long age_min, long age_max,
			long memcnt, Date startDate, Date endDate,
			String backimg, String title, String content, String tags)
	{
		super();
		this.anum = 0;
		this.mnum = mnum;
		this.nick = nick;
		this.dest = dest;
		this.gender = gender;
		this.age_min = age_min;
		this.age_max = age_max;
		this.memcnt = memcnt;
		this.startDate = startDate;
		this.endDate = endDate;
		this.backimg = backimg;
		this.title = title;
		this.content = content;
		this.tags = tags;
		this.views = 0;
		this.regDate = null;
		this.expired = "N";
	}
	
	public PartyboardVo(long anum, long mnum, String nick, String dest, String gender, long age_min, long age_max,
			long memcnt, Date startDate, Date endDate, String backimg, String title, String content, String tags,
			long views, Date regDate, String expired) {
		super();
		this.anum = anum;
		this.mnum = mnum;
		this.nick = nick;
		this.dest = dest;
		this.gender = gender;
		this.age_min = age_min;
		this.age_max = age_max;
		this.memcnt = memcnt;
		this.startDate = startDate;
		this.endDate = endDate;
		this.backimg = backimg;
		this.title = title;
		this.content = content;
		this.tags = tags;
		this.views = views;
		this.regDate = regDate;
		this.expired = expired;
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
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getDest() {
		return dest;
	}
	public void setDest(String dest) {
		this.dest = dest;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public long getAge_min() {
		return age_min;
	}
	public void setAge_min(long age_min) {
		this.age_min = age_min;
	}
	public long getAge_max() {
		return age_max;
	}
	public void setAge_max(long age_max) {
		this.age_max = age_max;
	}
	public long getMemcnt() {
		return memcnt;
	}
	public void setMemcnt(long memcnt) {
		this.memcnt = memcnt;
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
	public String getBackimg() {
		return backimg;
	}
	public void setBackimg(String backimg) {
		this.backimg = backimg;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public long getViews() {
		return views;
	}
	public void setViews(long views) {
		this.views = views;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getExpired() {
		java.util.Date currDate = Calendar.getInstance().getTime();
		if (currDate.after(getEndDate()))
			return "Y";
		if (PartyWaitDao.getInstance().getMemCnt(this.anum) >= this.memcnt)
			return "Y";
		return expired;
	}
	public void setExpired(String expired) {
		this.expired = expired;
	}
	
	
}
