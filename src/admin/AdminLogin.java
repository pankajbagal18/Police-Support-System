package admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import General.QueryLayer;
import signup.Signupdata;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AdminLogin" })
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String aadhar = request.getParameter("aadhar");
		String password = request.getParameter("password");
		QueryLayer q = new QueryLayer();
		try {
			if(q.checkLogin(aadhar,password)) {
				HttpSession session = request.getSession();
				Signupdata data = q.getUserProfile(aadhar);
				System.out.println("in login name "+data.getName());
				session.setAttribute("admin", data);
				response.sendRedirect("adminDashboard.jsp");
			}
			else {
				response.sendRedirect("error.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
