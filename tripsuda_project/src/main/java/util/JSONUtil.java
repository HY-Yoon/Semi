package util;

import java.io.BufferedReader;
import java.io.IOException;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.json.HTTP;
import org.json.JSONObject;

public class JSONUtil
{
	
	/**
	 * @author 주현
	 * @apiNote javascript 등으로 json 파일을 post 했을 때,
	 * request의 BufferedReader를 사용해 json 객체로 치환합니다.
	 * @return 해석된 JSON 파일
	 */
	public static JSONObject parse(BufferedReader br)
	{
		StringBuffer sb = new StringBuffer();
		String line = null;
		try
		{
			while((line = br.readLine()) != null)
				sb.append(line);
			JSONObject json = new JSONObject(sb.toString());
			// System.out.println(json.toString());
			return json;
		}
		catch (IOException e)
		{
			System.out.println("[JSONUtil] parse에서 오류 - BufferedReader에 문제가 있어요.");
			e.printStackTrace();
		}
		return null;
	}
}
