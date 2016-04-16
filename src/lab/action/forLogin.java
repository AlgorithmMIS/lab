package lab.action;

import lab.db.*;
import lab.format.Util;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class forLogin
 */
@WebServlet("/forLogin")
public class forLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public forLogin() {
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
		String usename = request.getParameter("name");
		String password = request.getParameter("pass");
		System.out.println(usename + password);
		String sql = "select * from login where usename=? and password=?";
		DbCon dbc = new DbCon();
		ResultSet res = dbc.doQuery(sql, new Object[] { usename, password });
		boolean mark = false;
		try {
			while (res.next()) {
				mark = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf8");
		System.out.println("1");
		if (mark) {
			request.getRequestDispatcher("houtai.jsp").forward(request, response);
		} else {
			System.out.println("hello,wold");
			request.setAttribute("message", Util.winForm("用户名或密码错误"));
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
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
