package location;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class GetPhoneNo
 */
@WebServlet({"/getPhoneNo"})
public class GetPhoneNo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String no = request.getParameter("phone");
		String address = request.getParameter("address");
		String otp = "1234";//String.valueOf((getRandomInteger(1000,10000)));;
		//sendSms(no,"Your OTP for Police Support System Emeregency Complaint facility is "+otp);
		HttpSession session = request.getSession();
 		session.setAttribute("no", no);
		session.setAttribute("otp", otp);
		session.setAttribute("address", address);
 		System.out.println("lat :- "+session.getAttribute("lat"));
 		System.out.println("address :- "+address);
 		RequestDispatcher rd = request.getRequestDispatcher("emergencyOtp.jsp");
 		rd.forward(request, response);
	}

	public static String sendSms(String con_no,String msg) {
		//Your authentication key
        String authkey = "242157AFmJKpqmM60z5bbe12b2";
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

	public static int getRandomInteger(int maximum, int minimum){ return ((int) (Math.random()*(maximum - minimum))) + minimum; }
}
