package forgotPassword;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import General.QueryLayer;
import signup.Signup;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet({"/ForgotPassword","/checkOTP","/changePassword"})
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String str = request.getRequestURL().toString();
		if(str!=null)
			str = str.substring(str.lastIndexOf("/"));
		else
			response.sendRedirect("error.jsp");
		HttpSession session = request.getSession();
		switch(str) {
		case "/ForgotPassword" :
			String aadhar = request.getParameter("aadhar");
			
			session.setAttribute("aadhar", aadhar);
			QueryLayer q = new QueryLayer();
			try {
				System.out.println("aadhar : "+aadhar);
				String failure = q.getFailure(aadhar);
				if(failure=="password") {
					String con_no = q.getContactNumber(aadhar);
					String otp = "1234";//String.valueOf(Signup.getRandomInteger(1000, 10000));
					//Signup.sendSms(con_no, "We have received request to reset your password!OTP is "+otp);
			        session.setAttribute("otp", otp);
					JOptionPane.showMessageDialog(null, "OTP IS SENT TO YOUR PHONE NUMBER *******"+con_no.substring(7, 10)+". Assocoiated to "+aadhar,"OTP SENT", JOptionPane.INFORMATION_MESSAGE);
					RequestDispatcher rd = request.getRequestDispatcher("forgotOTP.jsp");
					rd.forward(request, response);
				}
				else
				{
					JOptionPane.showMessageDialog(null, "No Account Found to this aadhar number\nCheck aadhar number","Account Not Found", JOptionPane.INFORMATION_MESSAGE);
					response.sendRedirect("forgotPass.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case "/checkOTP":	
			String tempotp = request.getParameter("otp");
			String otp = session.getAttribute("otp").toString();
			System.out.println("tempOTP :"+tempotp);
			System.out.println("otp : "+otp);
			if(otp.equals(tempotp))
			{
				RequestDispatcher rd = request.getRequestDispatcher("changePassword.jsp");
				rd.forward(request, response);
			}else {
				JOptionPane.showMessageDialog(null, "You have entered wrong OTP","OTP Failure", JOptionPane.INFORMATION_MESSAGE);
			}
			break;
			
		case "/changePassword":
			String password = request.getParameter("password");
			aadhar = session.getAttribute("aadhar").toString();
			q = new QueryLayer();
			try {
				int state = q.changePassword(aadhar,password);
				JOptionPane.showMessageDialog(null, "Your Password has been successfully changed","Password Success", JOptionPane.INFORMATION_MESSAGE);
				response.sendRedirect("login.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		}
		
	}

}
