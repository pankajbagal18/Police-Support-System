package signup;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

import General.QueryLayer;

/**
 * Servlet implementation class Signup
 */





/**
 * Servlet implementation class Signup
 */
@WebServlet(
		asyncSupported = true, 
		urlPatterns = { 
				"/Signup", 
				"/OTP",
				"/SignupInsert"
		})
@MultipartConfig(maxFileSize = 16177215)
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String str = request.getRequestURL().toString();
		if(str!=null)
			str = str.substring(str.lastIndexOf("/"));
		else
			response.sendRedirect("error.jsp");
		System.out.println(str);
		switch(str) {
		
		case "/Signup":
			try {
				sendOTP(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}
			break;
			
		case "/OTP":
			try {
				checkOTP(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}
			break;
			
		case "/SignupInsert":
			try {
				signupInsert(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}
			break;
		default:
			response.sendRedirect("error.jsp");
		}
		
	}
	
	
	public void sendOTP(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String aadhar = request.getParameter("aadhar");
		String conNo = request.getParameter("con_no");
		String otp = "1234";//String.valueOf((getRandomInteger(1000,10000)));
		String msg = "Your OTP for Police Support System verification is "+otp;
		//sendSms(conNo,msg);
		Signupdata data = new Signupdata();
		data.setAadhar(aadhar);
		data.setCon_no(conNo);
		data.setOtp(otp);
		HttpSession session = request.getSession();
		session.setAttribute("signupData",data);
		System.out.println("otp : "+otp);
		RequestDispatcher rd = request.getRequestDispatcher("otp.jsp");
		rd.forward(request, response);
	}
	
	public static String sendSms(String con_no,String msg) {
		//Your authentication key
        String authkey = "242157A3srxsSlIm5bc5847a";
        //Multiple mobiles numbers separated by comma
        String mobiles = "91"+con_no;
        //Sender ID,While using route4 sender id should be 6 characters long.
        String senderId = "102234";
        //Your message to send, Add URL encoding here.
        String message = msg;
        //define route
        String route="OTP";

        //Prepare Url
        URLConnection myURLConnection=null;
        URL myURL=null;
        BufferedReader reader=null;

        //encoding message
        String encoded_message=URLEncoder.encode(message);

        //Send SMS API
        String mainUrl="http://api.msg91.com/api/sendhttp.php?";

        //Prepare parameter string
        StringBuilder sbPostData= new StringBuilder(mainUrl);
        sbPostData.append("authkey="+authkey);
        sbPostData.append("&mobiles="+mobiles);
        sbPostData.append("&message="+encoded_message);
        sbPostData.append("&route="+route);
        sbPostData.append("&sender="+senderId);

        //final string
        mainUrl = sbPostData.toString();
        try
        {
            //prepare connection
            myURL = new URL(mainUrl);
            myURLConnection = myURL.openConnection();
            myURLConnection.connect();
            reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
            //reading response
            String response;
            while ((response = reader.readLine()) != null)
            //print response
            System.out.println(response);

            //finally close connection
            reader.close();
        }
        catch (IOException e)
        {
                e.printStackTrace();
        }
        return "done";
    }
//		try {
//			// Construct data
//			String apiKey = "apikey=" + "n2UNoZdHE1w-LpiYWKIDn5FYj1P4pSNeaEA5VQ5l7e";
//			String otp = String.valueOf(getRandomInteger(1000,10000));
//			String message = "&message=" + "Your OPT for POLICE SUPPORT SYSTEM verification is "+otp;
//			String sender = "&sender=" + "TXTLCL";
//			String numbers = "&numbers=" + "91"+con_no;
//			// Send data
//			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
//			String data = apiKey + numbers + message + sender;
//			conn.setDoOutput(true);
//			conn.setRequestMethod("POST");
//			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
//			conn.getOutputStream().write(data.getBytes("UTF-8"));
//			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			final StringBuffer stringBuffer = new StringBuffer();
//			String line;
//			while ((line = rd.readLine()) != null) {
//				stringBuffer.append(line);
//			}
//			System.out.println(stringBuffer);
//			rd.close();
//			
//			return otp;
//		} catch (Exception e) {
//			System.out.println("Error SMS "+e);
//			return "Error "+e;
//		}
	
	public static int getRandomInteger(int maximum, int minimum){ return ((int) (Math.random()*(maximum - minimum))) + minimum; }

	public void checkOTP(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		HttpSession session = request.getSession();
		Signupdata data = (Signupdata)session.getAttribute("signupData");
		String tempOtp = request.getParameter("otp");
		System.out.println("temp otp : "+tempOtp);
		System.out.println("data : "+data.getOtp());
		if(tempOtp.equals(data.getOtp())){
			//sent otp and inout otp matches 
			//now fill whole form
			data.setOtp("");
			session.removeAttribute("signupData");
			session.setAttribute("signupData", data);
			System.out.println("in if");
			response.sendRedirect("signupForm.jsp");
		}
		else{
			//given otp sent otp does not matches
			response.sendRedirect("otp.jsp");
		}	
	}
	public void signupInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession();
		Signupdata data = (Signupdata)session.getAttribute("signupData");
		data.setAddress(request.getParameter("address"));
		data.setDob(request.getParameter("dob"));
		String fullName = request.getParameter("fname")+" "+request.getParameter("mname")+" "+request.getParameter("lname");
		data.setName(fullName);
		data.setGender(request.getParameter("gender"));
		System.out.println(data.getGender());
		data.setEmail(request.getParameter("email"));
		data.setPassword(request.getParameter("c_password"));
		Part part = request.getPart("photo");
		if(part!=null) {
			System.out.println(part.getName());
			System.out.println(part.getSize());
			System.out.println(part.getContentType());
			data.setPhotoStream(part.getInputStream());
			data.setPhotoSize((int)part.getSize());
		}
		
		QueryLayer q = new QueryLayer();
		try {
			q.insertUser(data);
			q.sendWelcomeMessage(data.getAadhar());
			session.removeAttribute("signupData");
			Signupdata data1=null;
			data1 = q.getUserProfile(data.getAadhar());
			session.setAttribute("user", data1);
			System.out.println("here");
			response.sendRedirect("dashboard.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			response.sendRedirect("error.jsp");
		}
	}
}
