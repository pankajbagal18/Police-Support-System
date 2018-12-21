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

/**
 * Servlet implementation class SendStatus
 */
@WebServlet("/SendStatus")
public class SendStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String query = request.getParameter("query");
		switch(query) {
		case "msg":
			sendMessage(request,response);
			break;
			
		case "appointment":
			try {
				doAppointment(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		
		default:
			
		}
	}
	
	
	public void sendMessage(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String msg = request.getParameter("msg").trim();
		QueryLayer q = new QueryLayer();
		HttpSession session = request.getSession();
		String towhom = session.getAttribute("towhom").toString().trim();
		String fromwhom = session.getAttribute("fromwhom").toString().trim();
		String appId = session.getAttribute("appId").toString();
		int status = Integer.parseInt(request.getParameter("status"));
		int maxdoc = Integer.parseInt(request.getParameter("maxdoc"));
		int messageid = 1;
		try {
			System.out.println("status :- "+status);
			System.out.println("maxdoc :- "+maxdoc);
			q.sendMSG(towhom,fromwhom,appId,messageid,msg);
			float progress = (status*100)/maxdoc;
			System.out.println("progress :- "+progress);
			q.sendStatus(appId,(int)progress);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.removeAttribute("towhom");
		session.removeAttribute("fromwhom");
		session.removeAttribute("appId");
		response.sendRedirect("adminDashboard.jsp");
	}
	public void doAppointment(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException{
		String msg = request.getParameter("msg");
		String date = request.getParameter("date");
		QueryLayer q = new QueryLayer();
		HttpSession session = request.getSession();
		String towhom = session.getAttribute("towhom").toString().trim();
		String fromwhom = session.getAttribute("fromwhom").toString().trim();
		String appId = session.getAttribute("appId").toString();
		q.makeAppointment(appId,msg,date);
		q.sendMSG(towhom, fromwhom, appId, 0, msg);
		session.removeAttribute("towhom");
		session.removeAttribute("fromwhom");
		session.removeAttribute("appId");
		response.sendRedirect("adminDashboard.jsp");
	}

}
