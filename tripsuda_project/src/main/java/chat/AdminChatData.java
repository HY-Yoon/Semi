package chat;

import java.sql.Date;

public class AdminChatData
{
	private long cNum;
	private long sender;
	private long reader;
	private String message;
	private Date creDate;
	
	public AdminChatData()
	{
		
	}
	public AdminChatData(long cNum, long sender, long reader, String message, Date creDate) {
		super();
		this.cNum = cNum;
		this.sender = sender;
		this.reader = reader;
		this.message = message;
		this.creDate = creDate;
	}
	public long getcNum() {
		return cNum;
	}
	public void setcNum(long cNum) {
		this.cNum = cNum;
	}
	public long getSender() {
		return sender;
	}
	public void setSender(long sender) {
		this.sender = sender;
	}
	public long getReader() {
		return reader;
	}
	public void setReader(long reader) {
		this.reader = reader;
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
