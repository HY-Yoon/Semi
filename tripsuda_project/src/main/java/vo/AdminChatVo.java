package vo;

import java.sql.Date;

public class AdminChatVo
{
	private long cNum;
	private long sender;
	private long reader;
	
	public AdminChatVo()
	{ }

	public AdminChatVo(long cNum, long sender, long reader) {
		super();
		this.cNum = cNum;
		this.sender = sender;
		this.reader = reader;
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

	
}
