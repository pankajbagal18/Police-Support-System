package location;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
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
 * Servlet implementation class GetNearPoliceLocation
 */
@WebServlet("/GetNearPoliceLocation")
public class GetNearPoliceLocation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int locationid=-1;
		try {
			locationid = location(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		session.setAttribute("locationid", locationid);
	
		RequestDispatcher rd = request.getRequestDispatcher("showLocation.jsp");
		rd.forward(request, response);
	}
	
	private int location(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		double min1=99999.999999999,dista;
		int min;
		double tlat=Double.parseDouble(request.getParameter("lat"));
		double tlong=Double.parseDouble(request.getParameter("lang"));
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
	//Haversine formula to calculate nearest police station
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
