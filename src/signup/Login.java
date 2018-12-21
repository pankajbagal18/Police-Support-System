package signup;

import java.io.IOException;
import javax.swing.JOptionPane;

import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import General.QueryLayer;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String aadhar = request.getParameter("aadhar");
		String password = request.getParameter("password");
		QueryLayer q = new QueryLayer();
		try {
			if(q.checkLogin(aadhar,password)) {
				HttpSession session = request.getSession();
				Signupdata data = q.getUserProfile(aadhar);
				System.out.println("in login name "+data.getName());
				session.setAttribute("user", data);
				response.sendRedirect("dashboard.jsp");
			}
			else {
				String reason = q.getFailure(aadhar);
				if(reason=="password")
				{
			        JOptionPane.showMessageDialog(null, "You have entered wrong password","LOGIN FAILED", JOptionPane.INFORMATION_MESSAGE);
				}
				else {
					JOptionPane.showMessageDialog(null, "You have entered wrong password or aadhar number","LOGIN FAILED", JOptionPane.INFORMATION_MESSAGE);
				}
				response.sendRedirect("login.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
