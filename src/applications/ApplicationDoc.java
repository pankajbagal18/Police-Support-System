package applications;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import General.QueryLayer;
@WebServlet({"/addapplication"})
@MultipartConfig(maxFileSize = 16177215)
public class ApplicationDoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String typeOfDoc = request.getParameter("typeOfDoc");
		switch(typeOfDoc) {
		case "PG":
			insertInPG(request,response,typeOfDoc);
			break;
		case "Clearance":
			insertInClearance(request,response,typeOfDoc);
			break;
		case "Employement":
			insertInEmp(request,response,typeOfDoc);
			break;
			
		case "Passport":
			insertInPassport(request,response,typeOfDoc);
			break;
		default:
			response.sendRedirect("dashboard.jsp");
		}
		response.sendRedirect("dashboard.jsp");
	}
	
	

	protected void insertInPG(HttpServletRequest request, HttpServletResponse response,String type) throws ServletException, IOException {
		String application_id = request.getParameter("application_id");
		String aadhar = request.getParameter("aadhar");
		String pg_agreement = request.getParameter("pg-agreement");
		String pg_aadhar_card = request.getParameter("pg-aadhar-card");
		String pg_ssc_cert = request.getParameter("pg-ssc");
		String pg_hsc_cert = request.getParameter("pg-hsc");
		String pg_light_bill = request.getParameter("pg-light-bill");
		Part[] p = new Part[5];
		p[0] =  request.getPart("pg-agreement");
		p[1] = request.getPart("pg-aadhar-card");
		p[2] = request.getPart("pg-ssc");
		p[3] = request.getPart("pg-hsc");
		p[4] = request.getPart("pg-light-bill");
		String desc = request.getParameter("desc");
		ApplicationData data = new ApplicationData();
		data.setAadhar(aadhar);
		data.setAppId(application_id);
		data.setDesc(desc);
		data.setType(type);
		data.setParts(p);
		QueryLayer q = new QueryLayer();
		try {
			q.insertApplication(data);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(application_id);
		System.out.println(aadhar);
		System.out.println(pg_agreement);
		System.out.println(pg_aadhar_card);
		System.out.println(pg_ssc_cert);
		System.out.println(pg_hsc_cert);
		System.out.println(pg_light_bill);
	}
	protected void insertInClearance(HttpServletRequest request, HttpServletResponse response,String type) throws ServletException, IOException {
		String application_id = request.getParameter("application_id");
		String aadhar = request.getParameter("aadhar");
		String lc = request.getParameter("clear-lc");
		String aadhar_card = request.getParameter("clear-aadhar-card");
		String ssc_cert = request.getParameter("clear-ssc");
		String hsc_cert = request.getParameter("clear-hsc");
		Part[] p = new Part[4];
		p[0] =  request.getPart("clear-lc");
		p[1] = request.getPart("clear-aadhar-card");
		p[2] = request.getPart("clear-ssc");
		p[3] = request.getPart("clear-hsc");
		String desc = request.getParameter("desc");
		ApplicationData data = new ApplicationData();
		data.setAadhar(aadhar);
		data.setAppId(application_id);
		data.setDesc(desc);
		data.setType(type);
		data.setParts(p);
		QueryLayer q = new QueryLayer();
		try {
			q.insertApplication(data);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void insertInEmp(HttpServletRequest request, HttpServletResponse response, String type) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String application_id = request.getParameter("application_id");
		String aadhar = request.getParameter("aadhar");
		String salary_cert = request.getParameter("emp-salary-cert");
		String id_card = request.getParameter("emp-id-card");
		String ssc_cert = request.getParameter("clear-ssc");
		String hsc_cert = request.getParameter("clear-hsc");
		Part[] p = new Part[3];
		p[0] =  request.getPart("emp-salary-cert");
		p[1] = request.getPart("emp-id-card");
		p[2] = request.getPart("emp-birth-cert");
		String desc = request.getParameter("desc");
		ApplicationData data = new ApplicationData();
		data.setAadhar(aadhar);
		data.setAppId(application_id);
		data.setDesc(desc);
		data.setType(type);
		data.setParts(p);
		QueryLayer q = new QueryLayer();
		try {
			q.insertApplication(data);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void insertInPassport(HttpServletRequest request, HttpServletResponse response, String type) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String application_id = request.getParameter("application_id");
		String aadhar = request.getParameter("aadhar");
		String salary_cert = request.getParameter("emp-salary-cert");
		String id_card = request.getParameter("emp-id-card");
		String ssc_cert = request.getParameter("clear-ssc");
		String hsc_cert = request.getParameter("clear-hsc");
		Part[] p = new Part[5];
		p[0] =  request.getPart("pass-birth-cert");
		p[1] = request.getPart("pass-aadhar");
		p[2] = request.getPart("pass-lc");
		p[3] = request.getPart("pass-agreement");
		p[4] = request.getPart("clearance-cert");
		String desc = request.getParameter("desc");
		ApplicationData data = new ApplicationData();
		data.setAadhar(aadhar);
		data.setAppId(application_id);
		data.setDesc(desc);
		data.setType(type);
		data.setParts(p);
		QueryLayer q = new QueryLayer();
		try {
			q.insertApplication(data);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
