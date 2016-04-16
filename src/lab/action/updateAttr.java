package lab.action;

import lab.format.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import lab.db.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateAttr
 */
@WebServlet("/updateAttr")
public class updateAttr extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateAttr() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		DbCon dbc = new DbCon();
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		String academy_name = (String) request.getParameter("academy_name");
		String abbre = (String) request.getParameter("abbreviation");
		if (abbre == "")
			request.setAttribute("message", Util.winForm("不能为空"));
		else {
			ResultSet acadms = null;
			acadms = dbc.doQuery("select academy_abbreviation from " + "abbreviation_tbl where academy_name=?",
					new Object[] { academy_name });
			boolean mark = true;
			try {
				while (acadms.next()) {
					try {
						if (acadms.getString("academy_abbreviation").equals(abbre)) {
							System.out.println("hello,world" + academy_name + "d");
							mark = false;
							break;
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (mark) {
				int res = 0;
				res = dbc.doUpdate("insert into abbreviation_tbl(academy_name," + "academy_abbreviation)values(?,?);",
						new Object[] { academy_name, abbre });
				if (res > 0)
					request.setAttribute("message", Util.winForm("添加成功"));
				else
					request.setAttribute("message", Util.winForm("添加失败"));
			} else
				request.setAttribute("message", Util.winForm("已经存在"));
		}
		request.getRequestDispatcher("houtai.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
