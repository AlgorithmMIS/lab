package lab.format;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import lab.db.DbCon;

public class Util {
	public static String tdForm(String a) {
		return "<td>" + a + "</td>";
	}

	public static String optionForm(String a) {
		return "<option value=" + a + ">" + a + "</option>";
	}

	public static String winForm(String a) {
		return "<script type=\" text/javascript \">alert(\"" + a + "\");</script>";
	}

	private static String tranForm(int a) {
		if (a < 10)
			return "0" + String.valueOf(a);
		return String.valueOf(a);
	}
	

	public static Map<String, Integer> statAcadCounts(ArrayList<String> acads) {
		DbCon dbc = new DbCon();
		Map<String, Integer> res = new HashMap<String, Integer>();
		String sql = "select count(*) from academy_paper_tbl,abbreviation_tbl"
				+ " where abbreviation_id = abbr_id and academy_name=?";
		int num = 0;
		for (String a : acads) {
			ResultSet tt = dbc.doQuery(sql, new Object[] { a});
			try {
				while (tt.next()) {
					System.out.println(tt.getInt(1));
					num = tt.getInt(1);
					System.out.println(num);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			res.put(a, num);
		}
		return res;
	}

	public static Map<String, Integer> statCountsOfEachCate(ArrayList<String> categories) {
		Map<String, Integer> res = new HashMap<String, Integer>();
		DbCon conn = new DbCon();
		String sql = "select sum(count) from paperinfor,count_tbl where paperinfor.accession=count_tbl.accession and category=?";
		for (String a : categories) {
			ResultSet re = conn.doQuery(sql, new Object[] { a });
			try {
				while (re.next()) {
					res.put(a, re.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return res;
	}
//select * from tbl bounds;
	public static ResultSet findAll(String tbl,String bounds)
	{
		DbCon conn=new DbCon();
		String sql="select * from ? "+bounds+";";
		return conn.doQuery(sql, new Object[]{tbl});
		
	}
	// 统计全校category的论文数
	public static Map<String, Map<String, Integer>> stateACategory(ArrayList<String> categ, ArrayList<String> acades) {
		Map<String, Map<String, Integer>> res = new HashMap<String, Map<String, Integer>>();
		for (String Cate : categ) {
			Map<String, Integer> tmp = new HashMap<String, Integer>();
			for (String Ac : acades) {
				DbCon dbc = new DbCon();
				String sql = "select count(*) from abbreviation_tbl,academy_paper_tbl"
						+ ",paperinfor where category=?  and accession=accs and abbr_id=abbreviation_id and academy_name=?;";
				ResultSet tt = dbc.doQuery(sql, new Object[] { Cate, Ac });
				try {
					while (tt.next()) {
						tmp.put(Ac, tt.getInt(1));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				dbc.close();
			}
			res.put(Cate, tmp);
		}
		return res;
	}

	public static Map<String, Integer> statSCategoryCounts(ArrayList<String> categ) {
		DbCon dbc = new DbCon();
		Map<String, Integer> res = new HashMap<String, Integer>();
		String sql = "select count(*) from paperinfor where category=?";
		for (String a : categ) {
			ResultSet tt = dbc.doQuery(sql, new Object[] { a });
			try {
				while (tt.next()) {
					res.put(a, tt.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return res;
	}

	public static ArrayList<String> findDistin(String colmn, String table, String bounds) {
		ArrayList<String> Academs = new ArrayList<String>();
		DbCon conn = new DbCon();
		String findAcaN = "select distinct " + colmn + " from " + table +" "+bounds +";";
		ResultSet resAcaN = conn.doQuery(findAcaN, new Object[] {});
		System.out.println("end");
		try {
			while (resAcaN.next()) {
				Academs.add(resAcaN.getString(colmn));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(Academs.isEmpty());
		return Academs;
	}

	public static String timeForm(int year, int month, int day) {
		if (day != 1) {
			if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
				day = 31;
			else if (month == 2) {
				if (year % 4 == 0 && year % 400 != 0)
					day = 29;
				else
					day = 28;
			} else
				day = 30;
		}
		return String.valueOf(year) + "-" + tranForm(month) + "-" + tranForm(day);

	}
}
