package General;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Addfir
 */
@WebServlet("/Addfir")
public class Addfir extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String dist=request.getParameter("dist");
		String polstation=request.getParameter("polstation");
		String date=request.getParameter("date");
		String firno=request.getParameter("firno");
		String systime=request.getParameter("systime");
		String realtime=request.getParameter("realtime");
		String acts=request.getParameter("acts");
		String sect=request.getParameter("sect");
		String comname=request.getParameter("comname");
		String fatname=request.getParameter("fatname");
		String dob=request.getParameter("dob");
		String uidno=request.getParameter("uidno");
		String passno=request.getParameter("passno");
		String doi=request.getParameter("doi");
		String curadd=request.getParameter("curadd");
		String peradd=request.getParameter("peradd");
		String aname=request.getParameter("aname");
		String alias=request.getParameter("alias");
		String rname=request.getParameter("rname");
		String acuradd=request.getParameter("acuradd");
		String fir=request.getParameter("fir");
		
		Firdata f=new Firdata(dist,polstation,date,firno,systime,realtime,acts,sect,comname,fatname,dob,uidno,passno,doi,curadd,peradd,aname,alias,rname,acuradd,fir);
		QueryLayer q= new QueryLayer();
		try {
			if(q.insertFir(f)>0)
			{
				System.out.println("success");
				response.sendRedirect("adminDashboard.jsp");
			}
			else
				System.out.println("failure");
				
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
			
		}
	}

}
