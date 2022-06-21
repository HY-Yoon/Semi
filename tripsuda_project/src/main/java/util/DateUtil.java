package util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil
{
	public enum DATEFORMAT {
		YMDHMS("yyyy년 MM월 dd일 hh시 mm분 ss초"),
		YMDHM("yyyy년 MM월 dd일 hh시 mm분"),
		YMD("yyyy년 MM월 dd일"),
		MD("MM월 dd일"),
		HMS("hh시 mm분 ss초"),
		MD_small("MM/dd");
		
		private String value;
		DATEFORMAT(String _value)
		{ value = _value; }
		
		public String getValue()
		{ return value; }
	}
	
	/**
	 * @apiNote 포맷에 맞춰서 적절히 편집된 date 문자열을 반환합니다.
	 * 포맷으로는 문자열을 써도 되고, 제공되는 DATEFORMAT 열거형 값을 써도 됩니다.
	 * @param date 날짜
	 * @param format 가공 포맷
	 * @return 가공된 문자열
	 */
	public static String getText(Date date, String format)
	{
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}
	/**
	 * @apiNote 포맷에 맞춰서 적절히 편집된 date 문자열을 반환합니다.
	 * 포맷으로는 문자열을 써도 되고, 제공되는 DATEFORMAT 열거형 값을 써도 됩니다.
	 * @param date 날짜
	 * @param format 가공 포맷
	 * @return 가공된 문자열
	 */
	public static String getText(Date date, DATEFORMAT format)
	{
		return getText(date, format.getValue());
	}
}
