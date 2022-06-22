package util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil
{
	public enum DATEFORMAT {
		YMDHMS("yyyy년 MM월 dd일 hh시 mm분 ss초"),
		YMDHM("yyyy년 MM월 dd일 hh시 mm분"),
		YMD("yyyy년 MM월 dd일"),
		HM("hh시 mm분"),
		HMS("hh시 mm분 ss초"),
		MD("MM월 dd일"),
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

	protected static final String[] timeMsg = { "초 전", "분 전", "시간 전", "일 전" };
	protected static final long[] timeLine = { 60, 60, 24, 30 };
	/**
	 * @apiNote 인자값으로 받은 시간과 현재 시간의 차이를 계산해 얼마나 이전인지 알려줍니다.
	 * @param date 비교할 날짜(과거)
	 * @return 가공된 문자열 (방금 전 < 30~초 전 < ~분 전 < ~시간 전 < ~30일 전 < 오래 전)
	 */
	public static String getDiffer(Date date)
	{
		if (date == null)
			return "알 수 없음";
		Date curr = Calendar.getInstance().getTime();
		long time = (curr.getTime() / 1000) - (date.getTime() / 1000);
		
		// 너무 빠른 경우 방금 전이라고 표시
		if (time < 30)
			return "방금 전";
		for (int i = 0; i < timeMsg.length; i++)
		{
			if (time < timeLine[i])
				return time + timeMsg[i];
			time = time / timeLine[i]; // 초->분->시->일로 나눈다
		}
		// 일 단위로도 나눌 수 없게 되면 오래 전이라고 표시
		return "오래 전";
	}
}
