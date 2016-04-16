package lab.action;

import lab.bean.*;
import lab.db.DbCon;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class findPaper
 */
@WebServlet("/findPaper")
public class findPaper extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public findPaper() {
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
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		String academy_name = request.getParameter("academy_name");
		String category = request.getParameter("category");
		request.setAttribute("name", academy_name);
		request.setAttribute("category", category);
		System.out.println(academy_name + category);
		ArrayList<PaperInfor> res = new ArrayList<PaperInfor>();
		DbCon dbc = new DbCon();
		String sql = "select title,published,issn,count,univ "
				+ "from paperinfor,abbreviation_tbl,academy_paper_tbl,count_tbl "
				+ " where paperinfor.accession=count_tbl.accession "
				+ "and paperinfor.accession=accs and abbreviation_id=abbr_id "
				+ "and academy_name=? and category=?;";
		ResultSet dbcans = dbc.doQuery(sql, new Object[] { academy_name, category });
		try {
			while (dbcans.next()) {
				PaperInfor tmp = new PaperInfor();
				tmp.setCount(dbcans.getInt("count"));
				tmp.setIssn(dbcans.getString("issn"));
				tmp.setPublish(dbcans.getString("published"));
				tmp.setTitle(dbcans.getString("title"));
				res.add(tmp);
			//	System.out.println(tmp.toString());
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("result", res);
		request.getRequestDispatcher("lunwenchaxun.jsp").forward(request, response);
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
