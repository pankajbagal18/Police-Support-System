package location;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import General.QueryLayer;

/**
 * Servlet implementation class CheckEmergencyOtp
 */
@WebServlet("/CheckEmergencyOtp")
public class CheckEmergencyOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String testotp = request.getParameter("otp").trim();
		HttpSession session = request.getSession();
		String otp = session.getAttribute("otp").toString();
		System.out.println("testotp :- "+testotp);
		System.out.println("otp :- "+otp);
		String no = session.getAttribute("no").toString();
		System.out.println("no :- "+no);
		String lat = session.getAttribute("lat").toString();
		String lang = session.getAttribute("lang").toString();
		String address = session.getAttribute("address").toString();
		if(otp.equals(testotp))
		{
			int locationid=-1;
			try {
				locationid = location(request,response);
				QueryLayer q = new QueryLayer();
				int state = q.sendEmergencyComplaint(no,address,lat,lang);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("locationid", locationid);
			RequestDispatcher rd = request.getRequestDispatcher("showLocation.jsp");//request.getRequestDispatcher("index.html");//
			rd.forward(request, response);
		}
		else
		{
			response.sendRedirect("error.jsp");
		}
	}
	
	
	private int location(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		double min1=99999.999999999,dista;
		int min;
		HttpSession session = request.getSession();
		double tlat=Double.parseDouble(session.getAttribute("lat").toString());
		double tlong=Double.parseDouble(session.getAttribute("lang").toString());
		min=0;
		QueryLayer q = new QueryLayer();
		ResultSet res = null;
		try {
			res = q.getLocations();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		while(res.next()) {
			dista=dist(tlat,tlong,Double.parseDouble(res.getString("lat")),Double.parseDouble(res.getString("long")));
			///System.out.println("Point" + i +"   " +lat[i] +"    "+ longi[i] +"   Distance "+dista);
			if(dista<min1)
			{
				min1=dista;
				try {
					min=res.getInt("id");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		System.out.println("min :- "+min);
		System.out.println("\n\nMinimum distance is " + min1);
		return min;
	}
	
	private static Double dist(double lat1,double lon1,double lat2,double lon2) {
		final int R = 6371;
		Double latDistance = toRad(lat2-lat1);
        Double lonDistance = toRad(lon2-lon1);
        Double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2) + 
                   Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * 
                   Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
        Double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        Double distance = R * c;
        return distance;
	}
	
	private static Double toRad(Double value) {
        return value * Math.PI / 180;
    }


}
