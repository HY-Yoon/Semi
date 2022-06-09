package vo;

import java.sql.Date;

public class ChatVo
{
	private long cNum;
	private long rNum;
	private long sender;
	private long[] readers;
	private String message;
	private Date creDate;
	
	public ChatVo()
	{ }
	public ChatVo(long cNum, long rNum, long sender, long[] readers, String message, Date creDate)
	{
		super();
		this.cNum = cNum;
		this.rNum = rNum;
		this.sender = sender;
		this.readers = readers;
		this.message = message;
		this.creDate = creDate;
	}
	
	public long getcNum() {
		return cNum;
	}
	public void setcNum(long cNum) {
		this.cNum = cNum;
	}
	public long getrNum() {
		return rNum;
	}
	public void setrNum(long rNum) {
		this.rNum = rNum;
	}
	public long getSender() {
		return sender;
	}
	public void setSender(long sender) {
		this.sender = sender;
	}
	public long[] getReaders() {
		return readers;
	}
	public void setReaders(long[] readers) {
		this.readers = readers;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	
	
}
