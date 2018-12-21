package dashboard;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.corba.se.spi.orbutil.fsm.Input;

import General.QueryLayer;
import signup.Signupdata;

@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String aadhar = request.getParameter("aadhar");
		//HttpSession session = request.getSession();
		//Signupdata data = (Signupdata)session.getAttribute("user");
		//InputStream input = data.getPhotoStream();
		OutputStream output = response.getOutputStream();
		response.setContentType("image/*");
		QueryLayer q = new QueryLayer();
		Blob image = null;
		byte[] imgdata = null;
		try {

			image = q.getPhotoBlob(aadhar);
			System.out.println(image);
			System.out.println(aadhar);
			imgdata = image.getBytes(1, (int)image.length());
			output.write(imgdata);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
