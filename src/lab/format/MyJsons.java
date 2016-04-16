package lab.format;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class MyJsons {
	public static String jStrList2Json(List<String> aa) {
		StringBuffer res = new StringBuffer();
		res.append("[");
		for (int i = 0; i < aa.size(); i++) {
			res.append("\"").append(aa.get(i)).append("\"");
			if (i + 1 < aa.size()) {
				res.append(",");
			}
		}
		res.append("]");
		return res.toString();
	}

	public static String jStrSet2Json(Set<String> aa) {
		String res = "[";
		int i = 0;
		for (String t : aa) {
			res += ("'" + t + "'");
			if (i + 1 < aa.size())
				res += ",";
			i++;
		}
		res += "]";
		return res;
	}

	public static String jIntList2Json(List<Integer> aa) {
		String res = "[";
		for (int i = 0; i < aa.size(); i++) {
			res += aa.get(i).toString();
			if (i + 1 < aa.size())
				res += ",";
			res += "]";
		}
		return res;

	}

	public static String jMap2Json(Map<String, Integer> aa) {
		String res = "[";
		int i = 0;
		for (String t : aa.keySet()) {
			res += ("{value:" + aa.get(t) + ", name:'" + t + "'}");
			if (i + 1 < aa.size())
				res += ",";
			i++;
		}
		res += "]";
		return res;
	}

	public static void main(String[] args) {
		Map<String, Integer> aa = new HashMap<String, Integer>();
		aa.put("nitg", 12);
		aa.put("aa", 233);
		System.out.println(MyJsons.jMap2Json(aa));
	}
}
